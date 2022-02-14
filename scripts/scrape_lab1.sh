#!/bin/bash

# Preset variables
REPO_NAME=my-infra-network
SITE_NAME=lab1
DETAILS_DIR=details

# Load libraries
source ./scripts/lib/validation.sh
source ./scripts/lib/fetch.sh

# Validations
validate_current_dir ${REPO_NAME}
validate_telee_exists

# Prepare directories
mkdir -p $SITE_NAME/$DETAILS_DIR

### Scrape from Cisco Devices ###

# Declare targets
declare -a CISCO_TARGETS_VIA_SSH=(
  lab1-cat29c-02f-01 \
  lab1-cat29l-02f-01 \
  lab1-cat35c-02f-01
)

# Fetch software information
for TARGET in ${CISCO_TARGETS_VIA_SSH[@]}; do
  fetch_cisco_software_via_ssh $TARGET > ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch hardware information
for TARGET in ${CISCO_TARGETS_VIA_SSH[@]}; do
  fetch_cisco_hardware_via_ssh $TARGET >> ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch interfaces status
for TARGET in ${CISCO_TARGETS_VIA_SSH[@]}; do
  fetch_cisco_interface_status_via_ssh $TARGET >> ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch configs
for TARGET in ${CISCO_TARGETS_VIA_SSH[@]}; do
  fetch_cisco_config_via_ssh $TARGET > ./$SITE_NAME/${TARGET}
done

### Scrape from YAMAHA OS ###

# Declare targets
declare -a YAMAHA_TARGETS=(
  lab1-rtx1200-02f-01
)

# Fetch software information
for TARGET in ${YAMAHA_TARGETS[@]}; do
  fetch_yamaha_summary $TARGET > ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch interfaces status
for TARGET in ${YAMAHA_TARGETS[@]}; do
  fetch_yamaha_interface_status $TARGET >> ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch configs
for TARGET in ${YAMAHA_TARGETS[@]}; do
  fetch_yamaha_config $TARGET > ./$SITE_NAME/${TARGET}
done
