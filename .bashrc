##.bashrc by takuro

WINCMDS="ping tracert ipconfig route netstat arp nbtstat diff"
for i in $WINCMDS; do
    alias $i="wincmd $i"
done

function wincmd() {
    local CMD=$1
    shift
    ($CMD $* 2>&1 | nkf -w | dos2unix) 2>&1 | nkf -w | dos2unix 1>&2
}