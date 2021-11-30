" Others ---
let architecture = system('uname -m')

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
nnoremap <silent><C-t> :NERDTreeToggle<CR> :NERDTreeMirror<CR>
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_disable_startup_warning=1

let coc_extensions_list = [
	\'coc-git',
	\'coc-grammarly', 
	\'coc-marketplace', 
	\'coc-html',
	\'coc-diagnostic',
	\'coc-calc', 
	\'coc-tsserver', 
	\'coc-sql', 
	\'coc-phpls', 
	\'coc-pyright',
	\'coc-css', 
	\'coc-omnisharp', 
	\'coc-snippets', 
	\'coc-htmlhint',
	\'coc-docker',
	\'coc-webpack',
	\'coc-prettier',
	\'coc-spell-checker',
	\'coc-java',
    \'coc-webview',
    \'coc-markdown-preview-enhanced'
	\]

if stridx(architecture, "aarch64") == -1
    let coc_extensions_list += ['coc-tabnine']
endif

let g:coc_global_extensions = coc_extensions_list

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" Airline ---
let g:airline_theme="base16"
let airline#extensions#tabline#enabled=1
let g:airlin_highlighting_cache=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 1

" Minimap ---
let g:minimap_width=12
let g:minimap_git_colors=1
nnoremap <silent><C-y> :MinimapToggle<CR>

" Tabs ---
nnoremap tt :tabnew<CR>

" Easymotion ---
map  <Leader>w <Plug>(easymotion-bd-w)

" Theme ---
set background=dark
colorscheme gruvbox
