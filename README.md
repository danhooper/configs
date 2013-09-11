configs
=======
## Cloning

`git clone git@github.com:danhooper/configs.git` OR
`git clone https://github.com/danhooper/configs.git`

## Symlinks
```
ln -s ~/git/vim ~/.vim
ln -s ~/git/vimrc ~/.vimrc
ln -s ~/git/bashrc ~/.bashrc
ln -s ~/git/gitconfig ~/.gitconfig
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
