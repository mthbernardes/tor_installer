#!/bin/bash
echo '[+] - Tor installation'
echo '[+] - Developed by The_Gambler'
echo '[+] - https://github.com/mthbernardes/'
echo '[+] - https://www.facebook.com/mthbernardes'
echo

echo '[+] - Adding Repo...'
echo deb http://deb.torproject.org/torproject.org wheezy main > /etc/apt/sources.list.d/tor.list

echo '[+] - Adding keys...'
echo 
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add –
echo 

echo '[+] - Updating...'
apt-get update > /dev/null
echo 

echo '[+] - Installing... '
echo 
apt-get --yes --force-yes install deb.torproject.org-keyring  --force-yes
apt-get --yes --force-yes install tor  --force-yes
apt-get --yes --force-yes install privoxy  --force-yes
echo 

echo '[+] - Changing configuration files'
sed -i '776s/.*/listen-address  127.0.0.1:8118/' /etc/privoxy/config
sed -i '1292s/#/ /' /etc/privoxy/config
echo 

echo '[+] - Rebooting service and adding to boot'
echo 
/etc/init.d/tor restart && /etc/init.d/privoxy restart  && update-rc.d tor enable && update-rc.d privoxy enable
echo 

echo '[+] - Finished'
echo '[+] - Enjoy your TOR Connection'
