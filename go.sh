#!/bin/bash
 curl https://raw.githubusercontent.com/Subeting/torban/main/tor.sh > /home/tor.sh
 chmod 755 /home/tor.sh
 ((echo "0 4 * * * bash /home/tor.sh";crontab -l)crontab)
 wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/ban_iptables.sh && chmod +x ban_iptables.sh && bash ban_iptables.sh banall

curl https://raw.githubusercontent.com/Subeting/torban/main/tor.sh |bash