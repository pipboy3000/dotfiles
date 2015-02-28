set guioptions-=T
set guioptions-=m
set ambiwidth=double

" mouse
" ---------------
set mouse=a
set nomousefocus
set mousehide

if has("win32")
  " Font
  set gfn=BDF_M+:h9:cANSI
  if has("kaoriya")
    set ambiwidth=auto
  endif
elseif has("gui_macvim")
  " Font
  set gfw=Ricty\ Discord:h16
  set gfn=Ricty\ Discord:h16

  set imdisable
  " set transparency=10

  let macvim_skip_cmd_opt_movement = 1
  let macvim_hig_shift_movement = 1
endif
