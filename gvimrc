"colorscheme twilight
"colorscheme jellybeans
"colorscheme molokai
"colorscheme mac_classic
"colorscheme darkspectrum
colorscheme solarized


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .gvimrc source $MYGVIMRC
endif

nmap <leader>g :tabedit $MYGVIMRC<CR>
nmap <leader>u :GundoToggle<CR>


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=90
"autocmd BufEnter * match ErrorMsg '\%>90v.\+'

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
set transparency=5

"set guioptions-=T 
"set guioptions-=r 
"set guioptions-=L 
set laststatus=2
set guioptions=aAce


" Command-Shift-F for Ack
macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
map <D-F> :Ack<space>

map <D-/> <plug>NERDCommenterToggle

