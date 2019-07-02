##.bashrc by takuro

#colors
export PS1="\[\033[35m\]\u@\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export LSCOLORS=gxfxcxdxbxegedabagacad
alias l='ls -1 --color'
alias ls='ls --color'
alias la='ls -1 --color -a'
alias ll='ls -1 --color -l'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#--function----------------------------------------
function explorer_wrapper {
    explorer $2$(cygpath -w -a $1)
};
function e {
    if [ $# -eq 0 ]; then
	target=.
    else
	target=$1
    fi
    explorer_wrapper $target
};
function eh {
    if [ $# -eq 0 ]; then
	target=.
    else
	target=$1
    fi
    explorer_wrapper $target '/e,'
};
function er {
    if [ $# -eq 0 ]; then
	target=.
    else
	target=$1
    fi
    explorer_wrapper $target '/e,/root,'
};

WINCMDS="ping tracert ipconfig route netstat arp nbtstat diff"
for i in $WINCMDS; do
    alias $i="wincmd $i"
done

function wincmd() {
    local CMD=$1
    shift
    ($CMD $* 2>&1 | nkf -w | dos2unix) 2>&1 | nkf -w | dos2unix 1>&2
}
export PATH="$HOME/bin:$PATH"
