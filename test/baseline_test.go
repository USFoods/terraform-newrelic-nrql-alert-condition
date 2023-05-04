package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBaselineConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/baseline",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get module output for policy name, policy id, name, critical, warning, type, baseline direction, and tags
	outputPolicyName := terraform.Output(t, terraformOptions, "policy_name")
	outputPolicyID := terraform.Output(t, terraformOptions, "policy_id")

	outputName := terraform.Output(t, terraformOptions, "name")
	outputConditionPolicyID := terraform.Output(t, terraformOptions, "condition_policy_id")

	outputCriticalOperator := terraform.Output(t, terraformOptions, "critical_operator")
	outputCriticalThreshold := terraform.Output(t, terraformOptions, "critical_threshold")
	outputCriticalThresholdDuration := terraform.Output(t, terraformOptions, "critical_threshold_duration")
	outputCriticalThresholdOccurrences := terraform.Output(t, terraformOptions, "critical_threshold_occurrences")

	outputWarningOperator := terraform.Output(t, terraformOptions, "warning_operator")
	outputWarningThreshold := terraform.Output(t, terraformOptions, "warning_threshold")
	outputWarningThresholdDuration := terraform.Output(t, terraformOptions, "warning_threshold_duration")
	outputWarningThresholdOccurrences := terraform.Output(t, terraformOptions, "warning_threshold_occurrences")

	outputType := terraform.Output(t, terraformOptions, "type")
	outputBaselineDirection := terraform.Output(t, terraformOptions, "baseline_direction")

	outputTags := terraform.Output(t, terraformOptions, "tags")

	// Assert policy name is Baseline Policy
	assert.Equal(t, "Baseline Policy", outputPolicyName)
	// Assert policy id is the same as the condition policy id
	assert.Equal(t, outputPolicyID, outputConditionPolicyID)
	// Assert name is Baseline NRQL Alert Condition
	assert.Equal(t, "Baseline NRQL Alert Condition", outputName)
	// Assert critical operator is above
	assert.Equal(t, "above", strings.ToLower(outputCriticalOperator))
	// Assert critical threshold is 5
	assert.Equal(t, "5", outputCriticalThreshold)
	// Assert critical threshold duration is 180
	assert.Equal(t, "180", outputCriticalThresholdDuration)
	// Assert critical threshold occurrences is all
	assert.Equal(t, "all", strings.ToLower(outputCriticalThresholdOccurrences))
	// Assert warning operator is empty
	assert.Equal(t, "", strings.ToLower(outputWarningOperator))
	// Assert warning threshold is empty
	assert.Equal(t, "", outputWarningThreshold)
	// Assert warning threshold duration is empty
	assert.Equal(t, "", outputWarningThresholdDuration)
	// Assert warning threshold occurrences is empty
	assert.Equal(t, "", strings.ToLower(outputWarningThresholdOccurrences))
	// Assert type is baseline
	assert.Equal(t, "baseline", outputType)
	// Assert baseline direction is upper_and_lower
	assert.Equal(t, "upper_and_lower", outputBaselineDirection)

	// Define expected tags
	expectedTags := map[string]string{
		"Origin": "Terraform",
	}

	// Assert module tags match expected tags
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
}
