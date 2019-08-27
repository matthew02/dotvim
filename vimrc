" Maintainer:	James Smith <matthew02@users.noreply.github.com>
"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Keep Plugin commands between vundle#begin/end.

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Sensible default vim settings
Plugin 'tpope/vim-sensible'

"YouCompleteMe code completion magic
Plugin 'Valloric/YouCompleteMe'

" Real-time syntax checking
Plugin 'scrooloose/syntastic'

" Syntax highlighting
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




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
" Colors and styling                                                         "
"----------------------------------------------------------------------------"
" Set the number of terminal colors to 256 for nice color schemes
"set t_Co=256

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

" Enable italics
let g:onedark_terminal_italics=1

"set background=dark
colorscheme onedark
"colorscheme Brogrammer
"colorscheme jellybeans
"colorscheme solarized
"colorscheme peaksea
"colorscheme rdark

" Set the background to dark gray
"hi Normal guibg=#333333
highlight Normal ctermbg=0 cterm=NONE
"highlight Normal ctermbg=#333333
"highlight Normal guifg=#e0e0e0 guibg=#242424 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
"highlight Normal guifg=#e0e0e0 guibg=#242424 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
"highlight NonText guifg=#99968b guibg=#333333 gui=NONE ctermfg=246 ctermbg=16 cterm=NONE

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

" Do not wrap long lines
set nowrap




"----------------------------------------------------------------------------"
" Filetype specific settings                                                 "
"----------------------------------------------------------------------------"
" Tabs for python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_utilisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1




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
