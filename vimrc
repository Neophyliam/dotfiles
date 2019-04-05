set nocompatible
" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'SirVer/ultisnips' |  Plug 'honza/vim-snippets'
Plug 'tomasr/molokai'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-lastpat'
Plug 'easymotion/vim-easymotion'
call plug#end()


" The list of options
set backup		" keep a backup file (restore to previous version)
set backupdir=~/.vim/vimbak
set undofile
set undodir=~/.vim/undo
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set shiftwidth=4
set tabstop=4
set scrolloff=5
set updatetime=1000
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
let mapleader = ","
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
nmap <leader>e <Plug>(ale_detail)
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
" Make g<C-]> be the default jump command
nnoremap <C-]> g<C-]>
" Easymotion map
map <Leader> <Plug>(easymotion-prefix)


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
augroup reload
    au!
    " Source the vimrc file after saving it.
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END


" Plugin settings
packadd matchit
" Settings for ale
let g:ale_echo_msg_format='[%linter%|%severity%] %s'
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8'
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
" Settings for UltiSnips
let g:snips_author="Neophyliam"
let g:snips_email="727549953@qq.com"
let g:snips_github="https://github.com/Neophyliam"
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mysnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]

" Colorscheme setting
colorscheme molokai
