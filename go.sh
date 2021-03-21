#!/bin/bash
iptables -t filter -N TORB
ip6tables -t filter -N TORB
 curl https://raw.githubusercontent.com/Subeting/torban/main/tor.sh > /home/tor.sh
 echo "bash <(curl https://cdn.jsdelivr.net/gh/Subeting/doubi/ban_iptables.sh) banall" >>  /home/tor.sh
 chmod 755 /home/tor.sh
(echo "30 4 * * * bash /home/tor.sh" ; crontab -l)| crontab
 wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/Subeting/doubi/ban_iptables.sh && chmod +x ban_iptables.sh && bash ban_iptables.sh banall



