package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCustomTagsConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/custom_tags",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get map from policy output
	policyOutput := terraform.OutputMap(t, terraformOptions, "policy")
	moduleOutput := terraform.OutputMap(t, terraformOptions, "module")

	assert.Equal(t, "Custom Tags Policy", policyOutput["name"])
	assert.Equal(t, policyOutput["id"], moduleOutput["policy_id"])
	assert.Equal(t, "Custom Tags NRQL Alert Condition", moduleOutput["name"])

	assert.Equal(t, "above", strings.ToLower(moduleOutput["critical_operator"]))
	assert.Equal(t, "1000", moduleOutput["critical_threshold"])
	assert.Equal(t, "180", moduleOutput["critical_threshold_duration"])
	assert.Equal(t, "all", strings.ToLower(moduleOutput["critical_threshold_occurrences"]))

	assert.Equal(t, "", strings.ToLower(moduleOutput["warning_operator"]))
	assert.Equal(t, "", moduleOutput["warning_threshold"])
	assert.Equal(t, "", moduleOutput["warning_threshold_duration"])
	assert.Equal(t, "", strings.ToLower(moduleOutput["warning_threshold_occurrences"]))

	expected_tags := map[string]string{
		"app.code": "testapp",
		"app.id":   "1234",
		"env":      "nonprod",
		"Origin":   "Terraform",
	}

	assert.Equal(t, moduleOutput["tags"], fmt.Sprint(expected_tags))
}
