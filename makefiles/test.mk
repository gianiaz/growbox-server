help-test:
	@echo ""
	@echo "  ${boldunderline}TEST COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}test${normal} - Runs Unit and functional tests with paraunit"
	@echo ""
	@echo "      ${bold}test-unit${normal} - Runs Unit tests with paraunit"
	@echo ""
	@echo "      ${bold}test-unit-stop-on-failure${normal} - Runs Unit tests with phpunit with stop-on-failure flag"
	@echo ""
	@echo "      ${bold}test-functional${normal} - Runs functional tests with paraunit"
	@echo ""
	@echo "      ${bold}test-functional-stop-on-failure${normal} - Runs functional tests with phpunit with"
	@echo "                                        stop-on-failure flag"
	@echo ""
	@echo "      ${bold}test-integration${normal} - Runs integration tests with phpunit"
	@echo ""
	@echo "      ${bold}test-coverage-text${normal} - Runs Unit and Functional Test and output coverage"
	@echo "                           in text format with paraunit"
	@echo ""
	@echo "      ${bold}test-coverage-html${normal} - Runs Unit and Functional Test and output coverage"
	@echo "                           in html format with paraunit,"
	@echo "                           target folder is coverage/YYYY-MM-DD"
	@echo ""
	@echo "      ${bold}test-coverage-unit-html${normal} - Runs Unit Test and output coverage"
	@echo "                                in html format with paraunit"
	@echo "                                target folder is coverage/YYYY-MM-DD"


test:
	@docker-compose exec $(PHP) vendor/bin/paraunit run --testsuite=unit,functional --ansi

test-unit:
	@docker-compose exec $(PHP) vendor/bin/paraunit run --testsuite=unit --ansi

test-unit-stop-on-failure:
	@docker-compose exec $(PHP) vendor/bin/phpunit --testsuite=unit --colors=always --stop-on-failure

test-functional:
	@docker-compose exec $(PHP) vendor/bin/paraunit run --testsuite=functional --ansi

test-functional-stop-on-failure:
	@docker-compose exec $(PHP) vendor/bin/phpunit --testsuite=functional --colors=always --stop-on-failure

test-coverage-text:
	@docker-compose exec -T $(PHP) vendor/bin/paraunit coverage --testsuite=unit,functional --ansi --text-summary

test-coverage-html:
	@docker-compose exec $(PHP) vendor/bin/paraunit coverage --testsuite=unit,functional --html=coverage/$(shell date +%Y-%m-%d)

test-coverage-unit-html:
	@docker-compose exec $(PHP) vendor/bin/paraunit coverage --testsuite=unit --html=coverage/$(shell date +%Y-%m-%d)-unit
