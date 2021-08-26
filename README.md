# My vim's configurations for Linux (Mac os) system

Supported Debian Linux (aarch64, armv7l, x86_64) and Mac os (darwin)

## Installation

- For Linux users, run./install.sh, it will install all the required dependencies for the vim an vimrc file.
- For Mac users, run ./install-darwin.sh.(still in testing)

## Plugs
- NerdTree | &ltC-t&gt
- minimap | &ltC-y&gt
- fugitive (https://github.com/tpope/vim-fugitive.git')
- coc.nvim (autocompletion):
	- Show coc commands | &ltspace&gtcc
	- Show outline of codes | &ltspace&gto
	- Show diagnostic | &ltspace&gtd
- fzf (fuzzy search):
	- Search word recursively from the current directory | &ltspace&gtr
	- Search file from the current directory | &ltspace&gtr
	- Search line from the current buffer | &ltspace&gtl
	- Search word from the git status | &ltspace&gtgs
	- Search word from the git files | &ltspace&gtg
	- Search key mapping | &ltspace&gtm
	- Search commands | &ltspace&gtc
- airline (vim status line and better tab)
- indent line (show indent lines)
- css-color (show color in css files)
- closetag (closetag in html)

## Additional key mappings
- New tab | nt
