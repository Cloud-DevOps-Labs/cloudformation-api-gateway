#!/usr/bin/env bash

aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS Cli but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

# Deploy the stack (create and/or update) in a single file

set -e

if [ -z "$AWS_DEFAULT_REGION" ]; then
    aws_region="eu-west-1"
else
    aws_region=$AWS_DEFAULT_REGION
fi

preffix="greeting"
stack_name=$preffix'-stack'
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
template_base="$script_dir/../cloudformation.template"
template_compiled="$script_dir/../packaged.yaml"
deploy_bucket=$aws_region'-'$( aws sts get-caller-identity --query Account --output text )'-code'

if aws s3api head-bucket --bucket $deploy_bucket 2>/dev/null; then
    aws s3api create-bucket --bucket $deploy_bucket --region $aws_region
fi

aws cloudformation package \
    --template-file $template_base \
    --output-template-file $template_compiled \
    --s3-bucket $deploy_bucket \
    --s3-prefix $preffix

aws cloudformation create-stack \
    --stack-name $stack_name \
    --template-body fileb://"$template_compiled" \
    --capabilities CAPABILITY_IAM \
    --region $aws_region
