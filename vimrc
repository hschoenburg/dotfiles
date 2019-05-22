set nocompatible                " choose no compatibility with legacy vi
filetype off                   " required!


" Set <leader> key to ,
let mapleader = ','

nmap <leader>f :Ack 
nmap <leader>s :Files
nmap <leader>af :ALEFix

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'
Plug 'benmills/vimux'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': 'GoUpdateBinaries'}

nmap <leader>t :CtrlP<CR>
" Sane Ignore For ctrlp
"
let g:ctrlp_max_files=32768

nmap <leader>n :NERDTreeToggle<CR>

call plug#end()

" Ale config
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \   'go': ['gofmt'],
      \   'javascript': ['standard'],
      \   'jsx': ['standard'],
      \   'typescript.tsx': ['tslint'],
      \   '.ts': ['tslint'],
      \   'typescript': ['tslint'],
      \   'tsx': ['prettier'],
      \   'css': ['prettier'],
      \   'html': ['prettier'],
      \   'scss': ['prettier'],
      \   'sass': ['prettier'],
      \   'markdown': ['prettier'],
      \   '.md': ['prettier'],
      \}

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linters = {
      \   'go': ['gofmt'],
      \   'javascript': ['standard'],
      \   'json': ['jsonlint'],
      \   'jsx': ['standard'],
      \   'typescript': ['tsserver'],
      \   'tsx': ['tsserver'],
      \   'css': ['stylelint'],
      \   'html': ['stylelint'],
      \   'scss': ['stylelint'],
      \   'sass': ['stylelint'],
      \   'markdown': ['prettier'],
      \   '.md': ['prettier'],
      \ }

let g:go_def_mode='godef'

" All of your Plugins must be added before the following line

filetype plugin indent on

" http://slinky.imukuppi.org/zenburnpage/
let g:zenburn_high_Contrast = 1
colors zenburn

"" Show Invisibles
" nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

set autoread 

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

set visualbell t_vb=                    " Silence bells
set nostartofline                       " When paging, don't go to the start of the line
set laststatus=2                        " show status line all the time
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file
set scrolloff=5                         " don't scroll any closer to top/bottom
set backspace=2                         " Set for maximum backspace smartness
set nu

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smarttab                    " fix <BS> key
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
"set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Dealing with unsaved buffers
set hidden                      " Allow unsaved buffers
set confirm                     " Confirm all unsaved buffers on exit

" Key bindings from Ian

" Shortcut to rapidly toggle `set list`

nmap <leader>z :ZoomWin<CR>
nmap \\ :ZoomWin<CR>

map zz :ZoomWin<CR>

nmap <tab><tab> :tabnext<CR>
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <Tab>p :tabprevious<CR>
nmap <Tab>h :tabprevious<CR>
nmap <Tab>l :tabnext<CR>
nmap <Tab><Space> :tabnext<CR>
nmap <C-space> :tabnext<CR>

nmap <Tab><Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <Tab><Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

map <C-h> <C-w>h
map <C-l> <C-w>l

map vv :vsplit<CR>
map ss :split<CR>

" Key bindings from Carl
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %
nmap <silent> <leader>. :bnext<CR>             " Next buffer
nmap <silent> <leader>m :bprev<CR>             " Previous buffer


