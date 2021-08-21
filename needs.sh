sudo apt update

echo start installing ripgrep
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install -y ripgrep
echo finish installing ripgrep

echo start installing minimap
wget https://github.com/wfxr/code-minimap/releases/download/v0.6.1/code-minimap-v0.6.1-i686-unknown-linux-musl.tar.gz
tar -xf code-minimap-v0.6.1-i686-unknown-linux-musl.tar.gz
sudo cp code-minimap-v0.6.1-i686-unknown-linux-musl/code-minimap /usr/local/bin
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

