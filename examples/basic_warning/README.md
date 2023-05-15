# Basic Warning

Configuration in this directory creates an alert policy with a single associated NRQL alert condition.

The NRQL alert condition defines both a critical violation block and a warning violation block.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >=3.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >=3.14 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_main"></a> [main](#module\_main) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [newrelic_alert_policy.main](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The New Relic account ID of the account you wish to create the condition | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to enable the alert condition | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The New Relic account ID of the account you wish to create the condition |
| <a name="output_aggregation_delay"></a> [aggregation\_delay](#output\_aggregation\_delay) | How long we wait for data that belongs in each aggregation window |
| <a name="output_aggregation_method"></a> [aggregation\_method](#output\_aggregation\_method) | When we consider an aggregation window to be complete so that we can evaluate the signal for incidents |
| <a name="output_aggregation_timer"></a> [aggregation\_timer](#output\_aggregation\_timer) | How long we wait after each data point arrives to make sure we've processed the whole batch |
| <a name="output_aggregation_window"></a> [aggregation\_window](#output\_aggregation\_window) | The duration of the time window used to evaluate the NRQL query, in seconds |
| <a name="output_close_violations_on_expiration"></a> [close\_violations\_on\_expiration](#output\_close\_violations\_on\_expiration) | Whether to close all open incidents when the signal expires |
| <a name="output_condition_policy_id"></a> [condition\_policy\_id](#output\_condition\_policy\_id) | The ID of the policy where this condition is used |
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
| <a name="output_policy_incident_preference"></a> [policy\_incident\_preference](#output\_policy\_incident\_preference) | The rollup strategy for the policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
| <a name="output_runbook_url"></a> [runbook\_url](#output\_runbook\_url) | Runbook URL to display in notifications |
| <a name="output_slide_by"></a> [slide\_by](#output\_slide\_by) | Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the alert conditions |
| <a name="output_type"></a> [type](#output\_type) | The type of the condition |
| <a name="output_violation_time_limit_seconds"></a> [violation\_time\_limit\_seconds](#output\_violation\_time\_limit\_seconds) | The time limit, in seconds, that will automatically force-close a long-lasting incident |
| <a name="output_warning_operator"></a> [warning\_operator](#output\_warning\_operator) | The operator used when evaluating the threshold |
| <a name="output_warning_threshold"></a> [warning\_threshold](#output\_warning\_threshold) | The value which will trigger an incident |
| <a name="output_warning_threshold_duration"></a> [warning\_threshold\_duration](#output\_warning\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_warning_threshold_occurrences"></a> [warning\_threshold\_occurrences](#output\_warning\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
