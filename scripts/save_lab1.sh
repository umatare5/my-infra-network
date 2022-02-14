#!/bin/bash

# Preset variables
REPO_NAME=my-infra-network
SITE_NAME=lab1
DETAILS_DIR=details

# Load libraries
source ./scripts/lib/validation.sh
source ./scripts/lib/save.sh

# Validations
validate_current_dir ${REPO_NAME}
validate_telee_exists

# Prepare directories
mkdir -p $SITE_NAME/$DETAILS_DIR

### Save on Cisco IOS ###

# Declare targets
declare -a CISCO_TARGETS_VIA_SSH=(
  lab1-cat29c-02f-01 \
  lab1-cat29l-02f-01 \
  lab1-cat35c-02f-01
)

# Fetch configs
for TARGET in ${CISCO_TARGETS_VIA_SSH[@]}; do
  save_cisco_config_via_ssh $TARGET
done

### Save on YAMAHA OS ###

# Declare targets
declare -a YAMAHA_TARGETS=(
  lab1-rtx1200-02f-01
)

# Fetch configs
for TARGET in ${YAMAHA_TARGETS[@]}; do
  save_yamaha_config $TARGET
done
