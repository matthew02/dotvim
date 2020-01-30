" Maintainer:	James Smith <matthew02@users.noreply.github.com>
"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible




"----------------------------------------------------------------------------"
" Plugins                                                                    "
"----------------------------------------------------------------------------"
" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
"Plug 'Valloric/YouCompleteMe'
call plug#end()




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

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2

" Insert spaces up to where the next tab should logically be
set smarttab

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80




"----------------------------------------------------------------------------"
" Visual                                                                     "
"----------------------------------------------------------------------------"
" Show line numbers
set number

" Highlight active line number
augroup CLNRSet
    autocmd! ColorScheme * highlight CursorLineNR cterm=bold
augroup END

" Highlight the active line
set cursorline

" Show the line and column number for the cursor position
set ruler

" Use syntax highlighting
syntax on

" Toggle showing invisible characters
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»




"----------------------------------------------------------------------------"
" Colors and styling                                                         "
"----------------------------------------------------------------------------"
"Use 24-bit (true-color) mode in when outside tmux
"Use 24-bit (true-color) mode in when outside tmux
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set the font for GVim
if has("gui_running")
  set guifont=Source\ Code\ Pro\ Medium\ 11
endif

" Enable italics
let g:monokai_term_italic=1
let g:monokai_gui_italic=1

" Load overrides after the color scheme is loaded
augroup OverrideColorScheme
  autocmd colorscheme * source ~/.vim/colors/monokai_override.vim
augroup END

"set background=dark
colorscheme monokai
"colorscheme onedark
"colorscheme Brogrammer
"colorscheme jellybeans
"colorscheme solarized
"colorscheme peaksea
"colorscheme rdark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac




"----------------------------------------------------------------------------"
" Input                                                                      "
"----------------------------------------------------------------------------"
" When a brace is inserted, briefly jump to it's mate
set showmatch

" Make backspace work like most other apps
set backspace=eol,start,indent

" Wrap the cursor up/down when backspacind and or moved while at the beginning/end of a line
set whichwrap=b,<,>,h,l

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Escape from insert mode and write the buffer by pressing uu
inoremap <silent> uu <Esc>:w<CR>

" Automatically write the buffer when pressing <Esc> to leave insert mode
inoremap <Esc> <Esc>:w<CR>

" Map space to page-down and - to page-up
noremap <Space> <PageDown>
noremap - <PageUp>

" Map double press Tab to cycle through windows
map <Tab><Tab> <C-W>w

" Pressing ,ss will toggle spell-checking
"map <leader>ss :setlocal spell!<cr>

" Disable navigation keys to force correct habits
cnoremap <Up> <NOP>
cnoremap <Down> <NOP>
cnoremap <Left> <NOP>
cnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>

vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>




"----------------------------------------------------------------------------"
" Under the hood                                                             "
"----------------------------------------------------------------------------"
" Automatically save before commands like :next and :make
"set autowrite

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

" Automatically save the buffer whenever text is changed
"autocmd TextChanged,TextChangedI * silent write




"----------------------------------------------------------------------------"
" Interface                                                                  "
"----------------------------------------------------------------------------"
" Always show the status line
set laststatus=2

" Format the status line
" Paste mode flag, text is '[Paste]'
set statusline=\ %{HasPaste()}
" Full path to the file in the buffer
set statusline+=\ %F
" Modified flag, text is '[+]'; '[-]' if 'modifiable' is off.
set statusline+=%m
" Read-only flag, text is '[RO]'
set statusline+=%r
" Help buffer flag, text is '[help]'
set statusline+=%h
" Preview window flag, text is '[Preview]'
set statusline+=\ %w
" Current working directory
set statusline+=\ \ CWD:\ %{getcwd()}
" Line number and number of lines in buffer, text is Line: X/Y
set statusline+=\ \ \ Line:\ %l/%L
" Column number
set statusline+=\ \ \ Col:\ %c

" Change the command bar height
set cmdheight=2

" Show additional information about an in-progress command
set showcmd

" Enable enhanced command line completion
set wildmenu

" Enable mouse usage (all modes)
set mouse=a

" Keep a minimum of three lines above and below the cursor
set scrolloff=3

" Place new vsplit windows to the right
set splitright

" Place new split windows below
set splitbelow

" Do not wrap long lines
set nowrap




"----------------------------------------------------------------------------"
" Filetype specific settings                                                 "
"----------------------------------------------------------------------------"
" Tabs for python
autocmd FileType python setlocal ts=4 sw=4 expandtab




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
    return '[Paste]'
  en
  return ''
endfunction


" See difference between current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
               \ | wincmd p | diffthis


" Toggle background transparency
let t:is_transparent = 0
function! Toggle_transparent()
  if t:is_transparent == 0
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 1
  else
    set background=dark
    let t:is_transparent = 0
  endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>
