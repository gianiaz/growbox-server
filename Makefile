# Makefile for Growbox

default:
	@$(MAKE) -s help

PHP=php


quickstart:
	@echo "    Usage:"
	@echo ""
	@echo "      ${bold}make COMMAND${normal}"
	@echo ""
	@echo "    Setup the full environment with:"
	@echo ""
	@echo "      ${bold}make setup${normal}"
	@echo ""
	@echo "    Get an interactive shell (inside the PHP container) with:"
	@echo ""
	@echo "      ${bold}make shell${normal}"
	@echo ""
	@echo "    To get help and the full list of commands:"
	@echo ""
	@echo "      ${bold}make help${normal}"

help: quickstart
	@make help-composer
	@make help-quality
	@make help-symfony
	@make help-test
	@make help-docker
	@make help-utils
	@echo ""

start:
	@running=$$(docker-compose ps php | grep -c "Up"); \
	if [ "$$running" -eq 0 ]; then \
		docker-compose up -d; \
	fi;

shell: start
	@docker-compose exec $(PHP) zsh

include makefiles/utils.mk
include makefiles/composer.mk
include makefiles/docker.mk
include makefiles/quality.mk
include makefiles/symfony.mk
include makefiles/test.mk

bold := "\\033[1m"
normal := "\\033[0m"
boldunderline := "\\033[1m\\033[4m"

