#!/bin/bash

set -e

# Create a directory for bashrc.d if it doesn't exist
if [[ ! -d "~/.bashrc.d" ]]; then
  mkdir -p ~/.bashrc.d
  
  # Create a dummy bash file
  touch ~/.bashrc.d/dummy.bash

  # Add sourcing of files in bashrc.d to .bashrc
  echo 'for file in ~/.bashrc.d/*.bash; do source "$file"; done' >> ~/.bashrc
fi

# Disable managed credentials in Cloud9 environment if it exists
if [ ! -z "$CLOUD9_ENVIRONMENT_ID" ]; then
  echo "aws cloud9 update-environment --environment-id $CLOUD9_ENVIRONMENT_ID --managed-credentials-action DISABLE &> /dev/null || true" > ~/.bashrc.d/c9.bash
fi

# Set AWS related environment variables
cat << EOT > ~/.bashrc.d/aws.bash
export AWS_PAGER=""
export AWS_REGION="${AWS_REGION}"
EOT

# Create a file for workshop environment variables
touch ~/.bashrc.d/workshop-env.bash

# Repository variables
REPOSITORY_OWNER=${REPOSITORY_OWNER:-"s3curitydojolab"}
REPOSITORY_NAME=${REPOSITORY_NAME:-"cloud9-eks"}

# Set repository environment variables if REPOSITORY_REF is set
if [ ! -z "$REPOSITORY_REF" ]; then
  cat << EOT > ~/.bashrc.d/repository.bash
export REPOSITORY_OWNER='${REPOSITORY_OWNER}'
export REPOSITORY_NAME='${REPOSITORY_NAME}'
export REPOSITORY_REF='${REPOSITORY_REF}'
EOT
fi

# Set resources precreated variable
RESOURCES_PRECREATED=${RESOURCES_PRECREATED:-"false"}

echo "export RESOURCES_PRECREATED='${RESOURCES_PRECREATED}'" > ~/.bashrc.d/infra.bash

# Verify the binaries are in the path and executable
for command in kubectl jq envsubst aws; do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
done

# Enable kubectl bash_completion
/usr/local/bin/kubectl completion bash >> ~/.bashrc.d/kubectl_completion.bash
source /etc/profile.d/bash_completion.sh
source ~/.bashrc.d/kubectl_completion.bash
