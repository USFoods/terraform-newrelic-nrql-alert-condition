#!/bin/bash

# Get list of directories containing Terraform test files, excluding modules
DIRS=$(find . -type f -name "*.tftest.hcl" -not -path "*/modules/*" -not -path "*/.terraform/*" -exec dirname {} \; | sort -u)

# Variable to track failed tests
FAILED_TESTS=()

# Iterate over each directory
for DIR in $DIRS; do
    # Run Terraform test in directories with .tftest.hcl files
    bash -c "terraform -chdir=$DIR test"

    # Check exit status of the last command
    if [ $? -ne 0 ]; then
        FAILED_TESTS+=("$DIR")
    fi
done

# If there are any failed tests, report them and exit with a non-zero status
if [ ${#FAILED_TESTS[@]} -ne 0 ]; then
    echo -e "\n\033[31mTests failed in the following directories:\033[0m"
    for TEST in "${FAILED_TESTS[@]}"; do
        echo "- $TEST"
    done
    exit 1
fi
