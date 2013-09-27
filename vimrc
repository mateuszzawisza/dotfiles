" Vundle configuration
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source $HOME/.vim/Vundlefile

set shell=/usr/local/bin/zsh

set background=dark
"colorscheme Monokai
"colorscheme molokai
"colorscheme mustang
colorscheme solarized

"load functions
source $HOME/.vim/functions/*.vim

set nu

syntax on
set hlsearch
set nobackup
set nowritebackup
set noswapfile

set nocompatible
set bs=2

set smartindent
set tabstop=2 "set tab character to 2 characters
set expandtab "turn tabs into whitespace
set shiftwidth=2 "indent width for autoindent
set list listchars=tab:\ \ ,trail:·

" line and column highlighting"
hi ColorColumn ctermbg=gray
set colorcolumn=90
set synmaxcol=90 " vim gets very slow with long lines and syntax highlighting
set cursorline
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"hi CursorLine cterm=bold


"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Hide buffer when not in window (to prevent relogin with FTP edit)
"set bufhidden=hide

"Turn on spell checking with English dictionary
set spelllang=en_gb

map gb :bn<CR>
map gB :bp<CR>

set laststatus=2

filetype on
filetype plugin on
filetype indent on "indent depends on filetype

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmode=longest,list,full
set wildmenu
set visualbell
set ttyfast
set backspace=indent,eol,start

" indendation made easier
vmap > >gv
vmap < <gv


set grepprg=ack
set grepformat=%f:%l:%m


"Set line numbering to take up 5 spaces
set numberwidth=5
"set gfn=Menlo:h12

au FileType ruby setlocal comments-=:# comments+=f:#

" Give vagrantfile Ruby syntax highlighting etc..
au BufNewFile,BufRead [vV]agrantfile setf ruby
au BufNewFile,BufRead Puppetfile setf ruby
au BufNewFile,BufRead [vV]undlefile setf vim
au BufNewFile,BufRead *.mustache setf html

set ttymouse=xterm2
set mouse=n

" aliases
cmap W<CR> :w<CR>
nnoremap Q @q
" Leader shortcuts
nmap <leader>n :call ToggleRNU()<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>T :NERDTree<CR>
nmap <leader>F :Ack<space>
map  <leader>r :nohlsearch <CR>
map <leader>R :e!<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nmap <leader>g :g/<c-r>=expand("<cword>")<CR><CR>
nmap <leader>G :g/<c-r>=expand("<cword>")<CR>
nmap <leader>a :Ag <c-r>=expand("<cword>")<CR> <C-R>%<CR>
nmap <leader>A :Ag <c-r>=expand("<cword>")<CR>
nmap <leader>l :TlistToggle<CR>
map <Leader>q :q<CR>
map <Leader>a :wa<CR>
map <Leader>w :w<CR>
map <Leader>I gg=G<c-o><c-o>

nmap <leader>ds :sp %:p:h<CR>
nmap <leader>dv :vsp %:p:h<CR>

map <Leader>m :Matchmaker<CR>
map <Leader>M :Matchmaker!<CR>

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_enable_branch=2
"let g:airline_theme='dark'
let g:airline_theme='solarized'
" remove fancy chars
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1

" Ctrlp configuration
let g:ctrlp_working_path_mode = 'w'
