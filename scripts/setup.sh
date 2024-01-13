#!/bin/bash

set -e

if [[ ! -d "~/.bashrc.d" ]]; then
  mkdir -p ~/.bashrc.d
  
  touch ~/.bashrc.d/dummy.bash

  echo 'for file in ~/.bashrc.d/*.bash; do source "$file"; done' >> ~/.bashrc
fi

if [ ! -z "$CLOUD9_ENVIRONMENT_ID" ]; then
  echo "aws cloud9 update-environment --environment-id $CLOUD9_ENVIRONMENT_ID --managed-credentials-action DISABLE &> /dev/null || true" > ~/.bashrc.d/c9.bash
fi

cat << EOT > ~/.bashrc.d/aws.bash
export AWS_PAGER=""
export AWS_REGION="${AWS_REGION}"
EOT

touch ~/.bashrc.d/workshop-env.bash


REPOSITORY_OWNER=${REPOSITORY_OWNER:-"s3curitydojolab"}
REPOSITORY_NAME=${REPOSITORY_NAME:-"cloud9-eks"}

if [ ! -z "$REPOSITORY_REF" ]; then
  cat << EOT > ~/.bashrc.d/repository.bash
export REPOSITORY_OWNER='${REPOSITORY_OWNER}'
export REPOSITORY_NAME='${REPOSITORY_NAME}'
export REPOSITORY_REF='${REPOSITORY_REF}'
EOT
fi

RESOURCES_PRECREATED=${RESOURCES_PRECREATED:-"false"}

echo "export RESOURCES_PRECREATED='${RESOURCES_PRECREATED}'" > ~/.bashrc.d/infra.bash


# Verify the binaries are in the path and executable
for command in kubectl jq envsubst aws
  do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
  done

# Enable kubectl bash_completion
/usr/local/bin/kubectl completion bash >>  ~/.bashrc.d/kubectl_completion.bash
source /etc/profile.d/bash_completion.sh
source ~/.bash_completion
