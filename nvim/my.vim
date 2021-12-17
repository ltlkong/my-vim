" Others ---
let g:architecture = substitute(system('uname -m'), '\n','','g')

" Default ---
let mapleader = ","
set encoding=UTF-8
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smarttab
set smartindent
set wrap
set lazyredraw
set wildmenu
set splitbelow splitright
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set signcolumn=auto
set cursorline
set mouse=a
set history=100
nnoremap <C-i> <C-i>
au BufNewFile,BufRead *.cshtml set filetype=html

" Line number ---
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" NerdTree ---
nnoremap <silent><C-t> :NERDTreeToggle<CR>:silent NERDTreeMirror<CR>
let g:NERDTreeWinSize=22
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Coc ---
set nobackup
set nowritebackup
set updatetime=500
set shortmess+=c
set pumheight=10
let g:coc_disable_startup_warning=1

let coc_extensions_list = [
	\'coc-git',
	\'coc-marketplace', 
	\'coc-html',
	\'coc-diagnostic',
	\'coc-calc', 
	\'coc-tsserver', 
	\'coc-sql', 
	\'coc-phpls', 
	\'coc-pyright',
	\'coc-css', 
    \'coc-sh',
	\'coc-snippets', 
	\'coc-htmlhint',
	\'coc-docker',
	\'coc-webpack',
	\'coc-prettier',
	\'coc-spell-checker',
	\'coc-java',
    \'coc-webview',
    \'coc-omnisharp',
    \'coc-markdown-preview-enhanced',
	\]

if stridx(architecture, "aarch64") == -1
    let coc_extensions_list += ['coc-tabnine']
endif

let g:coc_global_extensions = coc_extensions_list


" Coc key mappings
nnoremap <silent><nowait> <space>o  :<C-u>CocFzfList outline<cr>
nnoremap <silent><nowait> <space>cc  :<C-u>CocFzfList commands<cr>
nnoremap <silent><nowait> <space>d  :<C-u>CocFzfList diagnostics<cr>

" Allow tab switch between completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Fzf ---
nnoremap <space>r :Rg<CR>
nnoremap <space>f :Files<CR>
nnoremap <space>l :BLines<CR>
nnoremap <space>gs :GFiles?<CR>
nnoremap <space>g :GFiles<CR>
nnoremap <space>m :Maps<CR>
nnoremap <space>c :Commands<CR>
nnoremap <space>t :W<CR>
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%'  --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" Minimap ---
let g:minimap_width=12
let g:minimap_git_colors=1
nnoremap <silent><C-y> :MinimapToggle<CR>

" Tabs ---
nnoremap tt :tabnew<CR>

" Hop ---
lua << END
require'hop'.setup()
END
nnoremap <silent><leader>w :HopWord<CR>

" Theme ---
set background=dark
colorscheme gruvbox

" Terminal ---
command! T split | resize15 | terminal
tnoremap <C-W><C-N> <C-\><C-N>

" Treesitter ---
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
   autotag = {
    enable = true,
  }
}
EOF

" Lualine ---
lua << END
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'seoul256',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 
                  {'diagnostics', sources={'nvim_diagnostics', 'coc'}}},
    lualine_c = {
                'filename'
			},
    lualine_x = {'encoding', 'filesize', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
      lualine_a = {'g:architecture'},
      lualine_b = {'tabs'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'buffers'}
    },

  extensions = {"fzf",'nerdtree','fugitive'}
}
END
