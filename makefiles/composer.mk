help-composer:
	@echo ""
	@echo "  ${boldunderline}COMPOSER COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}composer-install${normal} - Launch composer install"
	@echo ""
	@echo "      ${bold}composer-update${normal} - Launch composer update"
	@echo ""


composer-install:
	@docker-compose exec -T $(PHP) composer install

composer-update:
	@docker-compose exec -T $(PHP) composer update
