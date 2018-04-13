source ~/.git-prompt.sh

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

alias js='python -mjson.tool'

# PS1                                                                                                                                                                 
BLACK='232'                                                                                                                                                           
BLACK_BG=$(tput setab $BLACK)                                                                                                                                         
BLACK_FG=$(tput setaf $BLACK)                                                                                                                                         
BLUE='75'                                                                                                                                                             
BLUE_BG=$(tput setab $BLUE)                                                                                                                                           
BLUE_FG=$(tput setaf $BLUE)                                                                                                                                           
GREEN='76'                                                                                                                                                            
GREEN_BG=$(tput setab $GREEN)                                                                                                                                         
GREEN_FG=$(tput setaf $GREEN)                                                                                                                                         
LIGHT_GRAY='252'                                                                                                                                                      
LIGHT_GRAY_FG=$(tput setaf $LIGHT_GRAY)                                                                                                                               
RED='160'                                                                                                                                                             
RED_FG=$(tput setaf $RED)                                                                                                                                             
TEAL='23'                                                                                                                                                             
TEAL_BG=$(tput setab $TEAL)                                                                                                                                           
TEAL_FG=$(tput setaf $TEAL)                                                                                                                                           
RESET=$(tput sgr0)                                                                                                                                                    
TRIANGLE=$'\uE0B0'                                                                                                                                                    
                                                                                                                                                                      
parse_git_branch() {                                                                                                                                                  
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'                                                                                                      
}                                                                                                                                                                     
                                                                                                                                                                      
formatted_git_branch() {                                                                                                                                              
  local branch=$(parse_git_branch)                                                                                                                                    
  if [[ -z $branch ]]; then                                                                                                                                           
    echo -e "\001${TEAL_BG}\002\001${BLUE_FG}\002${TRIANGLE}"                                                                                                         
  else                                                                                                                                                                
    echo -e "\001${GREEN_BG}\002\001${BLUE_FG}\002${TRIANGLE}\001${GREEN_BG}\002\001${BLACK_FG}\002 $branch \001${TEAL_BG}\002\001${GREEN_FG}\002${TRIANGLE}"         
  fi                                                                                                                                                                  
}                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                         
PS1="\[${BLACK_FG}\]\[${BLUE_BG}\]\w \$(formatted_git_branch)\[${LIGHT_GRAY_FG}\]\[${TEAL_BG}\] $ \[${TEAL_FG}\]\[${BLACK_BG}\]${TRIANGLE}\[${RESET}\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='ls -FG'
alias less='less -R' # Less with colors
alias grep='grep --colour=auto'
alias grepr='grep -r'
alias ip='ifconfig | grep inet | grep -v inet6 | grep -v 127.0.0.1 | cut -d " " -f 2'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s $HOME/.bashrc.local ]] && source $HOME/.bashrc.local
