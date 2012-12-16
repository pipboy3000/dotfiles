colorscheme wombat256

set guioptions-=T
set ambiwidth=double

" mouse
" ---------------
set mouse=a
set nomousefocus
set mousehide

" set termencoding=japan
" set imdisable
if has("win32")
  " Font
  set gfn=BDF_M+:h9:cANSI
  if has("kaoriya")
    set ambiwidth=auto
  endif
elseif has("gui_macvim")
  " Font
  set gfw=Ricty:h12
  set gfn=Ricty:h14

  set imdisable
  set transparency=10

  let macvim_skip_cmd_opt_movement = 1
  let macvim_hig_shift_movement = 1
endif
