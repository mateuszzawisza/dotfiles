call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-vinegar'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'alexgenco/neovim-ruby'
Plug 'tpope/vim-fugitive'
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
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'google/vim-jsonnet'
Plug 'vimoutliner/vimoutliner'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set foldlevel=5

colorscheme OceanicNext
set shell=/usr/local/bin/zsh
set background=dark
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:python_host_prog='/usr/local/bin/python3.7'

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
map <C-p> :Files<CR>
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

"let g:UltiSnipsSnippetDirectories=["UltiSnips", "/Users/mateuszzawisza/.vim/snippets"]
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

""""  command! -nargs=* Ags call fzf#run({
""""  \ 'source':  printf('ag --nogroup --column --color "%s"',
""""  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
""""  \ 'sink*':    function('<sid>ag_handler'),
""""  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
""""  \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
""""  \            '--color hl:68,hl+:110',
""""  \ 'down':    '30%'
""""  \ })
""""  
""""  command! -nargs=* Agall call fzf#run({
""""  \ 'source':  printf('ag -f --nogroup --color "%s" /Users/mateuszzawisza/workspaces/common',
""""  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
""""  \ 'sink*':    function('<sid>ag_handler'),
""""  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
""""  \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
""""  \            '--color hl:68,hl+:110',
""""  \ 'down':    '30%'
""""  \ })





" CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>



" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-t> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"nnoremap <leader>d :put =strftime(\"%b %d, %Y\")<cr>

lua require('barbar')



" ----- Coc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
highlight StatuslineFilename ctermfg=Black ctermbg=DarkGreen
highlight StatuslineModified ctermfg=DarkMagenta ctermbg=LightGreen
highlight StatuslineNumbers ctermfg=Black ctermbg=DarkYellow

"set statusline=%#StatuslineFilename#   " Set color for file path
"set statusline+=%F                     " Full file path, at most 40 characters
"set statusline+=\                      " A space
"set statusline+=%#StatuslineModified#  " Set color for modified flag
"set statusline+=%m                     " Modified flag
"set statusline+=%#StatuslineFilename#  " Set color for the rest of the bar
"set statusline+=%=                     " Split the left and right sides
"set statusline+=%#StatuslineNumbers#   " Set color for line numbers
"set statusline+=%l,                    " Line number
"set statusline+=\                      " A space
"set statusline+=%-3c                    " Column number
"set statusline+=\ \|\                  " A separator
"set statusline+=%L                     " Total number of lines

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


let g:coc_global_extensions = ['coc-solargraph']

let g:jsonnet_fmt_on_save = 0

