" ==============================================================================
" vimrc
" ==============================================================================

" Vundle
" ------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-smartinput'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lambdalisue/vim-gista'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/jscomplete-vim'
Plugin 'mxw/vim-jsx'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'nicklasos/vim-jsx-riot'
Plugin 'open-browser.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rhysd/vim-textobj-ruby'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'slim-template/vim-slim'
Plugin 'terryma/vim-expand-region'
Plugin 'thinca/vim-qfreplace'
Plugin 'thinca/vim-quickrun.git'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-jp/vimdoc-ja'
Plugin 'vim-scripts/AnsiEsc.vim'
" Plugin 'todesking/ruby_hl_lvar.vim'

call vundle#end()

" config
" ------------------------------------------------------------------------------
syntax on
filetype plugin indent on

colorscheme hybrid

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2 
set shiftround

set backspace=indent,eol,start
set hidden
set laststatus=2
set display=lastline

set showmode
set showcmd

set incsearch
set hlsearch
set ignorecase
set showmatch
set smartcase

set ttyfast
set lazyredraw

set splitbelow
set splitright

set cursorline
set wrapscan
set report =0
set synmaxcol =200

set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set clipboard=unnamed
set wildmode=longest,list:longest
set number
set visualbell t_vb=

set iminsert=0
set imsearch=0

set statusline=%f\ %m%r%h%w
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}][%{&fileformat}]
set statusline+=%{fugitive#statusline()}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=%=
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 
set statusline+=\ %(%c:%l/%L%)\ %P

set backup
set backupdir =$HOME/.vim/files/backup/
set backupext =-vimbackup
set backupskip = 
set directory =$HOME/.vim/files/swap//
set updatecount =100
set viminfo ='100,n$HOME/.vim/files/info/viminfo

if has('persistent_undo')
  set undodir=$HOME/.vim/files/undo/
  set undofile
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" JavaScript
" ------------------------------------------------------------------------------
let javascript_enable_domhtmlcss = 1
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
" riot tag
autocmd BufNewFile,BufRead *.tag setlocal ft=javascript

" git
" ------------------------------------------------------------------------------
autocmd BufRead,BufNewFile COMMIT_EDITMSG setf git 

" markdown
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.markdown,*.md set ft=markdown
let g:markdown_fenced_languages = [
      \  'coffee', 'css', 'erb=eruby', 'js=javascript', 'json=javascript', 'ruby',
      \  'sass', 'xml', 'html'
      \]

" quickrun
" ------------------------------------------------------------------------------
silent! map <unique> <Space>q <Plug>(quickrun)
let g:quickrun_config = {}

" syntastic
" ------------------------------------------------------------------------------
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": [],
  \ "passive_filetypes": ['ruby'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_scss_checkers = ['sassc']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_javascript_checkers= ['eslint']

" ctrlp
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['dir', 'quickfix', 'mixed']
let g:ctrlp_open_multiple_files = '2hi'
let g:ctrlp_prompt_mappings = { 'MarkToOpen()': ['<c-@>'] }
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

" YCM
" ------------------------------------------------------------------------------
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" ultisnips
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" Easy align
" ------------------------------------------------------------------------------
vnoremap <silent> <Enter> :EasyAlign<cr>

" keymap
" ------------------------------------------------------------------------------
imap jj <ESC>

noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" reload vimrc
nnoremap <Space>s. :<C-u>source ~/.vimrc<CR>

" open browser
nmap ,ob <Plug>(openbrowser-smart-search)
vmap ,ob <Plug>(openbrowser-smart-search)

" clear highlight
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" vim:set ft=vim et sw=2:
