" Maintainer:	James Smith <matthew02@users.noreply.github.com>
" Last change:	2014 Dec 19
"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" If Vundle.vim is not installed, make it so
let isVundleInstalled = 0
let vundle_readme = expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.vim..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let isVundleInstalled = 1
endif

" Set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Sensible default vim settings
Plugin 'tpope/vim-sensible'

"YouCompleteMe code completion magic
Plugin 'Valloric/YouCompleteMe'

" Syntastic pretty syntax highlighting
Plugin 'scrooloose/syntastic'

" All plugins must be added before the following line
call vundle#end()

" Let Vundle install your missing plugins
if isVundleInstalled == 1
    echo "Installing plugins... Please ignore key map error messages."
    echo ""
    :BundleInstall
endif




"----------------------------------------------------------------------------"
" Colors and styling                                                         "
"----------------------------------------------------------------------------"
" Set the number of terminal colors to 256 for nice color schemes
set t_Co=256

set background=dark
colorscheme Brogrammer
"colorscheme jellybeans
"colorscheme solarized
"colorscheme peaksea
"colorscheme rdark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac




"----------------------------------------------------------------------------"
" Search                                                                     "
"----------------------------------------------------------------------------"
" Perform case-insensitive search
set ignorecase

" Perform case-sensitive search if the search pattern includes upper-case
set smartcase

" Search as you type
set incsearch

" Highlight search results
set hlsearch




"----------------------------------------------------------------------------"
" Tabbing                                                                    "
"----------------------------------------------------------------------------"
" Load indentation rules and plugins according to the detected filetype.
filetype plugin on
filetype indent on

" Auto-indent new lines and indent according to file type
set autoindent
set smartindent

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" Insert spaces up to where the next tab should logically be
set smarttab

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78




"----------------------------------------------------------------------------"
" Visual                                                                     "
"----------------------------------------------------------------------------"
" Show line numbers
set number

" Highlight active line number
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
set cursorline

" Show the line and column number for the cursor position
set ruler

" Use syntax highlighting
syntax on

" Toggle showing invisible characters
set list

" Show custom symbols for tabstops '›' and EOLs '¬'
set listchars=tab:›\ ,eol:¬




"----------------------------------------------------------------------------"
" Input                                                                      "
"----------------------------------------------------------------------------"
" When a brace is inserted, briefly jump to it's mate
set showmatch

" Make backspace work like most other apps
set backspace=eol,start,indent

" Wrap the cursor up/down when moved while at the beginning/end of a line
set whichwrap+=<,>,h,l

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Map space to page-down and - to page-up
noremap <Space> <PageDown>
noremap - <PageUp>

" Map double press Tab to cycle through windows
map <Tab><Tab> <C-W>w

" Pressing ,ss will toggle spell-checking
"map <leader>ss :setlocal spell!<cr>




"----------------------------------------------------------------------------"
" Under the hood                                                             "
"----------------------------------------------------------------------------"
" Automatically save before commands like :next and :make
set autowrite

" Hide buffers when they are abandoned
set hidden

" Have Vim jump to the last position when reopening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \endif

" Set to autoread when a file is changed from the outside
set autoread

" Keep a backup file 
set backup

" Keep an undo file, persistent across vim sessions
set undofile
set undolevels=100
set undoreload=1000

" Keep backup, undo, and swap files in a global directory
" Use /tmp as a fallback in case of error
" Use full-path names to avoid conflict  -- place // at the end of the line
set backupdir=~/.vim/.backup//,/tmp//
set undodir=~/.vim/.undo//,/tmp//
set directory=~/.vim/.swp//,/tmp//

" Keep 100 lines of command line history
set history=100

" Allow saving a file as SU when accidentally not opened with sudo
cmap w!! w !sudo tee % > /dev/null




"----------------------------------------------------------------------------"
" Interface                                                                  "
"----------------------------------------------------------------------------"
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Change the command bar height
set cmdheight=2

" Show additional information about an in-progress command
set showcmd

" Enable the Wild menu
set wildmenu

" Enable mouse usage (all modes)
set mouse=a

" Keep a minimum of three lines above and below the cursor
set scrolloff=3

" Place new vsplit windows to the right
set splitright

" Place new split windows below
set splitbelow




"----------------------------------------------------------------------------"
" Helper functions                                                           "
"----------------------------------------------------------------------------"
" Delete trailing white space on save for Python
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" See difference between current buffer and the file it was loaded from
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
               \ | wincmd p | diffthis


"----------------------------------------------------------------------------"
" Credit to the following...                                                 "
"----------------------------------------------------------------------------"
"http://amix.dk/vim/vimrc.html
"http://blog.mojotech.com/a-veterans-vimrc/
"https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
"https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
"
" Apologies to anyone who deserves credit but isn't on the list.
" If you've been left out, please shoot me an email and I'll put you in here.
