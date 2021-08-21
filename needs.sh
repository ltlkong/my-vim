sudo apt update

BuildC = $(uname -m)

echo start installing ripgrep
sudo apt install -y ripgrep
echo finish installing ripgrep

echo start installing minimap
MINIMAPLINKAMD64='https://github.com/wfxr/code-minimap/releases/download/v0.6.1/code-minimap-v0.6.1-i686-unknown-linux-musl.tar.gz'
MINIMAPLINKAARCH64='https://github.com/wfxr/code-minimap/releases/download/v0.6.1/code-minimap-v0.6.1-aarch64-unknown-linux-gnu.tar.gz'

if [ $BuildC = 'aarch64' ]
then 
	wget $MINIMAPLINKAARCH64 -o code-minimap.tar.gz
else 
	wget $MINIMAPLINKAMD64 -o code-minimap.tar.gz
fi

tar -xf minimap.tar.gz 
sudo cp minimap/code-minimap /usr/local/bin
sudo rm -r code-minimap* 
echo finish installing minimp

echo start setting up vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat my.vim > ~/.vimrc
vim +silent +PlugInstall +CocInstall +qa
echo finish setting up vimrc

echo start setting coc-setting
sudo cp ./coc-settings.json ~/.vim/
echo end setting coc-setting

echo success

