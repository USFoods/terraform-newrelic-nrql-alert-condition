#!/bin/bash

# Get list of directories containing Terraform configuration files, excluding modules
DIRS=$(find . -type f -name "*.tf" -not -path "*/modules/*" -not -path "*/.terraform/*" -exec dirname {} \; | sort -u)

# Iterate over each directory
for DIR in $DIRS; do
  # Check if directory contains '.terraform.lock.hcl' file
  if [[ ! -f "$DIR/.terraform.lock.hcl" ]]; then
    # If '.terraform.lock.hcl' file does not exist, run `terraform init` in directory
    bash -c "terraform -chdir=$DIR init"
  fi
done
