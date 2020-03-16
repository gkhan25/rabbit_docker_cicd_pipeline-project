#!/bin/bash
# -*- coding: utf-8 -*-
#
# This script should be sourced to use.
#
# This file is generated by cookiecutter-pygitrepo 0.0.5: https://github.com/MacHu-GWU/cookiecutter-pygitrepo/tree/0.0.5

if [ -n "${BASH_SOURCE}" ]
then
    dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
else
    dir_here="$( cd "$(dirname "$0")" ; pwd -P )"
fi
dir_project_root=$(dirname "${dir_here}")

path_shared_config_file="${dir_project_root}/config/00-config-shared.json"
path_read_config_value_script="${dir_project_root}/config/read-config-value"


# GitHub
github_account="MacHu-GWU"
github_repo_name="rabbit_docker_cicd_pipeline-project"


# Python
package_name="rabbit_docker_cicd_pipeline"
py_ver_major="3"
py_ver_minor="6"
py_ver_micro="2"
use_pyenv="N" # "Y" or "N"
supported_py_versions="3.6.2" # e.g: "2.7.13 3.6.2"


#--- Doc Build
rtd_project_name="rabbit-docker-cicd-pipeline"


#--- AWS Lambda
# AWS profile name for deploy lambda function
# should be defined in ~/.aws/credentials
# read https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html for more information
aws_profile_for_deploy="$($path_read_config_value_script $path_shared_config_file "AWS_PROFILE")"

# deployment package file will be upload to:
# "s3://${s3_bucket_lambda_deploy}/lambda/${github_account}/${github_repo_name}/${package_name}-${package_version}.zip"
s3_bucket_lambda_deploy="$($path_read_config_value_script $path_shared_config_file "S3_BUCKET_FOR_DEPLOY")"


# Docker
# deployment package will be built in this container
docker_image_for_build="lambci/lambda:build-python3.6"

# this container will be used for testing lambda invoke
docker_image_for_run="lambci/lambda:python3.6"
dir_container_workspace="/var/task"
