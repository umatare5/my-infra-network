# Save config
function save_yamaha_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "save" --exec-platform "yamaha" --enable-mode
}
