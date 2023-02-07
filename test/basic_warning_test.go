package test

import (
	"fmt"
	"os"
	"strings"
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

	// Get all output
	outputAll := terraform.OutputAll(t, terraformOptions)

	// We actuall want a map of strings, not interfaces
	output := map[string]string{}
	// Would be nice if this output was built into Terratest
	for k, v := range outputAll {
		output[k] = fmt.Sprintf("%v", v)
	}

	assert.Equal(t, "Basic Warning Policy", output["policy_name"])
	assert.Equal(t, output["policy_id"], output["module_policy_id"])
	assert.Equal(t, "Basic Warning NRQL Alert Condition", output["name"])

	assert.Equal(t, "above", strings.ToLower(output["critical_operator"]))
	assert.Equal(t, "1000", output["critical_threshold"])
	assert.Equal(t, "180", output["critical_threshold_duration"])
	assert.Equal(t, "all", strings.ToLower(output["critical_threshold_occurrences"]))

	assert.Equal(t, "above", strings.ToLower(output["warning_operator"]))
	assert.Equal(t, "500", output["warning_threshold"])
	assert.Equal(t, "300", output["warning_threshold_duration"])
	assert.Equal(t, "all", strings.ToLower(output["warning_threshold_occurrences"]))

	expected_tags := map[string]string{
		"Origin": "Terraform",
	}

	assert.Equal(t, output["tags"], fmt.Sprint(expected_tags))
}
