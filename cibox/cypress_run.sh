#!/bin/sh

if [ ! -z $1 ]; then
    time ansible-playbook -vvvv reinstall.yml -t cypress-commands -e all_cypress_tests="no" -e create_env_json="no" -e cypress_test_to_run="$1"  -e cypress_run=true -i 'localhost,' --connection=local
    cat build_reports/cypress.html
else
    time ansible-playbook -vvvv reinstall.yml -t cypress-commands -e all_cypress_tests="yes" -e create_env_json="no" -e cypress_run=true -i 'localhost,' --connection=local
fi
