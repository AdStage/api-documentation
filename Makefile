.PHONY: help ## This is to avoid make checking for any deps

.DEFAULT_GOAL := help  ## Just running make will run help target

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deps: ## Pulls in all required deps such as hercule
	@which -s brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@which -s asdf || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6
	@which -s asdf || echo -e '$HOME/.asdf/asdf.sh' >> ~/.bash_profile
	@which -s asdf || echo -e '$HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
	@which -s node || (asdf plugin-add nodejs && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring)
	@asdf install
	@which -s yarn || npm install yarn
	@yarn install
	@echo ------------------------
	@echo "All deps are installed"
	@echo ------------------------

generate-docs: ## Generates the output documentation file from source
	@hercule src/root.apib -o apiary.apib
	@cp apiary.apib apiary.md
