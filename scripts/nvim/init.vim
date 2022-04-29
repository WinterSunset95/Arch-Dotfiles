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
set wildmode=longest,list
set cc=80
set ttyfast
set clipboard=unnamedplus
set splitbelow
filetype plugin on
set termguicolors

call plug#begin()
Plug 'dracula/vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()
Plug 'dracula/vim', { 'as': 'dracula' }
colorscheme dracula

let g:user_emmet_leader_key = ','
let g:mapleader = ','

inoremap ii <esc>
inoremap <C-w> <esc><C-w>w
inoremap <S-T>T <esc>:Telescope find_files<CR>
inoremap <C-N> <esc>:bn<CR>
inoremap <C-P> <esc>:bp<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <S-T>T :Telescope find_files<CR>
nnoremap <C-w> <C-w>w
tnoremap <esc> <c-\><c-n>

au VimEnter * :NERDTree
au VimEnter * :vertical resize 15
au VimEnter * :set winfixwidth
au VimEnter * :tabnew +term
au VimEnter * :tabn | wincmd p
