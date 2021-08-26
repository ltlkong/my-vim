# My vim's configurations for Linux (Mac os) system

Supported Debian Linux (aarch64, armv7l, x86_64) and Mac os (darwin)

## Installation

- For Linux users, run./install.sh, it will install all the required dependencies for the vim an vimrc file.
- For Mac users, run ./install-darwin.sh.(still in testing)

## Plugs
- NerdTree | <C-t>
- minimap | <C-y>
- fugitive (https://github.com/tpope/vim-fugitive.git')
- coc.nvim (autocompletion):
	- Show coc commands | <space>cc
	- Show outline of codes | <space>o
	- Show diagnostic | <space>d
- fzf (fuzzy search):
	- Search word recursively from the current directory | <space>r
	- Search file from the current directory | <space>r
	- Search line from the current buffer | <space>l
	- Search word from the git status | <space>gs
	- Search word from the git files | <space>g
	- Search key mapping | <space>m
	- Search commands | <space>c
- airline (vim status line and better tab)
- indent line (show indent lines)
- css-color (show color in css files)
- closetag (closetag in html)

## Additional key mappings
- New tab | nt
