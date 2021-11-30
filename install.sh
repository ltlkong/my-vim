#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'

echo -e ${RED}'neovim or vim?(nvim/vim)'${NC} 

# Let user decides which vim to install
read version

if [ $(uname) == 'Darwin' ]
then
    # Mac

    # Install brew if brew command not found
    if ! command -v brew &> /dev/null
    then
        echo -e  ${RED}start installing brew${NC}
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tielinli/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo -e ${RED}finish${NC}
    fi

    brew update

    # Install vim
    if [[ $version == 'vim' ]];
    then
        if ! command -v vim &> /dev/null
        then
            echo -e  ${RED}start installing vim${NC}
            brew install vim
            echo -e ${RED}finish${NC}
        fi
    elif [[ $version == 'nvim' ]];
    then
        if ! command -v nvim &> /dev/null
        then
            echo -e  ${RED}start installing neovim${NC}
            pip3 install --upgrade pynvim
            brew install neovim
            echo -e ${RED}finish${NC}
        fi
    fi

    # Commands are needed for plugins
    echo -e  ${RED}start installing dependencies ${NC}
    brew install ripgrep code-minimap node bat curl
    echo -e ${RED}finish${NC}

else
    # Debian

    sudo apt update

    # Install and compile the newest vim
    if [[ $version == 'vim' ]];
    then
        if ! command -v vim &> /dev/null
        then
            echo -e  ${BLUE}start installing vim${NC}
            sudo apt install -y vim
            echo -e ${BLUE}finish${NC}
        fi
    elif [[ $version == 'nvim' ]];
    then
        if ! command -v nvim &> /dev/null
        then
            echo -e  ${BLUE}start installing neovim${NC}
            sudo apt install -y neovim
            echo -e ${BLUE}finish${NC}
        fi
    fi

    # Install other dependencies
    # Install node
    echo -e  ${BLUE}start installing dependencies${NC}

    sudo apt remove -y nodejs

    NODEVERSION='16.13.0'

    NODEAMD64="node-v$NODEVERSION-linux-x64"
    NODEAARCH64="node-v$NODEVERSION-linux-arm64"
    NODEARMV7="node-v$NODEVERSION-linux-armv7l"

    installNode() {
        local nodeBaseUrl="https://nodejs.org/dist/v$NODEVERSION/"

        wget $nodeBaseUrl$1.tar.gz
        tar -xf ./$1.tar.gz
        sudo cp -r ./$1/* /usr/local
        sudo rm -r $1*
        node -v
    }

    case $(uname -m) in
        'aarch64') installNode $NODEAARCH64
            ;;
        'armv7l') installNode $NODEARMV7
            ;;
        *) installNode $NODEAMD64
            ;;
    esac

    sudo apt install -y ripgrep

    #install minimap for minimap plugin
    MINIMAPAMD64='code-minimap-v0.6.1-i686-unknown-linux-musl'
    MINIMAPAARCH64='code-minimap-v0.6.1-aarch64-unknown-linux-gnu'
    MINIMAPARMV7='code-minimap-v0.6.1-arm-unknown-linux-gnueabihf'

    installMiniMap() {
        local minimapBaseUrl='https://github.com/wfxr/code-minimap/releases/download/v0.6.1/'

        wget $minimapBaseUrl$1.tar.gz
        tar -xf $1.tar.gz
        sudo cp ./$1/code-minimap /usr/local/bin
        sudo rm -r $1**
    }

    case $(uname -m) in
        'aarch64') installMiniMap $MINIMAPAARCH64
            ;;
        'armv7l') installMiniMap $MINIMAPARMV7
            ;;
        *) installMiniMap $MINIMAPAMD64
            ;;
    esac

    #install bat
    sudo apt install bat -y
    echo -e ${BLUE}finish${NC}
fi

#install vim-plug
echo -e ${BLUE}start installing vim-plug${NC}
if [[ $version == 'vim' ]];
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
elif [[ $version == 'nvim' ]];
then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
echo -e ${BLUE}finish${NC}

# Set up vimrc

if [[ $version == 'vim' ]];
then
    cd ./vim/
    source ./setup.sh
elif [[ $version == 'nvim' ]];
then
    cd ./nvim/
    source ./setup.sh
fi

echo -e ${BLUE}success${NC}

