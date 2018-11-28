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

start:
	@running=$$(docker-compose ps php | grep -c "Up"); \
	if [ "$$running" -eq 0 ]; then \
		docker-compose up -d; \
	fi;

shell: start
	@docker-compose exec $(PHP) zsh

bold := "\\033[1m"
normal := "\\033[0m"
boldunderline := "\\033[1m\\033[4m"
