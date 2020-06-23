#!/usr/bin/env bash

npm --version >/dev/null 2>&1 || { echo >&2 "I require npm as dependency package manager but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

# Executes integration tests against version $LATEST

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$script_dir/.."

npm install
npm run xunit-itest
