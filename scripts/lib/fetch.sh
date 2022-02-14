# Fetch hardware by using telnet
function fetch_cisco_hardware(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show inventory"
}

# Fetch hardware by using SSH
function fetch_cisco_hardware_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME --secure-mode -C "show inventory"
}

# Fetch software by using telnet
function fetch_cisco_software(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show version"
}

# Fetch software by using SSH
function fetch_cisco_software_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME --secure-mode -C "show version"
}

# Fetch interface status by using telnet
function fetch_cisco_interface_status(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show interface status"
}

# Fetch interface status by using SSH
function fetch_cisco_interface_status_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME --secure-mode -C "show interface status"
}

# Fetch config by using telnet
function fetch_cisco_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show running-config" --enable-mode | \
    gsed -r "s/ secret 5 .+/ secret 5 <masked>/g" | \
    gsed -r "s/snmp-server community \w+ /snmp-server community <masked> /g"
}

# Fetch config by using SSH
function fetch_cisco_config_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show running-config" --enable-mode --secure-mode | \
    gsed -r "s/ secret 5 .+/ secret 5 <masked>/g" | \
    gsed -r "s/snmp-server community \w+ /snmp-server community <masked> /g"
}

# Fetch config on Airespace AP by using SSH
function fetch_aironet_config_via_ssh(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show running-config" --enable-mode --secure-mode | \
    gsed -r "s/ secret 5 .+/ secret 5 <masked>/g" | \
    gsed -r "s/snmp-server community \w+ /snmp-server community <masked> /g" | \
    gsed -r "s/ ssid .+/ ssid <masked>/g" | \
    gsed -r "s/wpa-psk ascii 7 .+/wpa-psk ascii 7 <masked>/g"
}

# Fetch hardware and software on YAMAHA OS by using telnet
function fetch_yamaha_summary(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show environment" --exec-platform "yamaha"
}

# Fetch interface status on YAMAHA OS by using telnet
function fetch_yamaha_interface_status(){
  HOSTNAME=$1

  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan1" --exec-platform "yamaha"
  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan2" --exec-platform "yamaha"
  echo -n "$HOSTNAME> "
  telee -H $HOSTNAME -C "show status lan3" --exec-platform "yamaha"
}

# Fetch config on YAMAHA OS by using telnet
function fetch_yamaha_config(){
  HOSTNAME=$1

  echo -n "$HOSTNAME# "
  telee -H $HOSTNAME -C "show config" --exec-platform "yamaha"
}
