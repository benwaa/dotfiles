ABSPATH=$(cd "$(dirname "$0")"; pwd)

git pull && git submodule init && git submodule update && git submodule status

#add any file you wanna symlink here
files=( .zshrc .zshenv .screenrc .gitconfig)

for var in "${files[@]}"
do
  # create symlink in the home dir
  ln -vsf "$ABSPATH/${var}" "$HOME/${var}"
done


ln -vsf "$ABSPATH/oh-my-zsh" ~/.oh-my-zsh
ln -vsf "$ABSPATH/ben.zsh-theme" ~/.oh-my-zsh/themes/ben.zsh-theme
