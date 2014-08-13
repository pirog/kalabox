#!/bin/bash

COMMAND=$1
BUILD_TOP=`dirname $TRAVIS_BUILD_DIR`
EXIT_VALUE=0

##
# SCRIPT COMMANDS
##

# before-script
#
# Setup Drupal to run the tests.
#
before-script() {
  npm install -g grunt-cli bower
  bower install
}

# script
#
# Run the tests.
#
script() {
  grunt test
}

# after-script
#
# Clean up after the tests.
#
after-script() {
}

# after-success
#
# Clean up after the tests.
#
after-success() {
}

##
# UTILITY FUNCTIONS:
##

# Prints a message about the section of the script.
header() {
  set +xv
  echo
  echo "** $@"
  echo
  set -xv
}

# Sets the exit level to error.
set_error() {
  EXIT_VALUE=1
}

# Runs a command and sets an error if it fails.
run_test() {
  if ! $@; then
    set_error
  fi
}

# Runs a command showing all the lines executed
run_command() {
  set -xv
  $@
  set +xv
}

##
# SCRIPT MAIN:
##

# Capture all errors and set our overall exit value.
trap 'set_error' ERR

# We want to always start from the same directory:
cd $BUILD_TOP

case $COMMAND in
  before-script)
    run_command before-script
    ;;

  script)
    run_command script
    ;;

  after_script)
    run_command after_script
    ;;

  after-success)
    run_command after-success
    ;;
esac

exit $EXIT_VALUE
