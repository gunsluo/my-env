FROM alpine:3.22

# # Copy files
# COPY copyables /

WORKDIR /root

RUN \
	# Install packages
	apk add --no-cache \
	# Documentations and man pages
	docs mandoc man-pages \
	# SSH
	openssh mosh \
	# Shell
	fish \
	# Utility tools
	curl ripgrep bat fd fzf git screen fastfetch \
	# Network tools
	tcpdump iperf3 nmap speedtest-cli \
	# Programing languages
	deno \
	# File manager
	nnn \
	# Monitors
	htop bottom btop \
	# Editors
	neovim \
	# Required for setting timezone
	tzdata && \

	# Setup SSH
	ssh-keygen -A && \

	# Setup timezone
	ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["/usr/sbin/sshd", "-D"]
