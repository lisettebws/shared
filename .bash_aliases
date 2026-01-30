## la | list all
## 
alias la="ls -a"
## sla | sudo list all
alias sla='sudo ls -a'
##  
alias cd..='cd ..'
## edit
alias edit='vim'
## svi | sudo vim
alias svi='sudo vim'
##  
## -GREP-
##  egrep | grep with an expression | egrep "expression"
alias egrep='grep -E --color=auto'
##  fgrep | grep with pattern recognition from external file
alias fgrep='grep -F --color=auto'
##  ggo | oneline pretty grep
alias ggo='git grep --pretty=oneline'
## grep | make grep use color
alias grep='grep --color=auto'
## -/GREP-
## 
## -GIT LOG-
##  glgg | git log graph, 10
alias glgg='git log --graph --max-count=10' 
##  glga | got log with a graph and decoration
alias glgga='git log --graph --decorate --all'
##  glo | git log one line
alias glo='git log --pretty=oneline'
##  glog | git log with online, graph, and color
alias glog='git log --oneline --decorate --color --graph'
## -/GIT LOG-
##  
## -ZGREP-
##  xzegrep | search compressed files for regex
alias xzegrep='xzegrep --color=auto'
##  xzfgrep | search compressed files for regex
alias xzfgrep='xzfgrep --color=auto'
##  xzgrep | search compressed files for regex
alias xzgrep='xzgrep --color=auto'
##  zegrep | grep with an expression in compressed files | zegrep "expression"
alias zegrep='zegrep --color=auto'
##  zfgrep | grep with attern recognition from external file in compressed files | zfgrep "expression"
alias zfgrep='zfgrep --color=auto'
##  zgrep | grep in compressed files
alias zgrep='zgrep --color=auto'
## -/ZGREP
##  
## gab | git bz apply --abort
alias gab='git bz apply --abort'
##  
## -SSH-
##  evs | eval ssh agent
alias evs='eval "$(ssh-agent -s)"'
##  sha | add shared/gitssh_id
alias sha='ssh-add shared/gitssh_id'
## -/SSH-

## you don't build yarn, you spin yarn 
alias spin_yarn='yarn build'