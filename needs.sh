sudo apt update
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt install -y ripgrep
wget https://github.com/wfxr/code-minimap/releases/download/v0.6.1/code-minimap-v0.6.1-i686-unknown-linux-musl.tar.gz
tar -xf code-minimap-v0.6.1-i686-unknown-linux-musl.tar.gz
cd code-minimap-v0.6.1-i686-unknown-linux-musl
sudo cp code-minimap /usr/local/bin
cd ..
sudo rm -r code-minimap* 
echo success

