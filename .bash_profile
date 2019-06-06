export PS1="\[$(tput bold)\]\[\033[38;5;7m\]\[\033[48;5;0m\] \u@\h \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;15m\]\[\033[48;5;4m\] \w \[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[48;5;-1m\] \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ..="cd .."
alias ls='gls --group-directories-first -pa --color=tty'
alias vim="nvim"
alias c="clear"
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"

export PATH=/usr/local/bin:$PATH
export PATH="/Users/wesleyt/anaconda3/bin:$PATH"
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/wesleyt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/Users/wesleyt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/wesleyt/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/Users/wesleyt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
