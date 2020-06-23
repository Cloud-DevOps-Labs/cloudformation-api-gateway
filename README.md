# Introduction to CloudFormation for API Gateway

Sample project that shows how [AWS CloudFormation](https://aws.amazon.com/cloudformation/) can be
used to create an [AWS API Gateway](https://aws.amazon.com/api-gateway/) backed by [AWS Lambda](https://aws.amazon.com/lambda/).

Please read the [blog post](https://www.jayway.com/2016/08/17/introduction-to-cloudformation-for-api-gateway/) for details.

## CloudFormation Template

[cloudformation.template](cloudformation.template)

## Tools and dependencies

In order to execute the scripts, you need to install the following tools:

- [AWS CLI](https://aws.amazon.com/cli/) (AWS Command Line Interface)
- [npm](https://www.npmjs.com/) (JavaScript package manager*)
- [nodejs](https://nodejs.org/) (JavaScript Backend Framework* based on V8 Chrome Engine)

* Best installed with [nvm](https://github.com/nvm-sh/nvm) with version chaning, no sudo permission, located at home user.

## Scripts

| Script                                                        | Description                |
| ------------------------------------------------------------- | -------------------------- |
| [create-stack.sh](scripts/deploy-stack.sh)                    | Deploys the stack          |
| [integration-test.sh](scripts/integration-test.sh)            | Executes integration tests |

## Update

On the November 18th, 2016 AWS introduced the Serverless Application Model (or SAM for short) that provides an alternative solution to the one described in this blog post. Please read the [AWS blog post](https://aws.amazon.com/blogs/compute/introducing-simplified-serverless-application-deplyoment-and-management/) and study the related [project](https://github.com/awslabs/serverless-application-model/blob/master/README.md) at the AWS Labs GitHub account for more information.
