package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicWarningConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/basic_warning",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get module output for policy name, policy id, name, critical, warning, type, and tags
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
	outputTags := terraform.Output(t, terraformOptions, "tags")

	// Assert policy name is Basic Warning Policy
	assert.Equal(t, "Basic Warning Policy", outputPolicyName)
	// Assert policy id matches condition policy id
	assert.Equal(t, outputPolicyID, outputConditionPolicyID)
	// Assert name is Basic Warning NRQL Alert Condition
	assert.Equal(t, "Basic Warning NRQL Alert Condition", outputName)
	// Assert critical operator is ABOVE
	assert.Equal(t, "ABOVE", outputCriticalOperator)
	// Assert critical threshold is 1000
	assert.Equal(t, "1000", outputCriticalThreshold)
	// Assert critical threshold duration is 180
	assert.Equal(t, "180", outputCriticalThresholdDuration)
	// Assert critical threshold occurrences is ALL
	assert.Equal(t, "all", outputCriticalThresholdOccurrences)
	// Assert warning operator is ABOVE
	assert.Equal(t, "ABOVE", outputWarningOperator)
	// Assert warning threshold is 500
	assert.Equal(t, "500", outputWarningThreshold)
	// Assert warning threshold duration is 180
	assert.Equal(t, "300", outputWarningThresholdDuration)
	// Assert warning threshold occurrences is ALL
	assert.Equal(t, "all", outputWarningThresholdOccurrences)
	// Assert type is static
	assert.Equal(t, "static", outputType)
	// Define expected tags
	expectedTags := map[string]string{
		"Origin": "Terraform",
	}

	// Assert module tags match expected tags
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)

}
