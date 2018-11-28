help-symfony:
	@echo ""
	@echo "  ${boldunderline}SYMFONY COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}clearcache-dev${normal} - Launch symfony cache clear on dev environment"
	@echo ""
	@echo "      ${bold}clearcache-test${normal} - Launch symfony cache clear on test environment"
	@echo ""
	@echo "      ${bold}warmupcache-dev${normal} - Launch symfony cache warmup on dev environment"
	@echo ""
	@echo "      ${bold}warmupcache-test${normal} - Launch symfony cache warmup on test environment"

clearcache-dev:
	@echo ""
	@echo "    ENV: DEV"
	@docker-compose exec -T $(PHP) bin/console cache:clear --env=dev

clearcache-test:
	@echo ""
	@echo "    ENV: TEST"
	@docker-compose exec -T $(PHP) bin/console cache:clear --env=test

warmupcache-dev:
	@echo ""
	@echo "    ENV: DEV"
	@docker-compose exec -T $(PHP) bin/console cache:warmup --env=dev

warmupcache-test:
	@echo ""
	@echo "    ENV: TEST"
	@docker-compose exec -T $(PHP) bin/console cache:warmup --env=test
