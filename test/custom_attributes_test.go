package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCustomAttributesConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/custom_attributes",
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

	// Get module output for description, runbook_url, aggregation_window, aggregation_delay, expiration_duration, open_violation_on_expiration, and close_violations_on_expiration
	outputDescription := terraform.Output(t, terraformOptions, "description")
	outputRunbookURL := terraform.Output(t, terraformOptions, "runbook_url")
	outputAggregationWindow := terraform.Output(t, terraformOptions, "aggregation_window")
	outputAggregationDelay := terraform.Output(t, terraformOptions, "aggregation_delay")
	outputExpirationDuration := terraform.Output(t, terraformOptions, "expiration_duration")
	outputOpenViolationOnExpiration := terraform.Output(t, terraformOptions, "open_violation_on_expiration")
	outputCloseViolationsOnExpiration := terraform.Output(t, terraformOptions, "close_violations_on_expiration")

	// Assert policy name is Custom Attributes Policy
	assert.Equal(t, "Custom Attributes Policy", outputPolicyName)
	// Assert policy id matches condition policy id
	assert.Equal(t, outputPolicyID, outputConditionPolicyID)
	// Assert name is Custom Attributes NRQL Alert Condition
	assert.Equal(t, "Custom Attributes NRQL Alert Condition", outputName)
	// Assert critical operator is above
	assert.Equal(t, "above", strings.ToLower(outputCriticalOperator))
	// Assert critical threshold is 1000
	assert.Equal(t, "1000", outputCriticalThreshold)
	// Assert critical threshold duration is 1200
	assert.Equal(t, "1200", outputCriticalThresholdDuration)
	// Assert critical threshold occurrences is all
	assert.Equal(t, "all", strings.ToLower(outputCriticalThresholdOccurrences))
	// Assert warning operator is above
	assert.Equal(t, "above", strings.ToLower(outputWarningOperator))
	// Assert warning threshold is 500
	assert.Equal(t, "500", outputWarningThreshold)
	// Assert warning threshold duration is 1800
	assert.Equal(t, "1800", outputWarningThresholdDuration)
	// Assert warning threshold occurrences is all
	assert.Equal(t, "all", strings.ToLower(outputWarningThresholdOccurrences))
	// Assert type is static
	assert.Equal(t, "static", strings.ToLower(outputType))
	// Assert description is Alerts on average duration for transactions
	assert.Equal(t, "Alerts on average duration for transactions", outputDescription)
	// Assert runbook url is https://docs.newrelic.com/docs/apm/transactions/intro-transactions/transactions-new-relic-apm/
	assert.Equal(t, "https://docs.newrelic.com/docs/apm/transactions/intro-transactions/transactions-new-relic-apm/", outputRunbookURL)
	// Assert aggregation window is 300
	assert.Equal(t, "300", outputAggregationWindow)
	// Assert aggregation delay is 300
	assert.Equal(t, "300", outputAggregationDelay)
	// Assert expiration duration is 600
	assert.Equal(t, "600", outputExpirationDuration)
	// Assert open violation on expiration is true
	assert.Equal(t, "true", strings.ToLower(outputOpenViolationOnExpiration))
	// Assert close violations on expiration is true
	assert.Equal(t, "true", strings.ToLower(outputCloseViolationsOnExpiration))
	// Define expected tags
	expectedTags := map[string]string{
		"app.code": "testapp",
		"app.id":   "1234",
		"env":      "nonprod",
		"Origin":   "Terraform",
	}
	// Assert module tags match expected tags
	assert.Equal(t, fmt.Sprint(expectedTags), outputTags)
}
