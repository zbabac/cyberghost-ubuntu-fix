#!/bin/bash
# set default server
SERVER="belgrade-s403-i09.cg-dialup.net"
# add your favorite servers in the case getopts options below
# add first new letter for the new server in the line below this one
while getopts ":hfbcens" opt; do
  case "$opt" in
    # add new letter and server name below this line
    f)SERVER="paris-s404-i11.cg-dialup.net";;
    b)SERVER="travnik-s401-i07.cg-dialup.net";;
    e)SERVER="london-s440-i03.cg-dialup.net";;
    s)SERVER="belgrade-s403-i09.cg-dialup.net";;
    n)SERVER="oslo-s409-i11.cg-dialup.net";;
    c)SERVER="zagreb-s403-i10.cg-dialup.net";;
    h)echo "usage: $0 [-h] [-b] [-s] [-e] [-n] [-c] [-f]"
      echo ""
      echo "### -b ### BiH"
      echo "### -s ### Srbija"
      echo "### -c ### Hrvatska" 
      echo "### -e ### England"
      echo "### -n ### Norge" 
      echo "### -f ### France"
      echo "### -h ### Print this help"
      exit;;
  esac
done
# Change the <username> below in openvpn command with user on your Linux box!!!!
openvpn --dev tun --auth-user-pass /home/<username>/.cyberghost/openvpn/auth --client --proto udp --resolv-retry infinite --persist-key --persist-tun --nobind --cipher AES-256-CBC --auth SHA256 --ping 15 --ping-restart 60 --explicit-exit-notify 2 --script-security 2 --remote-cert-tls server --verb 4 --route-delay 5 20 --mute-replay-warnings --remote $SERVER 443 --log /var/log/cyberghost.log --daemon --dhcp-option DOMAIN-ROUTE . --up /usr/local/cyberghost/update-systemd-resolved --up-restart --down /usr/local/cyberghost/update-systemd-resolved --down-pre --ca /usr/local/cyberghost/certs/openvpn/ca.crt --cert /usr/local/cyberghost/certs/openvpn/client.crt --key /usr/local/cyberghost/certs/openvpn/client.key
