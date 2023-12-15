#!/bin/sh
echo "Executing Startup Script"

sysctl -w net.ipv4.conf.all.route_localnet=1
iptables -t nat -A POSTROUTING -j MASQUERADE
echo 'net.ipv4.ip_forward = 1' > /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

echo "starting tailscaled"
tailscaled --statedir=/tmp &

echo "sleeping"
sleep 10s

echo "starting tailscale"
tailscale up --reset --auth-key=[auth key] --accept-routes --advertise-routes=[local subnet]/24

wait $!