
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH=$PATH:~/Library/Android/sdk/platform-tools/
export PATH=~/development/flutter/bin:$PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"
# eval "$(rbenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# export PATH=$PATH:$HOME/protoc/bin

dcp() {
 docker-compose $@
}
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/Far/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/Far/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Far/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/Far/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
