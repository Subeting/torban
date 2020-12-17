#!/bin/bash
v6=':'
iptables -X TORB
iptables -t filter -N TORB
iptables -I INPUT -j TORB
ip6tables -X TORB
ip6tables -t filter -N TORB
ip6tables -I INPUT -j TORB
curl https://www.dan.me.uk/torlist/ > torip.txt
curl https://raw.githubusercontent.com/SecOps-Institute/Tor-IP-Addresses/master/tor-nodes.lst >> torip.txt
echo "downloaded!Tor ban started."
 cat torip.txt | while read line
 do
   if [[ $line =~ $v6 ]];
   then
   ip6tables -t filter -A TORB -s ${line} -j DROP
   ip6tables -t filter -A TORB -d ${line} -j DROP
   else
   iptables -t filter -A TORB -s ${line} -j DROP
   iptables -t filter -A TORB -d ${line} -j DROP
   fi
 done
