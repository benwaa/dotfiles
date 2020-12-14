git submodule init
git submodule update
git submodule status

ln -sf `pwd`/ben.zsh-theme oh-my-zsh/themes
ln -sf `pwd`/oh-my-zsh ~/.oh-my-zsh
ln -sf `pwd`/.zshrc ~/.zshrc
ln -sf `pwd`/.zshenv ~/.zshenv
ln -sf `pwd`/clean.sh ~/clean.sh
ln -sf `pwd`/.screenrc ~/.screenrc
ln -sf `pwd`/.gitconfig ~/.gitconfig

echo "Install Root Config as well..."
sudo ln -sf `pwd`/oh-my-zsh /root/.oh-my-zsh
sudo ln -sf `pwd`/.zshrc /root/.zshrc
sudo ln -sf `pwd`/.zshenv /root/.zshenv
