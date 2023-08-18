# cyberghost-ubuntu-fix
For those that are having issues connecting to cyberghost VPN from Ubuntu

I noticed issues on Ubuntu 22.04 and 23.04 after installing cyberghost VPN terminal client. Connection tries for 30+ seconds and then aborts with message **connection failed**. No other explanation.

Useful logs can be found in `/var/log/auth.log`. Cyberghost application just polls their servers and generates openvpn command to connect. In my case openvpn doesn't know the option `--ncp-disable`. 

When running openvpn manually without this option, connection is established.

This script is a workaround for that problem and automates connections to the favorite cyberghost servers, so you don't have to copy/paste openvpn every time you want to connect.

***How to use it?***

Download vpn.sh script in /root because sudo rights are needed to run it, so it was logical place for me. 
Change permission to execute:
`chmod ug+x vpn.sh`
and edit you favorite servers list below `case "$opt" in`.

Put different option letter for each server, so that you call the script you can for example connect to London with:

`/rootvpn.sh -e`

and so on. If you know the server name, just copy it and append `.cg-dialup.net` to the server name.

***Don't forget to change `<username>` to the username on your Linux box.***
To do this edit vpn.sh with editor and change it before first run.


****How to find server name if you don't know it?****

If you don't know server name, run cyberghost command, it will fail, then open `/etc/logs/auth.log` and at the end you will find openvpn command with the server name. Copy that server name and paste it into the script as the new server.

The server list in the script already contains real server names for Bosnia, Serbia, Croatia, Norway, UK, France. At the top you set default server name.

Edit the file according to you needs: remove servers you don't need and add new ones. Set the option letter fo each one.

When calling just:

`/root/vpn.sh`

the default server is connected.

When calling for example:

`/root/vpn.sh -f`

then France is connected, etc.

For disconnecting VPN you can use:

`cyberghostvpn --stop`

For checking status use:

`cyberghostvpn --status`
