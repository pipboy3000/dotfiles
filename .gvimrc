colorscheme wombat256

set guioptions-=T
set ambiwidth=double

" mouse
" ---------------
set mouse=a
set nomousefocus
set mousehide

" set noantialias
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
  set gfw=Osaka-Mono:h11
  set gfn=Monaco:h11

  " Opcaity
  set transparency=5

  " Fullscreen
  " set fuoptions=maxvert,maxhorz
  " au GUIEnter * set fullscreen

  let macvim_skip_cmd_opt_movement = 1
  let macvim_hig_shift_movement = 1
endif
