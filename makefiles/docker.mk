help-docker:
	@echo ""
	@echo "  ${boldunderline}DOCKER COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}restart{normal} - restart php container "
	@echo ""


restart:
	@docker-compose stop $(PHP)
	@docker-compose up -d $(PHP)
