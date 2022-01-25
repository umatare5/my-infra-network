#!/bin/bash

# Preset variables
REPO_NAME=my-network-config
SITE_NAME=$1

# Load libraries
source ./scripts/lib/validation.sh

# Validations
validate_current_dir ${REPO_NAME}

# Commit and Push
TIMESTAMP=$(date '+%Y/%m/%d %H:%M:%S')
git add $SITE_NAME
git commit -m "Updated at ${TIMESTAMP}"
git push origin main
