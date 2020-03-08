" Maintainer:	James Smith <matthew02@users.noreply.github.com>



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

" Automatically saves buffers
Plug '907th/vim-auto-save'

" Linting using Language Server Protocol
Plug 'dense-analysis/ale'

" Adds motions for Python code structures
Plug 'jeetsukumaran/vim-pythonsense'

" Fuzzy finder
Plug 'junegunn/fzf.vim'

" HTML & CSS snippets
Plug 'mattn/emmet-vim'

" Conquer of completion intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" File-system explorer
Plug 'preservim/nerdtree'

" Enable smooth scrolling for page and half-page motion
Plug 'psliwka/vim-smoothie'

" Syntax highlighting and indentation
Plug 'sheerun/vim-polyglot'

" Colorize NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Shortcuts for code commenting
Plug 'tpope/vim-commentary'

" Use some sensible default options
Plug 'tpope/vim-sensible'

" Use pep8 indentation style
"Plug 'vimjas/vim-python-pep8-indent'

" Pretty icons for plugins like NERDTree
Plug 'ryanoasis/vim-devicons'

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
filetype plugin indent on

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
" The active line displays it's absolute position
" Neighboring lines display their position as an offset from the active line
set number relativenumber

" Show absolute line numbers when in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Highlight active line number
augroup CLNRSet
    autocmd! ColorScheme * highlight CursorLineNR cterm=bold
augroup END

" Highlight the active row and column
set cursorline
set cursorcolumn

" Show the line and column number for the cursor position
set ruler

" Use syntax highlighting
syntax on

" Move NERDTree to the right
let g:NERDTreeWinPos="right"



"----------------------------------------------------------------------------"
" Font and text style                                                        "
"----------------------------------------------------------------------------"
" Set the font for GVim
if has("gui_running")
  set guifont=Source\ Code\ Pro\ Medium\ 11
endif

" Enable italics
let g:monokai_term_italic=1
let g:monokai_gui_italic=1

" Toggle showing invisible characters
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»



"----------------------------------------------------------------------------"
" Colors and styling                                                         "
"----------------------------------------------------------------------------"
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

" NERDTree color settings
" Highlight full file name (not only icons)
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1

" Enable folder icon highlighting using exact match
let g:NERDTreeHighlightFolders=1

" Highlight the folder name
let g:NERDTreeHighlightFoldersFullName=1



"----------------------------------------------------------------------------"
" Input                                                                      "
"----------------------------------------------------------------------------"
" When a brace is inserted, briefly jump to it's mate
set showmatch

" Make backspace work like most other apps
set backspace=eol,start,indent

" Wrap the cursor up/down when backspacing and or moved while at the beginning/end of a line
set whichwrap=b,<,>,h,l

" Map space to leader (may break NERDCommenter)
let mapleader="\<Space>"

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Escape from insert mode and write the buffer with uu
"inoremap <silent> uu <Esc>

" Move down one page with - and up one page with _
"noremap <Space> <PageDown>
noremap - <C-u>
noremap _ <C-b>

" Cycle through windows by double-pressing <Tab>
map <Tab><Tab> <C-W>w

" Toggle spell-checking with <Space>ss 
map <leader>ss :setlocal spell!<CR>

" NERDTree keybindings
" Find the currently open file in NERDTree with <Space>ff 
nmap <leader>ff :NERDTreeFind<CR>
" Toggle NERDTree with <Space>tt
nmap <leader>tt :NERDTreeToggle<CR>

" Trigger Emmet with ,,
let g:user_emmet_leader_key=','

" Bindings for Conquer of Completion
" Trigger completion and navigate to the next complete item with <Tab>
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Navigate the completion list with <Tab> and <S-Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Confirm completion with <CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Select the first completion and confirm when to item is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"



" Disable navigation keys to force correct habits
noremap <Up>       <Nop>
noremap <Down>     <Nop>
noremap <Left>     <Nop>
noremap <Right>    <Nop>
noremap <PageUp>   <Nop>
noremap <PageDown> <Nop>
noremap <Home>     <Nop>
noremap <End>      <Nop>



"----------------------------------------------------------------------------"
" Under the hood                                                             "
"----------------------------------------------------------------------------"
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

" Enable autosave (plugin)
let g:auto_save = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



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

" Close the Conquer of Completion preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif



"----------------------------------------------------------------------------"
" Filetype specific settings                                                 "
"----------------------------------------------------------------------------"
" Tabs for Python (override filetype-plugin settings)
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Correct json comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Make Emmet work only with HTML and CSS files
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall



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


" See the difference between current buffer and the file it was loaded from
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


" Show the number of errors and errors in the status line
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=\ \ \ %{LinterStatus()}
