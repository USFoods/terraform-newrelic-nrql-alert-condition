# Terraform New Relic NRQL Alert Condition Module

This module handles opinion New Relic NRQL Alert Condition creation and configuration.

## Compatability

This module is meant for use with Terraform 1.0+ and tested using Terraform 1.3+.
If you find incompatibilities using Terraform `>=1.0`, please open an issue.

## Usage

There are multiple examples included in the [examples](https://github.com/usfoods/terraform-nr-nrql-alert-condition/tree/master/examples) folder but simple usage is as follows:

```hcl
provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Basic Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

// This is the bare minimum configuration required
module "main" {
  source = "usfoods/nrql-alert-condition/newrelic"

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Basic Critical NRQL Alert Condition"
  enabled    = var.enabled

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 1000
    threshold_duration = 180
  }
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~>3.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~>3.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_entity_tags.this](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_nrql_alert_condition.this](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The New Relic account ID of the account you wish to create the condition | `string` | n/a | yes |
| <a name="input_aggregation_delay"></a> [aggregation\_delay](#input\_aggregation\_delay) | How long we wait for data that belongs in each aggregation window | `number` | `120` | no |
| <a name="input_aggregation_method"></a> [aggregation\_method](#input\_aggregation\_method) | Determines when we consider an aggregation window to be complete so that we can evaluate the signal for incidents | `string` | `"event_flow"` | no |
| <a name="input_aggregation_timer"></a> [aggregation\_timer](#input\_aggregation\_timer) | How long we wait after each data point arrives to make sure we've processed the whole batch | `number` | `null` | no |
| <a name="input_aggregation_window"></a> [aggregation\_window](#input\_aggregation\_window) | The duration of the time window used to evaluate the NRQL query, in seconds | `number` | `60` | no |
| <a name="input_baseline_direction"></a> [baseline\_direction](#input\_baseline\_direction) | The baseline direction of a baseline NRQL alert condition | `string` | `null` | no |
| <a name="input_close_violations_on_expiration"></a> [close\_violations\_on\_expiration](#input\_close\_violations\_on\_expiration) | Whether to close all open incidents when the signal expires | `bool` | `false` | no |
| <a name="input_critical"></a> [critical](#input\_critical) | The critical violation threshold values | <pre>object({<br>    operator              = optional(string, "ABOVE")<br>    threshold             = number<br>    threshold_duration    = number<br>    threshold_occurrences = optional(string, "ALL")<br>  })</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the NRQL alert condition | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to enable the alert condition | `bool` | `false` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | How long we wait until the signal starts evaluating | `number` | `null` | no |
| <a name="input_expiration_duration"></a> [expiration\_duration](#input\_expiration\_duration) | The amount of time (in seconds) to wait before considering the signal expired | `number` | `900` | no |
| <a name="input_fill_option"></a> [fill\_option](#input\_fill\_option) | Which strategy to use when filling gaps in the signal | `string` | `"none"` | no |
| <a name="input_fill_value"></a> [fill\_value](#input\_fill\_value) | This value will be used for filling gaps in the signal | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The title of the condition | `string` | n/a | yes |
| <a name="input_open_violation_on_expiration"></a> [open\_violation\_on\_expiration](#input\_open\_violation\_on\_expiration) | Whether to create a new incident to capture that the signal expired | `bool` | `false` | no |
| <a name="input_policy_id"></a> [policy\_id](#input\_policy\_id) | The ID of the policy where this condition should be used | `string` | n/a | yes |
| <a name="input_query"></a> [query](#input\_query) | The NRQL query to execute for the condition | `string` | n/a | yes |
| <a name="input_runbook_url"></a> [runbook\_url](#input\_runbook\_url) | Runbook URL to display in notifications | `string` | `""` | no |
| <a name="input_slide_by"></a> [slide\_by](#input\_slide\_by) | Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags associated with the alert condition | `map(list(string))` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of the condition | `string` | `"static"` | no |
| <a name="input_violation_time_limit_seconds"></a> [violation\_time\_limit\_seconds](#input\_violation\_time\_limit\_seconds) | Sets a time limit, in seconds, that will automatically force-close a long-lasting incident after the time limit you select | `number` | `86400` | no |
| <a name="input_warning"></a> [warning](#input\_warning) | The warning violation threshold values | <pre>object({<br>    operator              = optional(string, "ABOVE")<br>    threshold             = number<br>    threshold_duration    = number<br>    threshold_occurrences = optional(string, "ALL")<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The New Relic account ID of the account you wish to create the condition |
| <a name="output_aggregation_delay"></a> [aggregation\_delay](#output\_aggregation\_delay) | How long we wait for data that belongs in each aggregation window |
| <a name="output_aggregation_method"></a> [aggregation\_method](#output\_aggregation\_method) | When we consider an aggregation window to be complete so that we can evaluate the signal for incidents |
| <a name="output_aggregation_timer"></a> [aggregation\_timer](#output\_aggregation\_timer) | How long we wait after each data point arrives to make sure we've processed the whole batch |
| <a name="output_aggregation_window"></a> [aggregation\_window](#output\_aggregation\_window) | The duration of the time window used to evaluate the NRQL query, in seconds |
| <a name="output_baseline_direction"></a> [baseline\_direction](#output\_baseline\_direction) | The baseline direction of a baseline NRQL alert condition |
| <a name="output_close_violations_on_expiration"></a> [close\_violations\_on\_expiration](#output\_close\_violations\_on\_expiration) | Whether to close all open incidents when the signal expires |
| <a name="output_critical_operator"></a> [critical\_operator](#output\_critical\_operator) | The operator used when evaluating the threshold |
| <a name="output_critical_threshold"></a> [critical\_threshold](#output\_critical\_threshold) | The value which will trigger an incident |
| <a name="output_critical_threshold_duration"></a> [critical\_threshold\_duration](#output\_critical\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_critical_threshold_occurrences"></a> [critical\_threshold\_occurrences](#output\_critical\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
| <a name="output_description"></a> [description](#output\_description) | The description of the NRQL alert condition |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Whether the alert condition is enabled |
| <a name="output_entity_guid"></a> [entity\_guid](#output\_entity\_guid) | The unique entity identifier of the NRQL Condition in New Relic |
| <a name="output_evaluation_delay"></a> [evaluation\_delay](#output\_evaluation\_delay) | How long we wait until the signal starts evaluating |
| <a name="output_expiration_duration"></a> [expiration\_duration](#output\_expiration\_duration) | The amount of time (in seconds) to wait before considering the signal expired |
| <a name="output_fill_option"></a> [fill\_option](#output\_fill\_option) | Which strategy to use when filling gaps in the signal |
| <a name="output_fill_value"></a> [fill\_value](#output\_fill\_value) | This value to use for filling gaps in the signal |
| <a name="output_id"></a> [id](#output\_id) | The ID of the NRQL alert condition |
| <a name="output_name"></a> [name](#output\_name) | The title of the condition |
| <a name="output_nrql_query"></a> [nrql\_query](#output\_nrql\_query) | The NRQL query executed for the condition |
| <a name="output_open_violation_on_expiration"></a> [open\_violation\_on\_expiration](#output\_open\_violation\_on\_expiration) | Whether to create a new incident to capture that the signal expired |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The ID of the policy where this condition is used |
| <a name="output_runbook_url"></a> [runbook\_url](#output\_runbook\_url) | Runbook URL to display in notifications |
| <a name="output_slide_by"></a> [slide\_by](#output\_slide\_by) | Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the alert condition |
| <a name="output_type"></a> [type](#output\_type) | The type of the condition |
| <a name="output_violation_time_limit_seconds"></a> [violation\_time\_limit\_seconds](#output\_violation\_time\_limit\_seconds) | The time limit, in seconds, that will automatically force-close a long-lasting incident |
| <a name="output_warning_operator"></a> [warning\_operator](#output\_warning\_operator) | The operator used when evaluating the threshold |
| <a name="output_warning_threshold"></a> [warning\_threshold](#output\_warning\_threshold) | The value which will trigger an incident |
| <a name="output_warning_threshold_duration"></a> [warning\_threshold\_duration](#output\_warning\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_warning_threshold_occurrences"></a> [warning\_threshold\_occurrences](#output\_warning\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
