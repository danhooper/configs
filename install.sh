#!/bin/bash

MYDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $MYDIR
git submodule init
git submodule update

ln -s $MYDIR/vim ~/.vim
ln -s $MYDIR/vimrc ~/.vimrc
ln -s $MYDIR/bashrc ~/.bashrc
ln -s $MYDIR/bash_profile ~/.bash_profile
ln -s $MYDIR/gitconfig ~/.gitconfig
ln -s $MYDIR/git-prompt.sh ~/.git-prompt.sh

brew install python
# python should be installed first
# so vim picks that version up
brew install node vim cmake
pip install -r requirements.txt
npm install -g jshint

vim +BundleInstall +qall

pushd ~/.vim/bundle/YouCompleteMe
./install.sh
popd
pushd ~/.vim/bundle/tern_for_vim
npm install
popd

pushd $MYDIR/fonts
./install.sh
popd
