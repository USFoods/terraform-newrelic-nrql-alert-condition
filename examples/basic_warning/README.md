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
