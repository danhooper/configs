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

## Packages
On Ubuntu, install a newer VIM.
```
sudo apt-add-repository ppa:nmi/vim-snapshots
sudo apt-get update
sudo apt-get upgrade
```

## Installing
sudo apt-get install cmake build-essential python-dev

or

sudo yum install cmake

```
pushd configs
sudo pip install -r requirements.txt
vim +BundleInstall +qall
popd
pushd ~/.vim/bundle/YouCompleteMe
./install.sh
popd
```

## Vim Cheat Sheet
* ,e Edit a file in the same directory as current file
* ,v Edit a file in a new vertical pane
* ,s Edit a file in a new horizontal pane
* ,h Edit a file in a new horizontal pane
* ,jd Jump to Definition
* ,vd Vertical Jump to Definition
* Ctrl-O Jump Backward
* Ctrl-I Jump Forward
