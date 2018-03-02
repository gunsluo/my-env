alias sshlyj="ssh root@211.149.176.65 -p 22000"
alias sshjpan="ssh -p 22000 root@172.104.127.173"
alias sshme="ssh root@120.27.95.46"
alias sshnl="ssh -p 22002 root@188.226.174.137"
alias sshls="ssh root@192.168.2.36"

set -g -x GOROOT $HOME/go
set -g -x GOPATH $HOME/gopath
set -g -x GOBIN $GOPATH/bin
set -g -x PATH $GOROOT/bin $GOPATH/bin $PATH
set -g -x LC_ALL en_US.UTF-8
set -g -x LANG en_US.UTF-8

function setproxy
    set -g -x http_proxy http://localhost:8016
    set -g -x https_proxy http://localhost:8016
    set -g -x ftp_proxy http://localhost:8016
end

function unsetproxy
    set -e http_proxy
    set -e https_proxy
    set -e ftp_proxy
end
