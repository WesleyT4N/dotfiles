[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
export LSCOLORS=ExFxBxDxCxegedabagacad

alias grep="grep -Hn --color=auto"
alias egrep="egrep -Hn --color=auto"
alias pgrep="pgrep -Hn --color=auto"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ..="cd .."
alias ls='gls --group-directories-first -pa --color=tty'
alias vim="nvim"
alias c="clear"
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias t="tmux"
alias sshcornell="ssh wt237@ugclinux.cs.cornell.edu"
alias junit="java -ea -jar /Users/wes-tan/Documents/Github/CS-4321-Projects/cs5321_practicum/lib/junit-platform-console-standalone-1.5.0.jar -cp /Users/wes-tan/Documents/Github/CS-4321-Projects/cs5321_practicum/bin:/Users/wes-tan/Documents/Github/CS-4321-Projects/cs5321_practicum/JSqlParser/jsqlparser/jsqlparser.jar"


export PATH=/usr/local/bin:$PATH
# export PATH="/Users/wes-tan/anaconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize
# alias python="/usr/local/bin/python3"
# alias pip="/usr/local/bin/pip3"
alias compmd="for f in *.md; do pandoc "$f" -s -o "./compiled/${f%.md}.pdf" -V geometry:margin=1in; done"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/opt/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH="/usr/local/opt/ruby/bin:$PATH"



git_dirty (){
    [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}

git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(git_dirty))/" -e 's/^/ /'
}

export PS1="\[$(tput bold)\]\[\033[38;5;7m\]\[\033[48;5;0m\] \u@\h \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;15m\]\[\033[48;5;4m\] \w \[$(tput sgr0)\]\n\[\033[38;5;255m\]\[\033[48;5;0m\]\[$(tput bold)\]\$(git_branch) $ \[$(tput sgr0)\] "
