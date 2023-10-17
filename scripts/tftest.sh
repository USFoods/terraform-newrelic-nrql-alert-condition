#!/bin/bash

# Get list of directories containing Terraform test files, excluding modules
DIRS=$(find . -type f -name "*.tftest.hcl" -not -path "*/modules/*" -not -path "*/.terraform/*" -exec dirname {} \; | sort -u)

# Iterate over each directory
for DIR in $DIRS; do
    # If '.terraform.lock.hcl' file does not exist, run `terraform init` in directory
    bash -c "terraform -chdir=$DIR test"
done
