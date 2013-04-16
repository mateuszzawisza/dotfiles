" toggles between relativenumber and number
function! ToggleRNU()
  if &rnu
    set nu
  else
    set rnu
  endif
endfunction
