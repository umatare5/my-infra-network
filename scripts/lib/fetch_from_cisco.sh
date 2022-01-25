# Fetch hardware
function fetch_ios_hardware(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show inventory"
}

# Fetch software
function fetch_ios_software(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show version"
}

# Fetch interface status
function fetch_ios_interface_status(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show interface status"
}

# Fetch config
function fetch_ios_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show running-config" --enable-mode | \
    gsed -r "s/snmp-server community \w+ /snmp-server community <masked> /g"
}
