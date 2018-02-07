alias sshlyj="ssh root@211.149.176.65 -p 22000"
alias sshjpan="ssh -p 22000 root@172.104.127.173"
alias sshme="ssh root@120.27.95.46"
alias sshnl="ssh -p 22002 root@188.226.174.137"

set GOROOT $HOME/go
set GOPATH $HOME/gopath
set GOBIN $GOPATH/bin
set PATH $GOROOT/bin $GOPATH/bin $PATH

function setproxy
    export {http,https,ftp}_proxy="http://localhost:8016"
end

function unsetproxy
    unset {http,https,ftp}_proxy
end

