help-quality:
	@echo ""
	@echo "  ${boldunderline}QUALITY COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}phpstan${normal} - Runs PHP Static Analysis Tool on these directories:"
	@echo "                app, src, tests"
	@echo ""
	@echo "      ${bold}code-style-check${normal} - Checks code style with php-cs-fixer"
	@echo ""
	@echo "      ${bold}code-style-fix${normal} - Fixes code style using php-cs-fixer"
	@echo ""


phpstan:
	@echo "PHP STAN"
	@echo ""
	@docker-compose exec -T $(PHP) ./vendor/bin/phpstan analyse src tests app --level=7 --configuration=phpstan.neon

code-style-check:
	@echo "CODE STYLE  CHECK"
	@echo ""
	@docker-compose exec -T $(PHP) composer cs-check

code-style-fix:
	@echo "CODE STYLE FIX"
	@echo ""
	@docker-compose exec -T $(PHP) composer cs-fix
