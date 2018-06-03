#!/bin/sh

set -eu

# language versions
PYTHON_VERSION="3.6.5"
GO_VERSION="1.10.2"
NODE_VERSION="10.2.1"
RUBY_VERSION="2.5.1"

function install_dependencies() {
  if [ "$(which anyenv)" = "" ]; then
    sudo apt-get install -y build-essential zlib1g-dev libbz2-dev libreadline-dev libssl-dev

    echo "Install anyenv..."
    # install anyenv
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    # install anyenv-update
    mkdir -p $($HOME/.anyenv/plugins)
    git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
    # set anyenv initialize config
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.bashrc
    echo 'eval "$(anyenv init -)"' >> $HOME/.bashrc

    echo "Install envs..."
    anyenv install pyenv
    anyenv install rbenv
    anyenv install goenv
    anyenv install nodenv
    exec $SHELL -l

    echo "Install python ${PYTHON_VERSION}..."
    pyenv install ${PYTHON_VERSION}
    pyenv global ${PYTHON_VERSION}

    echo "Install golang ${GO_VERSION}..."
    goenv install ${GO_VERSION}
    goenv global ${GO_VERSION}

    echo "Install nodejs ${NODE_VERSION}... "
    nodenv install ${NODE_VERSION}
    nodenv global ${NODE_VERSION}

    echo "Install ruby ${RUBY_VERSION}..."
    rbenv install ${RUBY_VERSION}
    rbenv global ${RUBY_VERSION}

    echo "Install rust latest..."
    curl https://sh.rustup.rs -sSf | sh -y
  fi
}

sudo apt-get update
sudo apt-get -y upgrade

install_dependencies
