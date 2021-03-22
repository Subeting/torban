#!/bin/bash
systemctl disable firewalld
(apt install iptables-persistent -y&&systemctl enable netfilter-persistent.service;iptables -A INPUT -j ACCEPT;iptables -P INPUT ACCEPT)||(yum install iptables-services -y&&systemctl enable iptables;iptables -A INPUT -j ACCEPT;iptables -P INPUT ACCEPT;service iptables save)
iptables -t filter -N TORB
ip6tables -t filter -N TORB
 curl https://raw.githubusercontent.com/Subeting/torban/main/tor.sh > /home/tor.sh
 echo "bash <(curl https://cdn.jsdelivr.net/gh/Subeting/doubi/ban_iptables.sh) banall" >>  /home/tor.sh
 chmod 755 /home/tor.sh
 bash /home/tor.sh
(echo "30 4 * * * bash /home/tor.sh" ; crontab -l)| crontab
 wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/Subeting/doubi/ban_iptables.sh && chmod +x ban_iptables.sh && bash ban_iptables.sh banall


