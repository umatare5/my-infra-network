# Save config
function save_ios_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "write memory" --enable-mode
}
