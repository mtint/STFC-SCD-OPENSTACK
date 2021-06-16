# Setup new Mac from scratch

### Install Xcode 

Installing Xcode and the command line tools need to be done first because it installs `gcc`.
https://developer.apple.com/xcode/features/

Or via the terminal:

```
xcode-select --install
```

### Homebrew 

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Note that Xcode is a pre-req for Homebrew.  

http://brew.sh/

https://github.com/Homebrew/homebrew/wiki/Installation

Install common tools:

    brew update
    brew install git vim tmux postgresql mysql tree


### Set shell to ZSH and install oh-my-zsh

    curl -L http://install.ohmyz.sh | sh

### rbenv and ruby-build

https://github.com/sstephenson/rbenv

    brew update
    brew install rbenv rbenv-gem-rehash ruby-build

    # Install ruby 
    rbenv install 2.7.1
    rbenv global 2.7.1
    rbenv rehash
    
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    source ~/.zshrc
    gem update --system
    gem install bundler rails --no-ri --no-rdoc

### Faster gem installs

For faster gem install tell rubygems to ignore `ri` and `rdoc` creating a `~/.gemrc` with:

    install: --no-ri --no-rdoc
    update: --no-ri --no-rdoc



## Apps

### Alfred

Alfred is an award-winning productivity application for Mac OS X, which aims to save you time in searching your local computer and the web.

http://www.alfredapp.com/

### Dash

Awesome documentation browser. 

> Dash gives your Mac instant offline access to 150+ API documentation sets.

https://itunes.apple.com/us/app/dash-docs-snippets/id458034879?mt=12

http://kapeli.com/dash


### iTerm2 

A nice alternative to `Terminal.app`.

http://www.iterm2.com/


### Solarized color scheme 

A nice color scheme.  

http://ethanschoonover.com/solarized


### Pow

Pow is a zero-config Rack server for Mac OS X. 

    curl get.pow.cx | sh

To get it to work with Apache check: https://github.com/37signals/pow/wiki/Running-Pow-with-Apache

http://pow.cx/

### VLC

VLC is a free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVD, Audio CD, VCD, and various streaming protocols.

http://www.videolan.org/vlc/index.html