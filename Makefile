
#############################
# Global vars
#############################
PROJECT_NAME := $(shell basename $(shell pwd))

GO           ?= go
VENDOR_CMD   ?= ${GO} mod tidy
TF_LINTER	 ?= tflint
TEST_RUNNER  ?= gotestsum
GO_PKGS      ?= $(shell $(GO) list ./...)

TFINIT_SCRIPT    ?= ./scripts/tfinit.sh

# Go file to track tool deps with go modules
TOOL_DIR     ?= tools
TOOL_CONFIG  ?= $(TOOL_DIR)/tools.go

GOTOOLS ?= $(shell cd $(TOOL_DIR) && go list -f '{{ .Imports }}' -tags tools |tr -d '[]')

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

test: init deps
	@echo "=== $(PROJECT_NAME) === [ test             ]: running integration tests..."
	@TF_ACC=1 $(TEST_RUNNER) -f testname --rerun-fails=1 --packages "$(GO_PKGS)" -- -v -parallel 8

deps: tools
	@echo "=== $(PROJECT_NAME) === [ deps             ]: downloading development dependencies..."
	@$(VENDOR_CMD)

tools:
	@echo "=== $(PROJECT_NAME) === [ tools            ]: Installing tools required by the project..."
	@cd $(TOOL_DIR) && $(VENDOR_CMD)
	@cd $(TOOL_DIR) && $(GO) install $(GOTOOLS)

exec: 
	@echo "=== $(PROJECT_NAME) === [ exec             ]: making scripts executable..."
	@chmod +x $(TFINIT_SCRIPT)

ready: fmt lint clean

.PHONY : clean lint init deps exec fmt ready tools test
