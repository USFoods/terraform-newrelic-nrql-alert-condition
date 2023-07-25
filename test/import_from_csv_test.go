package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestImportFromCsvConfiguration(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/import_from_csv",
		Vars: map[string]interface{}{
			"account_id": os.Getenv("NEW_RELIC_ACCOUNT_ID"),
			"enabled":    false,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Get module output for policy name
	outputPolicyName := terraform.Output(t, terraformOptions, "policy_name")

	// Assert policy name is Basic Critical Policy
	assert.Equal(t, "Imported from CSV Example", outputPolicyName)

	//Get the monitor output
	monitorOutput := terraform.OutputMapOfObjects(t, terraformOptions, "monitors")

	// Define expected monitor output
	expectedMonitors := map[string]interface{}{
		"Average CPU Utilization": map[string]interface{}{
			"enabled":            "false",
			"nrql_query":         "SELECT average(cpuPercent) FROM SystemSample FACET hostname",
			"critical_threshold": "90",
		},
		"Average Disk Utilization": map[string]interface{}{
			"enabled":            "false",
			"nrql_query":         "SELECT average(diskUsedPercent) FROM SystemSample FACET hostname",
			"critical_threshold": "60",
		},
		"Average Memory Utilization": map[string]interface{}{
			"enabled":            "false",
			"nrql_query":         "SELECT average(memoryUsedPercent) FROM SystemSample FACET hostame",
			"critical_threshold": "80",
		},
	}

	assert.Equal(t, expectedMonitors, monitorOutput)

	fmt.Print(monitorOutput)

}
