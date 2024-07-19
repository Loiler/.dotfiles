set path+=**
set nocompatible
set guicursor=
set nohlsearch
set ignorecase
set incsearch
set hidden
set nu
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
set number
set relativenumber
set nobackup
set termguicolors
set cursorline
set spelllang=en,de
set noerrorbells
"set nowrap
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set isfname+=@-@
set cmdheight=2
set updatetime=300
set colorcolumn=80
set shortmess+=c
set mouse=

syntax on
filetype indent on

noremap <Space> <Nop>
let mapleader = " "

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Make Y behave like other capital letters
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move line(s) up and down
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" use <esc> to exit insert mode in terminal
tnoremap <leader><esc> <c-\><c-n>

" Cycle through buffers
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>

" Remove whitespace
nnoremap <leader>rmw :%s/\s\+$//<CR>

" Switch between tabs
nnoremap <Right> gt
nnoremap <Left>  gT

" Easier Moving between splits
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Make windows to be basically the same size
nnoremap <leader>= <C-w>=

" Sizing window horizontally
nnoremap <A-[> <C-w>+
nnoremap <A-{> <C-w>5+
nnoremap <A-]> <C-w>-
nnoremap <A-}> <C-w>5-
nnoremap <A-o> <C-w><
nnoremap <A-O> <C-w>5<
nnoremap <A-p> <C-w>>
nnoremap <A-P> <C-w>5>

" Move easily to the next error
nnoremap <leader>l :lnext<CR>
nnoremap <leader>h :lprevious<CR>

" git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"nnoremap <C-d> <C-d>zz
"nnoremap <C-s> <C-u>zz
nnoremap <C-s> :w<CR>
nnoremap <C-a> :wa<CR>
nnoremap <C-q> :q<CR>

nmap <leader><leader>s :source ~/.config/nvim/init.vim<CR>

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'frankaemika/ride-vim'
Plug 'williamboman/mason.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-neotest/nvim-nio'

" autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'stevearc/oil.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'mhartington/formatter.nvim'

" typescriptreact syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" markdown and plantuml
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'NvChad/nvim-colorizer.lua'

"Plug 'm4xshen/hardtime.nvim'
"Plug 'tris203/precognition.nvim'

call plug#end()

set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

" Markdown Preview
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': { 'server': 'http://localhost:8081'},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
