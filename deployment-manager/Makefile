.PHONY: all

CURDIR := $(shell pwd)

help: ## Print this help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

sample: ## This is ample
	echo "Hello world!!"

provision_sandbox: ## Provision sandbox resource.
	gcloud deployment-manager deployments create --automatic-rollback-on-error --template ./sandbox/instance.jinja sandbox

delete_sandbox: ## Delete sandbox resource.
	gcloud deployment-manager deployments delete sandbox
