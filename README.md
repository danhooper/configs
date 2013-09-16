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

## Installing
```
pushd configs
sudo pip install -r requirements.txt
git submodule init
git submodule update
vim +BundleInstall +qall
popd
```
