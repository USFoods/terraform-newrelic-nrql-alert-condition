
#############################
# Global vars
#############################
PROJECT_NAME := $(shell basename $(shell pwd))

TF_LINTER	 	 ?= tflint
TFINIT_SCRIPT    ?= ./scripts/tfinit.sh
TFTEST_SCRIPT	 ?= ./scripts/tftest.sh

#############################
# Targets
#############################
clean:
	@echo "=== $(PROJECT_NAME) === [ clean            ]: removing Terraform local states..."
	@find . \( -name '.terraform*' -or -name '*tfstate*' \) -exec rm -rf {} +

init: exec
	@echo "=== $(PROJECT_NAME) === [ tf init          ]: initializing Terraform configuration..."
	@$(TFINIT_SCRIPT)

fmt:
	@echo "=== $(PROJECT_NAME) === [ format           ]: formatting Terraform configuration..."
	@terraform fmt --recursive

lint: init
	@echo "=== $(PROJECT_NAME) === [ lint-init        ]: initializing tflint configuration..."
	@$(TF_LINTER) --init
	@echo "=== $(PROJECT_NAME) === [ lint             ]: linting Terraform configuration..."
	@$(TF_LINTER) --recursive

test: init
	@echo "=== $(PROJECT_NAME) === [ test             ]: running integration tests..."
	@$(TFTEST_SCRIPT)

exec: 
	@echo "=== $(PROJECT_NAME) === [ exec             ]: making scripts executable..."
	@chmod +x $(TFINIT_SCRIPT)
	@chmod +x $(TFTEST_SCRIPT)

ready: fmt lint test clean

.PHONY : clean lint init exec fmt ready test
