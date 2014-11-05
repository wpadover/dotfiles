source ~/.git-prompt.sh

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PS1='\[\e[1;32m\]\u\[\e[0;39m\]|\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\] \[\e[1;37m\]\[\e[0;39m\]$ '

alias less='less -R' # Less with colors
alias grep='grep --colour=auto'
alias grepr='grep -r'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s $HOME/.bashrc.local ]] && source $HOME/.bashrc.local
