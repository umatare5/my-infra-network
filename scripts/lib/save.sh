# Save config
function save_cisco_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "write memory" --enable-mode
}

# Save config
function save_cisco_config_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "write memory" --enable-mode --secure-mode
}

# Save config
function save_yamaha_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "save" --exec-platform "yamaha" --enable-mode
}
