
#############################
# Global vars
#############################
PROJECT_NAME := $(shell basename $(shell pwd))

# Read all subsquent tasks as arguments of the first task
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(args) $(RUN_ARGS):;@:)

DIR := $(if $(path),"environments/$(path)",".")

#############################
# Targets
#############################
clean:
	@echo "=== $(PROJECT_NAME) === [ clean            ]: removing Terraform local states..."
	@cd $(DIR) && find . -name '.terraform' -exec rm -rf {} +
	@cd $(DIR) && find . -name '.terraform.lock.hcl' -exec rm -rf {} +
	@cd $(DIR) && find . -name '*tfstate' -exec rm -rf {} +
	@cd $(DIR) && find . -name '*tfstate.backup' -exec rm -rf {} +

fmt:
	@echo "=== $(PROJECT_NAME) === [ format           ]: formatting Terraform configuration..."
	@cd $(DIR) && terraform fmt --recursive

lint:
	@echo "=== $(PROJECT_NAME) === [ lint             ]: linting Terraform configuration..."
	@cd $(DIR) && tflint --recursive

deps:
	@echo "=== $(PROJECT_NAME) === [ deps             ]: downloading development dependencies..."
	@go mod tidy

ready: clean fmt lint

.PHONY : clean lint deps fmt ready
