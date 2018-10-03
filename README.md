configs
=======
## Cloning

`git clone git@github.com:danhooper/configs.git` OR
`git clone https://github.com/danhooper/configs.git`

## Symlinks
```
ln -s ~/git/configs/vim ~/.vim
ln -s ~/git/configs/vimrc ~/.vimrc
ln -s ~/git/configs/bashrc ~/.bashrc
ln -s ~/git/configs/gitconfig ~/.gitconfig
ln -s ~/git/configs/git-prompt.sh ~/.git-prompt.sh
```

## Powerline Font Config
See https://powerline.readthedocs.org/en/latest/installation.html#fonts-installation

Or https://github.com/powerline/fonts and run the install.sh

## Installing

### Ubuntu Deps
```
sudo apt-get install cmake build-essential python-dev python-pip nodejs
```

### Mac Deps
Install homebrew first.

```
brew install python@2 cmake node
brew install vim
brew unlink vim && brew link vim
```

### Installing
After you have the dependencies installed run:

```
pushd configs
git submodule init
git submodule update
sudo pip install -r requirements.txt
vim +BundleInstall +qall
popd
pushd ~/.vim/bundle/YouCompleteMe
./install.py
popd
# for Javascript jshint support in syntastic
sudo npm install -g jshint jscs
# tern for vim
pushd ~/.vim/bundle/tern_for_vim
npm install
popd
```


## Vim Cheat Sheet
* ,e Edit a file in the same directory as current file
* ,v Edit a file in the same directory in a new vertical pane
* ,s Edit a file in a new horizontal pane
* ,h Edit a file in a new horizontal pane
* ,jd Jump to Definition
* ,vd Vertical Jump to Definition
* ,ig Indent Guide
* Ctrl-O Jump Backward
* Ctrl-I Jump Forward

## Mac Tools
https://iterm2.com/

https://www.spectacleapp.com/

https://pilotmoon.com/scrollreverser/

https://brew.sh/
