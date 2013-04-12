" auto load all plugins in vim bundle
execute pathogen#infect()

" general
filetype plugin indent on    " enable filetype-specific plugins
set nocompatible	     " not compatible with the old-fashion vi mode
set history=50               " keep 50 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
set expandtab                " use space instead of tab
set tabstop=2                " insert 2 spaces for a tab
set shiftwidth=2             " the number of space characters inserted for indentation
syntax on                    " enable syntax highlighting
colors Tomorrow-Night-Bright " vim color scheme
set autoread                 " auto read when file is changed from outside
set history=50		     " keep 50 lines of command line history
set mouse=a                  " mouse support
if has("gui_running")        " GUI color and font settings
  set guifont=Monaco:h14
  set t_Co=256               " 256 color mode
  set cursorline             " highlight current line
end
set clipboard=unnamed	     " yank to the system register (*) by default
set showmatch                " Cursor shows matching ) and }
set showmode		     " Show current mode

" disable sound on errors
set noeb vb t_vb=

" Hide toolbar and scrollbars in MacVim
set guioptions-=T
set guioptions-=L
set guioptions-=r

" to move effeciently between splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" open sidebar with cmd+k
map <D-k> :NERDTreeToggle<CR>

" encoding settings
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8

" comment lines with cmd+/
map <D-/> :TComment<cr>
vmap <D-/> :TComment<cr>gv

" status line {
set laststatus=2

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

" --- tagbar
nmap <D-\> :TagbarToggle<CR>

" --- ctrlp
let g:ctrlp_show_hidden = 1
