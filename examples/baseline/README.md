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
| <a name="module_baseline_lower_only"></a> [baseline\_lower\_only](#module\_baseline\_lower\_only) | ../.. | n/a |
| <a name="module_baseline_upper_and_lower"></a> [baseline\_upper\_and\_lower](#module\_baseline\_upper\_and\_lower) | ../.. | n/a |
| <a name="module_baseline_upper_only"></a> [baseline\_upper\_only](#module\_baseline\_upper\_only) | ../.. | n/a |

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
| <a name="output_baseline_lower_only"></a> [baseline\_lower\_only](#output\_baseline\_lower\_only) | Output from the baseline\_lower\_only module |
| <a name="output_baseline_upper_and_lower"></a> [baseline\_upper\_and\_lower](#output\_baseline\_upper\_and\_lower) | Output from the baseline\_upper\_and\_lower module |
| <a name="output_baseline_upper_only"></a> [baseline\_upper\_only](#output\_baseline\_upper\_only) | Output from the baseline\_upper\_only module |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The ID of the policy where this condition is used |
| <a name="output_policy_incident_preference"></a> [policy\_incident\_preference](#output\_policy\_incident\_preference) | The rollup strategy for the policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
