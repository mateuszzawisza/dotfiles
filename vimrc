" Vundle configuration
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" setup Vundlefile
source $HOME/.vim/Vundlefile

set shell=/usr/local/bin/zsh

set background=dark
colorscheme mustang

"load functions
source $HOME/.vim/functions/*.vim

set nu

nnoremap <Space> <Nop>

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
"autocmd BufEnter * match ErrorMsg '\%>90v.\+'
hi ColorColumn ctermbg=darkgrey
set colorcolumn=90

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

" Set region to British English
set spelllang=en_gb
"set spellsuggest=9 "show only 9 suggestions for misspelled words

map <M-t> :tabnew <CR>
map <C-q> :tabclose <CR>
"map <C-h> :tabprevious <CR>
"map <C-l> :tabnext <CR>




nmap Y y$
map gb :bn<CR>
map gB :bp<CR>

"set statusline=%#StatusLineNC#\ Git\ %#ErrorMsg#\ %{GitBranchInfoTokens()[0]}\ %#StatusLine#\ %F%m%r%h%w\ %y\ [%l,%v][%p%%]\ [%L] 
"let g:smartusline_string_to_highlight = '(%n) %f '
"let g:Powerline_colorscheme = 'skwp'
let g:Powerline_symbols = 'fancy'

set laststatus=2


filetype on

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


filetype plugin on 



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
"set modeline
"set modelines=10





"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" 
"function! s:align()
"  let p = '^\s*|\s.*\s|\s*$'
"  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"    Tabularize/|/l1
"    normal! 0
"    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"  endif
"endfunction


"Set line numbering to take up 5 spaces
set numberwidth=5
"set cursorline
"set gfn=Monaco:h11
set gfn=Menlo:h12
set nu
"set relativenumber
"autocmd BufEnter * set relativenumber

" moving up/down in wrapped lines
nmap <C-j> gj
nmap <C-k> gk



au FileType ruby setlocal comments-=:# comments+=f:#

" Give vagrantfile Ruby syntax highlighting etc..
au BufNewFile,BufRead [vV]agrantfile setf ruby
au BufNewFile,BufRead [vV]undlefile setf vim
au BufNewFile,BufRead *.mustache setf html


cmap W<CR> :w<CR>
" vimux
"Prompt for a command to run

" Run last command executed by RunVimTmuxCommand

" Inspect runner pane

" Close all other tmux panes in current window

" Interrupt any command running in the runner pane


set ttymouse=xterm2
set mouse=n

" Leader shortcuts
"let mapleader = "\<Space>"
nmap <leader>n :call ToggleRNU()<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>T :NERDTree<CR>
"nmap <leader>f :CommandT<CR>
nnoremap <leader>f :CommandT<CR>
nnoremap <leader>bb :CommandTBuffer<CR>
nmap <leader>F :Ack<space>
map  <leader>r :nohlsearch <CR>
map <leader>R :e!<CR>
"map <leader><tab> :ScratchOpen<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <leader>q gqip
map <leader>rp :PromptVimTmuxCommand<CR>
map <leader>rl :RunLastVimTmuxCommand<CR>
map <leader>ri :InspectVimTmuxRunner<CR>
map <leader>rx :CloseVimTmuxPanes<CR>
map <leader>rs :InterruptVimTmuxRunner<CR>
nmap <leader>g :g/<c-r>=expand("<cword>")<CR><CR>
nmap <leader>G :g/<c-r>=expand("<cword>")<CR>
nmap <leader>a :Ack <c-r>=expand("<cword>")<CR> <C-R>%<CR>
nmap <leader>A :Ack <c-r>=expand("<cword>")<CR>
nmap <leader>l :TlistToggle<CR>
nmap <leader>N :tabnew 
map <Leader>q :q<CR>
map <Leader>a :wa<CR>
map <Leader>w :w<CR>
"map <Leader>C :ChefFindAny<CR>
map <Leader>I gg=G<c-o><c-o>
nmap <leader>d :Dispatch zsh -ic ''<Left>



"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


nmap <leader>ds :sp %:p:h<CR>
nmap <leader>dv :vsp %:p:h<CR>


"set shell=/usr/local/bin/zsh
"set shell=/bin/bash
"set shellcmdflag=-ic
