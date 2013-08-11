git submodule init
git submodule update
git submodule status

ln -si `pwd`/ben.zsh-theme oh-my-zsh/themes
ln -si `pwd`/oh-my-zsh ~/.oh-my-zsh
ln -si `pwd`/.zshrc ~/.zshrc
ln -si `pwd`/.zshenv ~/.zshenv
ln -si `pwd`/clean.sh ~/clean.sh
ln -si `pwd`/.screenrc ~/.screenrc
ln -si `pwd`/.gitconfig ~/.gitconfig

echo "Install Root Config as well..."
sudo ln -si `pwd`/oh-my-zsh /root/.oh-my-zsh
sudo ln -si `pwd`/.zshrc /root/.zshrc
sudo ln -si `pwd`/.zshenv /root/.zshenv
