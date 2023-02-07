# Basic Critical

Configuration in this directory creates an alert policy with a single associated NRQL alert condition.

The NRQL alert condition only defines a critical violation block.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [newrelic_alert_policy.main](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The New Relic account ID of the account you wish to create the condition | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | value | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_critical_operator"></a> [critical\_operator](#output\_critical\_operator) | The operator used when evaluating the threshold |
| <a name="output_critical_threshold"></a> [critical\_threshold](#output\_critical\_threshold) | The value which will trigger an incident |
| <a name="output_critical_threshold_duration"></a> [critical\_threshold\_duration](#output\_critical\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_critical_threshold_occurrences"></a> [critical\_threshold\_occurrences](#output\_critical\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
| <a name="output_description"></a> [description](#output\_description) | The description of the NRQL alert condition |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Whether the alert condition is enabled |
| <a name="output_entity_guid"></a> [entity\_guid](#output\_entity\_guid) | The unique entity identifier of the NRQL Condition in New Relic |
| <a name="output_id"></a> [id](#output\_id) | The ID of the NRQL alert condition |
| <a name="output_module_policy_id"></a> [module\_policy\_id](#output\_module\_policy\_id) | The ID of the policy where this condition is used |
| <a name="output_name"></a> [name](#output\_name) | The title of the condition |
| <a name="output_nrql_query"></a> [nrql\_query](#output\_nrql\_query) | The NRQL query executed for the condition |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The ID of the policy where this condition is used |
| <a name="output_policy_incident_preference"></a> [policy\_incident\_preference](#output\_policy\_incident\_preference) | The rollup strategy for the policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
| <a name="output_runbook_url"></a> [runbook\_url](#output\_runbook\_url) | Runbook URL to display in notifications |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the alert conditions |
| <a name="output_type"></a> [type](#output\_type) | The type of the condition |
| <a name="output_warning_operator"></a> [warning\_operator](#output\_warning\_operator) | The operator used when evaluating the threshold |
| <a name="output_warning_threshold"></a> [warning\_threshold](#output\_warning\_threshold) | The value which will trigger an incident |
| <a name="output_warning_threshold_duration"></a> [warning\_threshold\_duration](#output\_warning\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_warning_threshold_occurrences"></a> [warning\_threshold\_occurrences](#output\_warning\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
<!-- END_TF_DOCS -->
