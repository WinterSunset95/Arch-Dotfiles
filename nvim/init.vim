set number
set relativenumber
set nowrap
set cursorcolumn
set cursorline
set mouse=a
set autoindent
set laststatus=2
set scrolloff=5
set sidescrolloff=10
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set wildmenu
set wildmode=list:longest
set clipboard=unnamedplus
set splitbelow
filetype plugin on
set termguicolors

call plug#begin()
Plug 'dracula/vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
Plug 'dracula/vim', { 'as': 'dracula' }

let g:mapleader = ','
let g:user_emmet_leader_key = ','
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

tnoremap <esc> <c-\><c-n>

au VimEnter * :Vexplore
au VimEnter * :vertical resize 15
au VimEnter * :set winfixwidth
au VimEnter * :tabnew +term
au VimEnter * :tabn
