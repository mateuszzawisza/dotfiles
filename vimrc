call plug#begin()
Plug 'rakr/vim-one'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'alexgenco/neovim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'rking/ag.vim'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'hauleth/blame.vim'
Plug 'skielbasa/vim-material-monokai'
Plug 'felipesousa/rupza'
Plug 'ajmwagar/vim-deus'
Plug 'hashivim/vim-terraform'
Plug 'vim-ruby/vim-ruby'
Plug 'lepture/vim-jinja'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-abolish'
Plug 'pedrohdz/vim-yaml-folds'
call plug#end()

set foldlevel=5

set shell=/usr/local/bin/zsh
set background=dark
colorscheme OceanicNext
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:python_host_prog='/usr/local/bin/python3.6'

"load functions
source $HOME/.vim/functions/*.vim

set nu

syntax on
set hlsearch
"set nobackup
"set nowritebackup
"set noswapfile

set nocompatible
set bs=2

set smartindent
set tabstop=2 "set tab character to 2 characters
set expandtab "turn tabs into whitespace
set shiftwidth=2 "indent width for autoindent

syntax sync minlines=256

set list listchars=tab:\ \ ,trail:·

"augroup ft_python
"  autocmd FileType python set ai sw=4 sts=4 et
"augroup END


" line and column highlighting"
hi ColorColumn ctermbg=gray
" set colorcolumn=90
"set synmaxcol=90 " vim gets very slow with long lines and syntax highlighting
"set cursorline
"hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"hi CursorLine cterm=bold
"match ErrorMsg '\%>90v.\+'



"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Hide buffer when not in window (to prevent relogin with FTP edit)
"set bufhidden=hide

"Turn on spell checking with English dictionary
set spelllang=en_gb

"map gb :bn<CR>
"map gB :bp<CR>

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

" aliases
cmap W<CR> :w<CR>
command -nargs=1 Gpg :%w ! gpg -ear <args> | pbcopy
command -nargs=+ Gpgm :%w ! gpg -ea <args> | pbcopy
command -nargs=0 Pbcopy :%w ! reattach-to-user-namespace pbcopy
nnoremap Q @q
" Leader shortcuts
nmap <leader>n :call ToggleRNU()<CR>
nmap <silent> <leader>s :set spell!<CR>
"nmap <leader>t :NERDTreeToggle<CR>
"nmap <leader>t :Vex<CR>
"nmap <leader>T :NERDTree<CR>
nmap <leader>F :Ack<space>
map  <leader>r :nohlsearch <CR>
map <leader>R :e!<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nmap <leader>F :! open %:p:h<CR>

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
map <Leader>tt :GoTest<CR>
map <C-p> :FZF<CR>
map <Leader>b :Buffers<CR>
map <Leader>a :Ags 

" airline configuration
let g:airline_powerline_fonts = 0
let g:airline_enable_branch=2
let g:airline_theme='tomorrow'
" remove fancy chars
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1

" Ctrlp configuration

let g:tmuxline_powerline_separators = 0
"Tmuxline airline
"TmuxlineSnapshot '~/.dotfiles/tmux/theme.conf'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "/Users/mateuszzawisza/.vim/snippets"]
" :TmuxlineSnapshot ~/.dotfiles/tmux/tmuxline.conf
"
nmap <leader>t :TagbarToggle<CR>


"augroup BgHighlight
"  autocmd!
"  autocmd WinEnter * set syntax=on
"  autocmd WinLeave * set syntax=off
"augroup END
"
"
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

let g:jedi#force_py_version = 3

let g:terraform_align=1

command! Buffers call fzf#run(fzf#wrap({'source': map(range(1, bufnr('$')), 'bufname(v:val)')}))

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ags call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '30%'
\ })

command! -nargs=* Agall call fzf#run({
\ 'source':  printf('ag -f --nogroup --color "%s" /Users/mateuszzawisza/workspaces/common',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '30%'
\ })
