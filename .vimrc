"k vim:set ts=8 sts=2 sw=2 tw=0:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'h1mesuke/unite-outline'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'honza/vim-snippets'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kana/vim-smartinput'
Bundle 'kchmck/vim-coffee-script'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/emmet-vim'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'open-browser.vim'
Bundle 'othree/html5.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/syntastic'
Bundle 'sgur/ctrlp-extensions.vim'
Bundle 'slim-template/vim-slim'
Bundle 'textobj-user'
Bundle 'thinca/vim-quickrun.git'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'unite.vim'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'vim-scripts/JavaScript-Indent'

syntax on
filetype plugin indent on

set background=dark
colorscheme hemisu

set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac

set iminsert=0
set imsearch=0

set clipboard=unnamed
set pastetoggle=<F10>
set autowrite
set autoread
set nowritebackup
set nobackup
set noswapfile
set hidden

set cmdheight=2
set cursorline
"set completeopt-=preview
set showmatch
set wildmenu
set history=50
set backspace=indent,eol,start
set formatoptions+=m
" set complete+=k
set vb
set keywordprg=:help

set autoindent
set smartindent
set cindent
set cinoptions=:s,ts,cs
set cinwords=if,else,while,do,for,switch,case

set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch

set ts=4
set sts=4
set sw=4
set smarttab
set expandtab

set list
set showcmd
set title
set number
set ruler
set listchars=tab:>\
set scrolloff=5
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
set tabpagemax=15

set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag

" ruby support
" ------------
au FileType ruby set ts=2 sw=2 sts=2
au BufNewFile,BufRead *.ru setf ruby
au BufNewFile,BufRead Gemfile setf ruby

" html/xml support
" ----------------
" let html_no_rendering=1
" let eruby_percent_processing=1
" let g:html_indent_inctags = "html,body,head,tbody"
au FileType html,xhtml,xml,eruby set sw=2 ts=2 sts=2
" au Filetype html,xhtml set indentexpr&

" CSS
" ---
au FileType css,scss set ts=2 sw=2 sts=2

" Javascript
" ----------
let javascript_enable_domhtmlcss=1
au FileType javascript set sw=2 ts=2 sts=2
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1

" CoffeeScript
" ----------
au BufNewFile,BufReadPost *.coffee setl sw=2

" php only
" ----------
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1

" git
" ----------
au BufRead,BufNewFile COMMIT_EDITMSG setf git 

" sh
" ----------
let g:is_bash = 1

" markdown
" ----------
autocmd BufNewFile,BufRead *.markdown,*.md,*.mkd,*.mdown,*.mkdn set ft=markdown
au FileType markdown set sw=2 ts=2 sts=2

" File Browser
" ------------
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0

" keymap
" ----------
imap jj <ESC>

noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" emacs like
imap <C-e> <C-o>$
map <C-e> $

" unite.vim
" let g:unite_enable_start_insert=1
" buffers
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" files
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" MRU
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" set
nnoremap <silent> ,uu :<C-u>Unite buffer -buffer-name=files file file_mru<CR>

" open split
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" quickrun
silent! map <unique> <Space>q <Plug>(quickrun)
let g:quickrun_config = {}

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_loc_list_height = 5

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|sass-cache\|bundle'
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_extensions = ['mixed', 'dir']

" nerdtree
let NERDTreeIgnore=['node_modules', '.sass-cache']

" open browser
nmap ,ob <Plug>(openbrowser-smart-search)
vmap ,ob <Plug>(openbrowser-smart-search)

" reload vimrc
nnoremap <Space>s. :<C-u>source ~/.vimrc<CR>
