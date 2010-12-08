call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

set nu 
syntax on
set hlsearch 
set nobackup
set nowritebackup
set noswapfile

set nocompatible
set bs=2 

set smartindent
set tabstop=2 "set tab character to 4 characters
set expandtab "turn tabs into whitespace
set shiftwidth=2 "indent width for autoindent
filetype indent on "indent depends on filetype

"Shortcut to auto indent entire file
nmap <F12> 1G=G
imap <F12> <ESC>1G=Ga

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Enable indent folding
"set foldenable
"set foldmethod=indent

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Turn on spell checking with English dictionary
nmap <silent> <leader>s :set spell!<CR>
 
" Set region to British English
set spelllang=en_gb
"set spellsuggest=9 "show only 9 suggestions for misspelled words

map <M-t> :tabnew <CR>
map <C-q> :tabclose <CR>
map <C-h> :tabprevious <CR>
map <C-l> :tabnext <CR>

nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>f :CommandT<CR>
map  <leader>r :nohlsearch <CR>
map <leader>R :e!<CR>
map <leader><tab> :ScratchOpen<CR>

nmap Y y$
map gb :bn<CR>
map gB :bp<CR>

set statusline=%#StatusLineNC#\ Git\ %#ErrorMsg#\ %{GitBranchInfoTokens()[0]}\ %#StatusLine#\ %F%m%r%h%w\ %y\ [%l,%v][%p%%]\ [%L] 



filetype on

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

filetype plugin on 


nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <leader>q gqip

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set visualbell
set ttyfast
set backspace=indent,eol,start

" indendation made easier
vmap > >gv
vmap < <gv

nnoremap Q @q

set grepprg=ack
set grepformat=%f:%l:%m


" Command-T configuration
let g:CommandTMaxHeight=20
"
"" Bubble single lines
"nmap <C-k> [e
"nmap <C-j> ]e
"" Bubble multiple lines
"
"vmap <C-k> [egv
"vmap <C-j> ]egv
"command WW w !sudo tee % >/dev/null

" Use modeline overrides
set modeline
set modelines=10


