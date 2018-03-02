" Required by Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" My plugins are listed here
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'suan/vim-instant-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
"Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required


" The list of options
set backup		" keep a backup file (restore to previous version)
set backupdir=~/.vim/vimbak
"set undofile		" keep an undo file (undo changes after closing)
"set backupext=.bak	  keep backup file ending with .bak, rather than ~
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set shiftwidth=4
set wildmenu
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set colorcolumn=80
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  " Put this line to make fortran's syntax file work well.
  let fortran_free_source=1
  syntax on
  set hlsearch
endif
if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Mappings are defined here
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" A quick way to handle buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" For ale plugin. These can be used to find errors and warnings quickly.
nmap <silent> [e <Plug>(ale_previous)
nmap <silent> ]e <Plug>(ale_next)
" Cycle items in quickfix list quickly. It's like [e for ale plugin. But
" they are different.
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
" Expand '%:h' with '%%'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Pressing <C-L> after a search can mute the highlighting
nnoremap <silent> <C-L> :<C-U>nohlsearch<CR>
" Count matches and show the result
nnoremap <C-N> :<C-U>%s///gn<CR>
" Replace & with more useful command :&&
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Make j and k more intuitive
nnoremap j gj
nnoremap k gk
" Use Y to yank from cursor to the end of this line, which is more logical
nnoremap Y y$
nnoremap go mmo<C-[>`m
nnoremap gO mmO<C-[>`m


" Auto commands defined here.
augroup vimrcEx
    au!
    " For all text files set 'textwidth' to 75 characters.
    autocmd FileType text setlocal textwidth=75
    autocmd FileType markdown setlocal textwidth=75
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" Auto-backup dot files.
augroup backuprc
    au!
    " Source the vimrc file after saving it.
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost .vimrc exe "!backup"
    autocmd bufwritepost .bashrc exe "!backup"
    autocmd bufwritepost .tmux.conf exe "!backup"
augroup END


" Package settings
packadd matchit
"Settings for vim-markdown
let g:vim_markdown_folding_disabled=1
" Settings for ale
let g:ale_echo_msg_format='[%linter%|%severity%] %s'
" Settings for UltiSnips
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mysnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]
"Setting for ale
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_args = '-m flake8'

" Colorscheme setting
colorscheme molokai