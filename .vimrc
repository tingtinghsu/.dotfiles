" auto load all plugins in vim bundle
execute pathogen#infect()

filetype plugin indent on    " enable filetype-specific plugins
set history=50               " keep 50 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
syntax on                    " enable syntax highlighting
colors Tomorrow-Night-Bright " vim color scheme
set autoread                 " auto read when file is changed from outside

set guifont=Monaco:h14
set t_Co=256
set cursorline
