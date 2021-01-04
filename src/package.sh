#!/usr/bin/env bash
 
# Builds a lambda package from a single Python 3 module with pip dependencies.
# This is a modified version of the AWS packaging instructions:
# https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html#python-package-dependencies
 
# https://stackoverflow.com/a/246128
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 
pushd $SCRIPT_DIRECTORY > /dev/null
 
rm -rf ../lambda-zip
mkdir -p ../lambda-zip

cd servicenow-acct-setup-handler
zip ../../lambda-zip/servicenow-acct-setup-handler.zip *
popd > /dev/null
pushd $SCRIPT_DIRECTORY > /dev/null
 
cd servicenow-stack-set-handler
zip ../../lambda-zip/servicenow-stack-set-handler.zip *

popd > /dev/null
