" ==============================================================================
" vimrc
" ==============================================================================

" vim-plug
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
" Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'mattn/jscomplete-vim'
Plug 'tyru/open-browser.vim'
Plug 'rhysd/vim-textobj-ruby'
Plug 'rking/ag.vim'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'Yggdroot/indentLine'
" Plug 'todesking/ruby_hl_lvar.vim'
Plug 'pangloss/vim-javascript'
Plug 'myhere/vim-nodejs-complete'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'gko/vim-coloresque'
Plug 'digitaltoad/vim-pug'
Plug 'kewah/vim-stylefmt'
Plug 'posva/vim-vue'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" config
" ------------------------------------------------------------------------------
colorscheme hybrid
set background=dark

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

set splitbelow
set splitright

" set cursorline
set wrapscan
set report =0
" set synmaxcol =200

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
set visualbell t_vb=
set complete=.,b,u,]

set iminsert=0
set imsearch=0

set statusline=%f\ %m%r%h%w
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}][%{&fileformat}]
set statusline+=%{fugitive#statusline()}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=%=
set statusline+=%#warningmsg# 
set statusline+=%{ALEGetStatusLine()}
set statusline+=%* 
set statusline+=\ %(%c:%l/%L%)\ %P

set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip= 
set directory=$HOME/.vim/files/swap//
set updatecount=100

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

" PHP
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.php setlocal tabstop=4 shiftwidth=4

" CSS
" ------------------------------------------------------------------------------
" autocmd BufWritePre *.css :Stylefmt
" autocmd BufWritePre *.scss :Stylefmt

" JavaScript
" ------------------------------------------------------------------------------
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
autocmd BufNewFile,BufRead *.ejs set filetype=html

" JSON
" ------------------------------------------------------------------------------
let g:vim_json_syntax_conceal = 0

" git
" ------------------------------------------------------------------------------
autocmd BufRead,BufNewFile COMMIT_EDITMSG setf=git

" markdown
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.markdown,*.md set ft=markdown
let g:markdown_fenced_languages = [
      \  'css', 'erb=eruby', 'js=javascript', 'json=javascript', 'ruby',
      \  'sass', 'xml', 'html'
      \]

" quickrun
" ------------------------------------------------------------------------------
silent! map <unique> <Space>q <Plug>(quickrun)
let g:quickrun_config = {}

" ALE
" ------------------------------------------------------------------------------
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_ruby_rubocop_executable = 'bundle exec rubocop'
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" ctrlp
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['quickfix', 'mixed']
let g:ctrlp_open_multiple_files = '2hi'
let g:ctrlp_prompt_mappings = { 'MarkToOpen()': ['<c-@>'] }
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" UltiSnips
" ------------------------------------------------------------------------------
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"

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

" call Ag
noremap ,ag :Ag

" Input Method
:inoremap <ESC> <ESC>:set iminsert=0<CR>
:inoremap <C-c> <C-c>:set iminsert=0<CR>

" ALE move
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim:set ft=vim et sw=2:
