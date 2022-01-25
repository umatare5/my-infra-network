#!/bin/bash

# Preset variables
REPO_NAME=my-network-config
SITE_NAME=lab1
DETAILS_DIR=details

# Load libraries
source ./scripts/lib/validation.sh
source ./scripts/lib/fetch_from_cisco.sh
source ./scripts/lib/fetch_from_yamaha.sh

# Validations
validate_current_dir ${REPO_NAME}
validate_telee_exists

# Prepare directories
mkdir -p $SITE_NAME/$DETAILS_DIR

### Scrape for Cisco IOS ###

# Declare targets
declare -a IOS_TARGETS=(
  lab1-cat29c-02f-01 \
  lab1-cat29l-02f-01 \
  lab1-cat35c-02f-01
)

# Fetch software information
for TARGET in ${IOS_TARGETS[@]}; do
  fetch_ios_software $TARGET > ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch hardware information
for TARGET in ${IOS_TARGETS[@]}; do
  fetch_ios_hardware $TARGET >> ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch interfaces status
for TARGET in ${IOS_TARGETS[@]}; do
  fetch_ios_interface_status $TARGET >> ./$SITE_NAME/$DETAILS_DIR/${TARGET}
done

# Fetch configs
for TARGET in ${IOS_TARGETS[@]}; do
  fetch_ios_config $TARGET > ./$SITE_NAME/${TARGET}
done

### Scrape for YAMAHA OS ###

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
