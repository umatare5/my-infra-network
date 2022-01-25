# Fetch hardware and software
function fetch_yamaha_summary(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show environment" --exec-platform "yamaha"
}

# Fetch interface status
function fetch_yamaha_interface_status(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan1" --exec-platform "yamaha"
  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan2" --exec-platform "yamaha"
  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan3" --exec-platform "yamaha"
}

# Fetch config
function fetch_yamaha_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show config" --exec-platform "yamaha"
}
