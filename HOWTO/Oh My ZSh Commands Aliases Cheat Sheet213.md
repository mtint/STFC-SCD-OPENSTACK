# Oh My ZSh Commands Aliases Cheat Sheet213

Here we have all the aliases supported by Oh My ZSH. You can even search for any particular alias for full command specification; we do full text searching and get the results. Its very easy and best way to get what you want in no time. Try it and share in social media to friends to promote us.

## OhMyZSH Commands

CommandDescription

### tabs

`Create a new tab in the current directory (macOS - requires enabling access for assistive devices under System Preferences).`

### take

`Create a new directory and change to it, will create intermediate directories as required.`

### x / extract

`Extract an archive (supported types: tar.{bz2,gz,xz,lzma}, bz2, rar, gz, tar, tbz2, tgz, zip, Z, 7z).`

### zsh\_stats

`Get a list of the top 20 commands and how many times they have been run.`

### uninstall\_oh\_my\_zsh

`Uninstall Oh-my-zsh.`

### upgrade\_oh\_my\_zsh

`Upgrade Oh-my-zsh.`

### exec zsh

`Apply changes made to zshrc`

---

## Shell Commands

AliasCommand

### alias

`list all aliases`

### ..

`cd ..`

### ...

`cd ../..`

### ....

`cd ../../..`

### .....

`cd ../../../..`

### /

`cd /`

### ~

`cd ~`

### cd +n

`switch to directory number n`

### -

`cd -`

### 1

`cd -`

### 2

`cd -2`

### 3

`cd -3`

### 4

`cd -4`

### 5

`cd -5`

### 6

`cd -6`

### 7

`cd -7`

### 8

`cd -8`

### 9

`cd -9`

### md

`mkdir -p`

### rd

`rmdir`

### d

`dirs -v (lists last used directories)`

---

## Tab Completion and Suggestions

Tab for Autocomplete and Double Tab for Suggestions

### ls -(tab)

### cap (tab)

### rake (tab)

### ssh (tab)

### sudo umount (tab)

### kill (tab)

### unrar (tab)

### ...

---

## Git commands Aliases

AliasCommand

### g

`git`

### ga

`git add`

### gau

`git add --update (Also: "git add -u")`

### gaa

`git add --all`

### gapa

`git add --patch`

### gb

`git branch`

### gba

`git branch -a`

### gbd

`git branch -d`

### gbda

`git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d`

### gbl

`git blame -b -w`

### gbnm

`git branch --no-merged`

### gbr

`git branch --remote`

### gbs

`git bisect`

### gbsb

`git bisect bad`

### gbsg

`git bisect good`

### gbsr

`git bisect reset`

### gbss

`git bisect start`

### gc

`git commit -v`

### gc!

`git commit -v --amend`

### gca

`git commit -v -a`

### gca!

`git commit -v -a --amend`

### gcan!

`git commit -v -a --no-edit --amend`

### gcans!

`git commit -v -a -s --no-edit --amend`

### gcam

`git commit -a -m`

### gcsm

`git commit -s -m`

### gcb

`git checkout -b`

### gcf

`git config --list`

### gcl

`git clone --recurse-submodules`

### gclean

`git clean -id`

### gpristine

`git reset --hard && git clean -dffx`

### gcm

`git checkout master`

### gcd

`git checkout develop`

### gcmsg

`git commit -m`

### gco

`git checkout`

### gcount

`git shortlog -sn`

### gcp

`git cherry-pick`

### gcpa

`git cherry-pick --abort`

### gcpc

`git cherry-pick --continue`

### gcs

`git commit -S`

### gd

`git diff`

### gdca

`git diff --cached`

### gdct

`git describe --tags `git rev-list --tags --max-count=1``

### gds

`git diff --staged`

### gdt

`git diff-tree --no-commit-id --name-only -r`

### gdw

`git diff --word-diff`

### gf

`git fetch`

### gfa

`git fetch --all --prune`

### gfo

`git fetch origin`

### gg

`git gui citool`

### gga

`git gui citool --amend`

### ggpnp

`git pull origin $(current_branch) && git push origin $(current_branch)`

### ggpull

`git pull origin $(current_branch)`

### ggl

`git pull origin $(current_branch)`

### ggpur

`git pull --rebase origin $(current_branch)`

### ggu

`git pull --rebase origin $(current_branch)`

### glum

`git pull upstream master`

### ggpush

`git push origin $(current_branch)`

### ggp

`git push origin $(current_branch)`

### ggfl

`git push --force-with-lease origin <your_argument>/$(current_branch)`

### ggsup

`git branch --set-upstream-to=origin/$(current_branch)`

### gpsup

`git push --set-upstream origin $(current_branch)`

### ghh

`git help`

### gignore

`git update-index --assume-unchanged`

### gignored

`git ls-files -v`

### git-svn-dcommit-push

`git svn dcommit && git push github master:svntrunk`

### gk

`\gitk --all --branches`

### gke

`\gitk --all $(git log -g --pretty=%h)`

### gl

`git pull`

### glg

`git log --stat`

### glgg

`git log --graph`

### glgga

`git log --graph --decorate --all`

### glgm

`git log --graph --max-count=10`

### glgp

`git log --stat -p`

### glo

`git log --oneline --decorate`

### glog

`git log --oneline --decorate --graph`

### glol

`git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\'`

### glola

`git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --all`

### glp

`_git_log_prettily (Also: "git log --pretty=$1")`

### gm

`git merge`

### gma

`git merge --abort`

### gmom

`git merge origin/master`

### gmt

`git mergetool --no-prompt`

### gmtvim

`git mergetool --no-prompt --tool=vimdiff`

### gmum

`git merge upstream/master`

### gp

`git push`

### gpd

`git push --dry-run`

### gpoat

`git push origin --all && git push origin --tags`

### gpu

`git push upstream`

### gpv

`git push -v`

### gr

`git remote`

### gra

`git remote add`

### grb

`git rebase`

### grba

`git rebase --abort`

### grbc

`git rebase --continue`

### grbd

`git rebase develop`

### grbi

`git rebase -i`

### grbm

`git rebase master`

### grbs

`git rebase --skip`

### grh

`git reset (Also: "git reset HEAD")`

### grhh

`git reset --hard (Also: "git reset HEAD --hard")`

### grmv

`git remote rename`

### grrm

`git remote remove`

### grs

`git restore`

### grset

`git remote set-url`

### grt

`cd $(git rev-parse --show-toplevel || echo ".")`

### gru

`git reset --`

### grup

`git remote update`

### grv

`git remote -v`

### gsb

`git status -sb`

### gsd

`git svn dcommit`

### gsi

`git submodule init`

### gsps

`git show --pretty=short --show-signature`

### gsr

`git svn rebase`

### gss

`git status -s`

### gst

`git status`

### gsta

`git stash save`

### gstaa

`git stash apply`

### gstd

`git stash drop`

### gstl

`git stash list`

### gstp

`git stash pop`

### gstc

`git stash clear`

### gsts

`git stash show --text`

### gsu

`git submodule update`

### gts

`git tag -s`

### gunignore

`git update-index --no-assume-unchanged`

### gunwip

`git log -n 1 | grep -q -c "--wip--" && git reset HEAD~1`

### gup

`git pull --rebase`

### gupv

`git pull --rebase -v`

### gvt

`git verify-tag`

### gwch

`git whatchanged -p --abbrev-commit --pretty=medium`

### gwip

`git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"`

---

## Editor Shortcuts

AliasCommand

### stt

`(When using sublime plugin) Open current directory in Sublime Text 2/3`

### v

`(When using vi-mode plugin) Edit current command line in Vim`

---

## Symfony2 aliases

AliasCommand

### sf

`php ./app/console`

### sfcl

`php app/console cache:clear`

### sfcontainer

`sf debug:container`

### sfcw

`sf cache:warmup`

### sfgb

`sf generate:bundle`

### sfroute

`sf debug:router`

### sfsr

`sf server:run -vvv`

---

## tmux Aliases

AliasCommand

### ta

`tmux attach -t`

### tad

`tmux attach -d -t`

### ts

`tmux new-session -s`

### tl

`tmux list-sessions`

### tksv

`tmux kill-server`

### tkss

`tmux kill-session -t`

---

## systemctl aliases

CommandDescription

### sc-status NAME

`show the status of the NAME process`

### sc-show NAME

`show the NAME systemd .service file`

### sc-start NAME

`start the NAME process`

### sc-stop NAME

`stop the NAME process`

### sc-restart NAME

`restart the NAME process`

### sc-enable NAME

`enable the NAME process to start at boot`

### sc-disable NAME

`disable the NAME process at boot`

---

## Ruby On Rails Aliases

AliasCommand

### rc

`rails console`

### rcs

`rails console --sandbox`

### rd

`rails destroy`

### rdb

`rails dbconsole`

### rg

`rails generate`

### rgm

`rails generate migration`

### rp

`rails plugin`

### ru

`rails runner`

### rs

`rails server`

### rsd

`rails server --debugger`

### rsp

`rails server --port`

---

## RAILS\_ENV Aliases

AliasCommand

### RED

`RAILS_ENV=development`

### REP

`RAILS_ENV=production`

### RET

`RAILS_ENV=test`