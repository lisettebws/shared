#!/bin/bash

#Checkout a branch with the branch name and origin/main
# branch branchname = git checkout -B branchname origin/main
function branch() {
    git checkout -B $1 origin/main
}

#delete branch 
#stash with a message of unstaged branchname, checkout main, delete branchname, pull
function debranch() {
    git stash save -m unstaged $1
    git checkout main
    git branch -D $1 
    git pull
}

#after updates, run dbic, then update database, then restart all, then yarn build. Used when updating the branch or applying branches with changes to the database.
function dbupdates(){
    dbic
    updatedatabase
    restart_all
    yarn build
}

#after updates restart_all and yarn build, used when updating patches with no db updates or after making changes that require the rebuilds.
function applied(){
    restart_all
    yarn build
}

#turn on and add ssh key
function setssh(){
    eval "$(ssh-agent -s)"
    ssh-add /kohadevbox/koha/shared/gitssh_id
}

#run after every new build of ktd/when opening a new window
#sets my ssh, sources aliases, and builds the locate database.
function newktd(){
    setssh
    source shared/.bash_aliases
    sudo /etc/cron.daily/plocate
}

#use perl-git-bz to attach
#example: atch 1234 3
# becomes /kohadevbox/perl-git-bz/bin/git-bz attach -e 1234 HEAD~3..
#this opens the edit screen and for attaching the last 3 commits to bug 1234.
function atch(){
    /kohadevbox/perl-git-bz/bin/git-bz attach -e $1 HEAD~$2..
}

function hre(){
    git reset --hard origin/main
}

#search the git log
function glg(){
    git log --grep='$1'
}

#find logs that changed a specific string
function gls(){
    git log -S $1
}

#git log between 2 commits
function glc(){
    git log $1..$2
}

#git log only a number of commits
function gln(){
    git log -n $1
}
#git log only a number of commits with --oneline
function glno(){
    git log -n $1 --oneline
}

#list full stash
function stashl(){
    git stash list
}
function stashs(){
    git stash save
}
function stashm(){
    git stash save -m $1
}
function stasha(){
    git stash apply $1
}
