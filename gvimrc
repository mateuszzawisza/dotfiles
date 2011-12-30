set bg=dark
"colorscheme twilight
"colorscheme jellybeans
"colorscheme molokai
"colorscheme mac_classic
"colorscheme darkspectrum
"colorscheme solarized


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .gvimrc source $MYGVIMRC
endif

nmap <leader>g :tabedit $MYGVIMRC<CR>
nmap <leader>u :GundoToggle<CR>


set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=90
set list listchars=tab:\▸\ ,trail:·
autocmd BufEnter * match ErrorMsg '\%>90v.\+'

"set list
"set listchars=tab:▸\ ,eol:¬


"Set line numbering to take up 5 spaces
set numberwidth=5
set cursorline
"set gfn=Monaco:h12
set gfn=Menlo:h12
set relativenumber
autocmd BufEnter * set relativenumber

set undofile
"set transparency=5

"set guioptions-=T 
"set guioptions-=r 
"set guioptions-=L 
set laststatus=2
set guioptions=aAce


" Command-Shift-F for Ack
macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
map <D-F> :Ack<space>
macmenu Edit.Find.Find\.\.\. key=<nop>
map <D-f> /

" Command-T for CommandT
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>

macmenu &File.New\ Tab key=<nop>
macmenu &File.Open\ Tab\.\.\. key=<nop>
map <D-T> :NERDTreeToggle<CR>

map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i


" run tests
"map <leader>S :ConqueTermSplit rspec spec<CR>
"

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt
