#!/bin/bash

## branch | Checkout a branch with the branch name and origin/main
#*    example: branch branchname = git checkout -B branchname origin/main
function branch() {
    git checkout -B $1 origin/main
}

## debranch stash with a message of unstaged branchname, checkout main, delete branchname, pull
#*    example: debranch bug_12345
#*    note: can use git branch autocomplete if you've run the newktd command in this file 
function debranch() {
    git stash save -m unstaged $1 changes
    git checkout main
    git branch -D $1 
    git pull
}

## dbupdated | after updates, run dbic, then update database, then restart all, then yarn build. Used when updating the branch or applying branches with changes to the database.
function dbupdates(){
    dbic
    updatedatabase
    restart_all
    yarn build
}

## applied | after updates restart_all and yarn build, used when updating patches with no db updates or after making changes that require the rebuilds.
function applied(){
    restart_all
    yarn build
}

## setssh | turn on and add ssh key
function setssh(){
    eval "$(ssh-agent -s)"
    ssh-add /kohadevbox/koha/shared/gitssh_id
}

## newktd | sets my ssh, sources aliases, and builds the locate database.
#*    note: run after every new build of ktd/when opening a new window

function newktd(){
    setssh
    source shared/.bash_aliases
    sudo /etc/cron.daily/plocate
    source /usr/share/bash-completion/completions/git
    __git_complete debranch __git_main
}

## use perl-git-bz
##  attach -e $1 HEAD~$2..
#*    example: atch 1234 3 | becomes /kohadevbox/perl-git-bz/bin/git-bz attach -e 1234 HEAD~3..
#*    note: this opens the edit screen and for attaching the last 3 commits to bug 1234.
function atch(){
    /kohadevbox/perl-git-bz/bin/git-bz attach -e $1 HEAD~$2..
}

##  aply $1 |  apply bug 1234
#*    example: aply 1234
function aply(){
    /kohadevbox/perl-git-bz/bin/git-bz apply $1
}

## hre | hard reset to origin main
function hre(){
    git reset --hard origin/main
}

## glg | search the git log
function glg(){
    git log --grep='$1'
}

## gls | find logs that changed a specific string
#*    example: gls string 
function gls(){
    git log -S $1
}

## glc $1 $2 | git log between 2 commits

function glc(){
    git log $1..$2
}

## gln $1 | git log only a number of commits
function gln(){
    git log -n $1
}
## glno $1 | git log only a number of commits with --oneline
function glno(){
    git log -n $1 --oneline
}

## Stash
##  shashl | list full stash
function stashl(){
    git stash list
}
##  stashs | save stash
function stashs(){
    git stash save
}

##  stashm $1 | save with message
function stashm(){
    git stash save -m $1
}

##  stasha $1 | apply a stash
function stasha(){
    git stash apply $1
}

## ipl | install plugins and restart all
function ipl (){
    /kohadevbox/koha/misc/devel/install_plugins.pl
    restart_all
}

## listfunctions | Search my functions
function listfunctions() { grep -i "##"  /kohadevbox/koha/shared/.custom_bash_commands.sh; }

## readfunction | more detail on a specific function
readfunction(){
  echo
  grep -i "##" /kohadevbox/koha/shared/.custom_bash_commands.sh 
  echo
  echo -n "enter function name: "
  read -e name
  echo
  clear
  sed -n "/${name}/,/##/p" /kohadevbox/koha/shared/.custom_bash_commands.sh
}