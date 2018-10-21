##.bashrc by takuro
export CYGDRIVE="/cygdrive"
#colors
export PS1="\[\033[35m\]\u@\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export LSCOLORS=gxfxcxdxbxegedabagacad
alias l='ls -1 --color'
alias ls='ls --color'
alias la='ls -1 --color -a'
alias ll='ls -1 --color -l'
alias open='cygstart'

alias cdw='cd ~/research/mruby-on-tecs/hr-tecs/workspace/'
alias cdwmr='cd ~/research/mruby-on-tecs/hr-tecs/workspace/mruby_samples/'
alias cdwr='cd ~/research/mruby-on-tecs/hr-tecs/workspace/ruby/'
alias cdwb='cd ~/research/mruby-on-tecs/hr-tecs/workspace/sample_bluetooth/'
alias cdws='cd ~/research/mruby-on-tecs/hr-tecs/workspace/sample_singlethread/'
alias cdwm='cd ~/research/mruby-on-tecs/hr-tecs/workspace/sample_multithread/'

alias sshcount='ssh t-yamamoto@133.1.96.143'
alias sshweb='ssh wwwadmin@133.1.96.18'
alias sshemb='ssh sd0911541@gmoserver.jp@ssh13.gmoserver.jp'

alias winmerge='/cygdrive/c/Program\ Files/WinMerge/WinMergeU.exe'
alias winm='/cygdrive/c/Program\ Files/WinMerge/WinMergeU.exe'

alias telp='telnet 192.168.1.200 23'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
