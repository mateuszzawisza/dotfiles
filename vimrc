" Vundle configuration
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" setup Vundlefile
source $HOME/.vim/Vundlefile

"set t_Co=256
"colorscheme solarized
colorscheme molokai
"if !has("gui_running")
"  set bg=light
"  set bg=dark
"endif 
"colorscheme ir_black_mod

"load functions
source $HOME/.vim/functions/*.vim

set nu
map <tab><tab> :call ToggleRNU()<CR>
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
"set list listchars=tab:\ \ ,trail:·

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
nmap <leader>T :NERDTree<CR>
"nmap <leader>f :CommandT<CR>
nnoremap <leader>f :FufFile**/<CR>
  
nmap <leader>F :Ack<space>
map  <leader>r :nohlsearch <CR>
map <leader>R :e!<CR>
map <leader><tab> :ScratchOpen<CR>


nmap Y y$
map gb :bn<CR>
map gB :bp<CR>

set statusline=%#StatusLineNC#\ Git\ %#ErrorMsg#\ %{GitBranchInfoTokens()[0]}\ %#StatusLine#\ %F%m%r%h%w\ %y\ [%l,%v][%p%%]\ [%L] 

" adds RVM info in status line
set statusline+=%{rvm#statusline()}





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




if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
endif

nmap <leader>s :SessionList<CR>


inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


"Set line numbering to take up 5 spaces
set numberwidth=5
set cursorline
"set gfn=Monaco:h11
set gfn=Menlo:h12
set nu
"set relativenumber
"autocmd BufEnter * set relativenumber

" moving up/down in wrapped lines
nmap <C-j> gj
nmap <C-k> gk



"FuzzyFinder config
"
  let g:fuf_modesDisable = []
  let g:fuf_mrufile_maxItem = 400
  let g:fuf_mrucmd_maxItem = 400
  nnoremap <silent> sj     :FufBuffer<CR>
  nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
  nnoremap <silent> sK     :FufFileWithFullCwd<CR>
  nnoremap <silent> s<C-k> :FufFile<CR>
  nnoremap <silent> sL     :FufCoverageFileChange<CR>
  nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
  nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
  nnoremap <silent> sD     :FufDirWithFullCwd<CR>
  nnoremap <silent> s<C-d> :FufDir<CR>
  nnoremap <silent> sn     :FufMruFile<CR>
  nnoremap <silent> sN     :FufMruFileInCwd<CR>
  nnoremap <silent> sm     :FufMruCmd<CR>
  nnoremap <silent> su     :FufBookmarkFile<CR>
  nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
  vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
  nnoremap <silent> si     :FufBookmarkDir<CR>
  nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
  nnoremap <silent> st     :FufTag<CR>
  nnoremap <silent> sT     :FufTag!<CR>
  nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
  nnoremap <silent> s,     :FufBufferTag<CR>
  nnoremap <silent> s<     :FufBufferTag!<CR>
  vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
  vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
  nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
  nnoremap <silent> s.     :FufBufferTagAll<CR>
  nnoremap <silent> s>     :FufBufferTagAll!<CR>
  vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
  vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
  nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
  nnoremap <silent> sg     :FufTaggedFile<CR>
  nnoremap <silent> sG     :FufTaggedFile!<CR>
  nnoremap <silent> so     :FufJumpList<CR>
  nnoremap <silent> sp     :FufChangeList<CR>
  nnoremap <silent> sq     :FufQuickfix<CR>
  nnoremap <silent> sy     :FufLine<CR>
  nnoremap <silent> sh     :FufHelp<CR>
  nnoremap <silent> se     :FufEditDataFile<CR>
  nnoremap <silent> sr     :FufRenewCache<CR>

au FileType ruby setlocal comments-=:# comments+=f:#

" Give vagrantfile Ruby syntax highlighting etc..
au BufNewFile,BufRead [vV]agrantfile setf ruby
au BufNewFile,BufRead [vV]undlefile setf vim
