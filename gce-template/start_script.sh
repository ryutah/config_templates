#!/bin/sh

set -eu

# language versions
PYTHON_VERSION="3.6.5"
GO_VERSION="1.10.2"
NODE_VERSION="10.2.1"
RUBY_VERSION="2.5.1"

function install_docker() {
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  # XXX set `edge` because of not being able to install docker ce on ubuntu 18.04 at 2018/06/07
  sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     edge"
  sudo apt-get update
  sudo apt-get install -y docker-ce
  sudo groupadd docker
  sudo usermod -aG docker $USER
}

function install_languages() {
  sudo apt-get install -y build-essential zlib1g-dev libbz2-dev libreadline-dev libssl-dev

  echo "Install anyenv..."
  # install anyenv
  git clone https://github.com/riywo/anyenv $HOME/.anyenv
  # install anyenv-update
  mkdir -p $($HOME/.anyenv/plugins)
  git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
  # set anyenv initialize config
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >>$HOME/.bashrc
  echo 'eval "$(anyenv init -)"' >>$HOME/.bashrc

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
  # XXX failed to install ruby by happening error "recipe for target 'rdoc' failed"
  # so disable rdoc build by option. ref https://github.com/postmodern/ruby-install/issues/223#issuecomment-340789757
  RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install ${RUBY_VERSION}
  rbenv global ${RUBY_VERSION}

  echo "Install rust latest..."
  curl https://sh.rustup.rs -sSf | sh -y
}

function install_dependencies() {
  if [ "$(which anyenv)" = "" ]; then
    install_languages
  fi
  if [ "$(which docker)" = "" ]; then
    install_docker
  fi
}

sudo apt-get update
sudo apt-get -y upgrade

install_dependencies
