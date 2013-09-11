configs
=======
## Cloning

`git clone git@github.com:danhooper/configs.git` OR
`git clone https://github.com/danhooper/configs.git`

## Installing
```
pushd configs
sudo pip install -r requirements.txt
git submodule init
git submodule update
vim +BundleInstall +qall
popd
```
