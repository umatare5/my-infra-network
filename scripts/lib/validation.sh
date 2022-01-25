# Check current directory
function validate_current_dir(){
  local EXPECT_NAME=$1
  local CURRENT_DIR=$(basename "$PWD")
  if [ "${CURRENT_DIR}" != "${EXPECT_NAME}" ]; then
    echo -e "\nInvalid working directory. Please move to '${EXPECT_NAME}'.\n"
    exit 1
  fi
}

# Check telee exists
function validate_telee_exists(){
  if ! which telee > /dev/null ; then
    echo -e "\nMissing telee. Please download from https://github.com/umatare5/telee/releases\n"
    exit 1
  fi
}

# Check gsed exists
function validate_gsed_exists(){
  if ! which gsed > /dev/null ; then
    echo -e "\nMissing gsed. Please install by 'brew install gnu-sed'\n"
    exit 1
  fi
}
