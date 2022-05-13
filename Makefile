.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

null:
	help

ARGS = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

.PHONY: generate
generate: ## generate the app
	go run github.com/99designs/gqlgen generate

.PHONY: run
run: ## run the app
	go run server.go

%:    # Supresses the below 
	@:  # make: *** No rule to make target `...'.  Stop.