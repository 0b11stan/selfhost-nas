iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -P INPUT DROP

iptables -N TCP
iptables -N UDP

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
iptables -A INPUT --reject-with icmp-proto-unreachable -j REJECT

# Regular SSH
iptables -A TCP --dport 22 -j ACCEPT

# OpenMediaVault's web administration portal
iptables -A TCP --dport 443 -j ACCEPT
iptables -A TCP --dport 80 -j ACCEPT

# SAMBA's tcp traffic
iptables -A TCP --dport 139 -j ACCEPT
iptables -A TCP --dport 445 -j ACCEPT

# RPC traffic
iptables -A TCP --dport 111 -j ACCEPT

# SAMBA's udp traffic
iptables -A UDP --dport 137 -j ACCEPT
iptables -A UDP --dport 138 -j ACCEPT

