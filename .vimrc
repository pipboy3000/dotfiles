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
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-smartinput'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'open-browser.vim'
Plugin 'scrooloose/syntastic'
Plugin 'thinca/vim-quickrun.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'unite.vim'
Plugin 'vim-jp/vimdoc-ja'

call vundle#end()

" config
" ------------------------------------------------------------------------------
syntax on
filetype plugin indent on

colorscheme gotham
set clipboard=unnamed
set wildmode=list:longest,full
set number
set showcmd
set hidden
set visualbell t_vb=

set expandtab
set tabstop=2
set shiftwidth=2 

set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

set iminsert=0
set imsearch=0

set laststatus=2
set statusline=%f\ %m%r%h%w
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}][%{&fileformat}]
set statusline+=%{fugitive#statusline()}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=%=
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 
set statusline+=\ %(%c:%l/%L%)\ %P

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf,*.dmg,*DS_Store*,*.app
set wildignore+=*/Library/**,*/.rbenv/**,*/.Trash/**
set wildignore+=.git,.sass-cache/,node_modules,*/vendor/bundle

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" coffeescript
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" git
" ------------------------------------------------------------------------------
au BufRead,BufNewFile COMMIT_EDITMSG setf git 

" markdown
" ------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.markdown,*.md set ft=markdown
let g:markdown_fenced_languages = [
      \  'coffee', 'css', 'erb=eruby', 'js=javascript', 'json=javascript', 'ruby',
      \  'sass', 'xml', 'html'
      \]

" unite.vim
" ------------------------------------------------------------------------------
" let g:unite_enable_start_insert=1
" buffers
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" files
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" MRU
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" open split
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" quickrun
" ------------------------------------------------------------------------------
silent! map <unique> <Space>q <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command': 'coffee', 'exec': ['%c -cbp %s']}

" syntastic
" ------------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height = 5

" ctrlp
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['dir', 'quickfix', 'mixed']
let g:ctrlp_open_multiple_files = '2hi'
let g:ctrlp_prompt_mappings = { 'MarkToOpen()': ['<c-@>'] }

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
