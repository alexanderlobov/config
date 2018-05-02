" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Mappings {{{
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Use :tjump instead of :tag
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" }}}


" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  autocmd FileType cpp set cindent
  autocmd FileType cpp set cino+=g-1
  autocmd FileType cpp set cino+=:0

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType text set foldmethod=marker
  autocmd FileType text set formatoptions=tcqnro
  autocmd FileType text set wrap
  autocmd FileType text set shiftwidth=4
  autocmd FileType text set tabstop=4

  " autocmd FileType text setlocal formatoptions=tcqn

  autocmd FileType cpp set textwidth=79
  autocmd FileType cpp set wrap
  " autocmd FileType cpp set colorcolumn=80
  " autocmd FileType cpp syntax off
  
  autocmd FileType vim  set foldmethod=marker

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " autocmd BufRead,BufNewFile *.json set filetype=json
  " augroup json_autocmd
  "   autocmd!
  "   autocmd FileType json set autoindent
  "   autocmd FileType json set formatoptions=tcq2l
  "   autocmd FileType json set textwidth=78 shiftwidth=2
  "   autocmd FileType json set softtabstop=2 tabstop=8
  "   autocmd FileType json set expandtab
  "   autocmd FileType json set foldmethod=syntax
  " augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Tabs

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

let g:pyindent_continue='&sw'
let g:pyindent_open_paren='&sw'

" Appearance

set t_ZH=[3m
set t_ZR=[23m
colo codefocus-light
set colorcolumn=81

" Always show a status line
set laststatus=2

set listchars=tab:>-,trail:~
set listchars=trail:~
set list
" Для облегчения работы с кириллицей
" Переключение раскладки по CTRL-^
" Команды работают при любой раскладке
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set textwidth=80

set nowrap
set autoindent

set tags+=~/src/poco/tags
cscope add ~/src/poco/cscope.out


" if &diff
"     syntax off
" endif

" set formatoptions-=t

" highlight OverLength ctermbg=black ctermfg=red
" match OverLength /\%81v.\+/

