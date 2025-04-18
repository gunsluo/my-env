#!/bin/sh

wget https://download.hysteria.network/app/latest/hysteria-linux-amd64

mv hysteria-linux-amd64 /usr/local/bin/hysteria
chmod +x /usr/local/bin/hysteria

mkdir /etc/hysteria
cat <<EOF >/etc/hysteria/config.yaml
listen: :33000

acme:
  domains:
    - luojihd.com
  email: gunsluo@gmail.com

auth:
  type: password
  password: password

speedTest: true

quic:
  initStreamReceiveWindow: 67108864
  maxStreamReceiveWindow: 67108864
  initConnReceiveWindow: 134217728
  maxConnReceiveWindow: 134217728

outbounds:
  - name: outbound_direct
    type: direct

masquerade:
  type: file
  file:
    dir: /usr/share/nginx/html/
  listenHTTPS: :443
  forceHTTPS: true
EOF

chmod 600 /etc/hysteria/config.yaml

cat <<EOF >/etc/init.d/hysteria
#!/sbin/openrc-run

supervisor=supervise-daemon

description="Hysteria is a feature-packed network utility optimized for networks of poor quality (e.g. satellite connections, congested public Wi-Fi, connecting from China to servers abroad)"
pidfile="/run/\$RC_SVCNAME.pid"
command=\${command:-/usr/local/bin/hysteria}
cfgfile=\${cfgfile:-/etc/hysteria/config.yaml}
command_args="-c \$cfgfile server"
command_background=true

depend() {
  need net
  after firewall
}

start_pre() {
  iptables -t nat -A PREROUTING -i eth0 -p udp --dport 33001:33999 -j DNAT --to-destination :33000
  ip6tables -t nat -A PREROUTING -i eth0 -p udp --dport 33001:33999 -j DNAT --to-destination :33000
}

stop_post() {
  iptables -t nat -D PREROUTING -i eth0 -p udp --dport 33001:33999 -j DNAT --to-destination :33000
  ip6tables -t nat -D PREROUTING -i eth0 -p udp --dport 33001:33999 -j DNAT --to-destination :33000
}
EOF
chmod +x /etc/init.d/hysteria

# rc-service hysteria start
