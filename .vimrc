" ==============================================================================
" vimrc
" ==============================================================================

" vim-plug
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'flazz/vim-colorschemes'
Plug 'gko/vim-coloresque'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
Plug 'kewah/vim-stylefmt'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mattn/emmet-vim'
Plug 'mattn/jscomplete-vim'
Plug 'myhere/vim-nodejs-complete'
Plug 'osyo-manga/vim-precious'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-textobj-ruby'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/context_filetype.vim'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" config
" ------------------------------------------------------------------------------
colorscheme nord
set background=dark
set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip= 
set clipboard=unnamed
set complete=.,b,u,]
set completeopt=menu,preview
set directory=$HOME/.vim/files/swap/
set expandtab
set hidden
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set incsearch
set list
set report =0
set shiftround
set shiftwidth=2 
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=2
set splitbelow
set splitright
set ttyfast
set updatecount=100
set visualbell t_vb=
set wildmode=longest,list:longest
set wrapscan

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

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

" Vue
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.vue set filetype=vue

" ALE
" ------------------------------------------------------------------------------
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_linters = {
\   'javascript': ['prettier'],
\   'scss': ['sasslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'scss': ['prettier'],
\   'ruby': ['rubocop'],
\}

" FZF
" ------------------------------------------------------------------------------
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" vim-precious
" ------------------------------------------------------------------------------
let g:precious_enable_switchers = {
\  "eruby": {
\    "setfiletype": 0
\  }
\}

" lightline
" ------------------------------------------------------------------------------
set noshowmode
let g:lightline = {
\  'colorscheme': 'nord',
\  'active': {
\    'left': [ ['mode', 'paste'],
\              ['gitbranch', 'readonly', 'filename', 'modified'] ],
\    'right': [ ['ale', 'lineinfo'],
\             ['percent'],
\             ['fileformat', 'fileencoding', 'filetype'] ]
\  },
\  'component_function': {
\    'gitbranch': 'FugitiveStatusline',
\    'ale': 'ALEGetStatusLine',
\    'readonly': 'LightLineReadonly'
\  }
\}

function! LightLineReadonly()
  return &readonly && &filetype !~? 'help\|vimfiler' ? 'RO' : ''
endfunction

" nord
" ------------------------------------------------------------------------------
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1

" keymap
" ------------------------------------------------------------------------------
let mapleader = ','

imap jj <ESC>
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" reload vimrc
nnoremap <Space>s. :<C-u>source ~/.vimrc<CR>

" open browser
nmap <leader>ob <Plug>(openbrowser-smart-search)
vmap <leader>ob <Plug>(openbrowser-smart-search)

" Input Method
:inoremap <ESC> <ESC>:set iminsert=0<CR>
:inoremap <C-c> <C-c>:set iminsert=0<CR>

" Easy align
vnoremap <silent> <Enter> :EasyAlign<cr>

" ALE move
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" FZF
nmap ; :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <leader>r :Tags<CR>
nmap <leader>a :Ag<CR>
nmap <leader>A :Ag!<CR>
nmap <leader>h :History<CR>
nmap <leader>g :GFiles?<CR>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" quickrun
silent! map <unique> <Space>q <Plug>(quickrun)

" vim:set ft=vim et sw=2:
