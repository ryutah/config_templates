#!/bin/sh
sudo apt update
sudo apt upgrade

sudo apt install zsh zlib1g-dev libssl-dev

# Install prezto
echo ${ZDOTDIR:-$HOME}
for file in `\ls --ignore="*md" $HOME/.zprezto/runcoms`; do
  echo $file
  ln -s $HOME/.zprezto/runcoms/$file $HOME/.$file
done


# Install anyenv
git clone https://github.com/riywo/anyenv $HOME/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.zshrc
echo 'eval "$(anyenv init -)"' >> $HOME/.zshrc

mkdir -p $HOME/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update

# Install envs
$HOME/.anyenv/bin/anyenv install pyenv
$HOME/.anyenv/bin/anyenv install rbenv
$HOME/.anyenv/bin/anyenv install goenv

# Install langs
$HOME/.anyenv/envs/pyenv/bin/pyenv install 3.6.4
$HOME/.anyenv/envs/pyenv/bin/pyenv install 2.7.14
$HOME/.anyenv/envs/pyenv/bin/pyenv global 3.6.4
$HOME/.anyenv/envs/pyenv/bin/pyenv rehash
$HOME/.anyenv/envs/pyenv/bin/pyenv rehash

$HOME/.anyenv/envs/rbenv/bin/rbenv install 2.5.0
$HOME/.anyenv/envs/rbenv/bin/rbenv global 2.5.0
$HOME/.anyenv/envs/rbenv/bin/rbenv rehash

$HOME/.anyenv/envs/goenv/bin/goenv install 1.9.2
$HOME/.anyenv/envs/goenv/bin/goenv global 1.9.2
$HOME/.anyenv/envs/goenv/bin/goenv rehash
