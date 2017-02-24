scriptencoding utf-8
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

function! GetOS()
    if has("win32")
        return "windows"
    endif
    if has("unix")
        if system('uname')=~'Darwin'
            return "mac"
        else
            return "linux"
        endif
    endif
endfunction

let os=GetOS()

if os == "windows"
    set rtp+=$HOME/.vim/bundle/Vundle.vim/
    let path='$HOME/.vim/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

"Added by me
Bundle "scrooloose/syntastic"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle "honza/vim-snippets"
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/peaksea'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wgibbs/vim-irblack'
Bundle 'therubymug/vim-pyte'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'Townk/vim-autoclose'
Bundle 'vim-scripts/Align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'

" plugin from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax enable
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible

" Enable modeline for individual file specific settings"
set modeline

"My .vimrc
let mapleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 3 lines to the cursor - when moving vertically using j/k
set so=4

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.gch,*.pyc,*.jpg,*.gif,*.png

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No idea what this does
set nostartofline

" List the tab spaces and trailing charaters as below
set list
" set listchars=tab:»·,trail:·
" set listchars=tab:»·,eol:¬,trail:·,extends:↪,precedes:↩
set listchars=tab:»·,trail:·,extends:↪,precedes:↩

" Always show tabs (avoids frequent window resizing)
set showtabline=2 

" Open new horizontal split below the current window
set splitbelow

" Open vertical split to the right of the current window
set splitright

" Set minimum windows height to 3, doesn't work
"set winheight=3
"set winminheight=3

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2


"" messages and info
set shortmess=aoOstTI
set showcmd
set showmode
set cursorline
set report=0
set noerrorbells
set novisualbell t_vb=".

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=80
set autoindent
set smartindent
"set cinoptions=:0.5s,=0.5s,l1,g0.5s,h0.5s,t0,i0,(0
"               |     |     |  |     |     |  |  +-- indent from unclosed parens
"               |     |     |  |     |     |  +-- C++ base class decls and initializations
"               |     |     |  |     |     +-- indent function return type at margin
"               |     |     |  |     +-- places statements after C++ scope decls
"               |     |     |  +--  place C++ scope declarations
"               |     |     +-- align with case label instead of statement
"               |     +-- place statements after case label
"               +-- placement of case after switch statement

" Commenting this out as it is not compatible with vi"
" folding
"set nofoldenable
"set foldmarker={,}
"set foldmethod=syntax
"set foldlevel=0
"set foldopen+=jump

"Show the line numbers
set number

"Map F4 to toggle search results highlights
nnoremap <F4> :set hlsearch!<CR>

" Linebreak on 500 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
nnoremap <Up> :-10<Cr>
nnoremap <Down> :+10<Cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nnoremap <space> /
nnoremap <c-space> ?

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Close the current buffer
nnoremap <leader>bd :Bclose<cr>

" Close all the buffers
nnoremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

" Move tab left or right"
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<Cr>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<Cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
"try
" set switchbuf=useopen,usetab,newtab
" set stal=2
"catch
"endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set enc=utf-8
set fillchars+=stl:=,stlnc:\ 
" Format the status line
"let g:Powerline_symbols = 'fancy'

" Used in case we don't have powerline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ [%l,%c]

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Set extra options when running in GUI mode
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=70 columns=190
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
else
  " This is console Vim.
" if exists("+lines")
"   set lines=50
" endif
" if exists("+columns")
"   set columns=100
" endif
endif

"Map jj to Escape out of Insert Mode 
inoremap jj <Esc>

"Set current working directory to change on window enter.
autocmd BufEnter * silent! lcd %:p:h

"Map <Tab> in normal mode to do tabbing
nnoremap <Tab> i<Tab><Esc>l

"Map <Cr> in normal mode to insert a line
nnoremap <Cr> o<Esc>

" CTAGS
" Run `ctags -R .` in project root first.
set tags=./tags;/
" Ctrl + ] - open definition
" Ctrl + W, Ctrl + ] - open definition in horizontal split
" Ctrl + t - jump back
" Ctrl + o - up one level
" Ctrl + i - down one level
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-\> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-]> :tabe <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-LeftMouse> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-RightMouse> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Press Alt+u to convert current word to uppercase
inoremap <A-u> <Esc>viwUi
" Press Alt+l to convert current word to lowercase
inoremap <A-l> <Esc>viwui
nnoremap <A-u> viwU
nnoremap <A-l> viwu

" Quickly open VIMRC in a vertical split
nnoremap <leader>ev :tabe $MYVIMRC<Cr>
" Quickly source VIMRC to apply settings
nnoremap <leader>sv :source $MYVIMRC<Cr>
nnoremap <leader>em :split ~/.vim/macros.vim<Cr>

"Don't separate *.h from other files (as is done by default) in Explore
let g:netrw_sort_sequence = "[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$"
let g:netrw_list_hide = "\.swp$,\.o$,\.a$,\.so$"

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Shortcuts used too freqently.
" Typing LHS will replace it with RHS

" Surround the current word with double quotes
nnoremap <Leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
" Surround the current visual block with double quotes
vnoremap <Leader>" <Esc>a"<Esc>`<i"<Esc>

" Search and replace the previous word with the word last searched for
inoremap <A-r> <Esc>mzyiw:%s//\=@0/g<Cr>`za
nnoremap <A-r> mzyiw:%s//\=@0/g<Cr>`z

" YouCompleteMe
" let g:ycm_auto_trigger = 0
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = "~/.vim/config/.config_extra_conf.py"
" let g:ycm_autoclose_preview_window_after_insertion = 1
"
" 
" let g:ycm_filetype_whitelist = { 'cpp': 0, 'py': 1, 'h': 0}
" 
" let g:ycm_filetype_blacklist = {
"   \ 'tagbar' : 1,
"   \ 'qf' : 1,
"   \ 'notes' : 1,
"   \ 'markdown' : 1,
"   \ 'unite' : 1,
"   \ 'text' : 1,
"   \ 'vimwiki' : 1,
"   \ 'pandoc' : 1,
"   \ 'infolog' : 1,
"   \ 'mail' : 1
"   \}


" Syntastic
"
" Jump to errors with ']'/'[' and lowercase 'L'
"
let g:syntastic_always_populate_loc_list = 1

" C++
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers=['gcc']

" snipMate
" :h snipMate-mappings
"<Plug>snipMateNextOrTrigger     Default: <Tab>          Mode: Insert, Select
"<Plug>snipMateBack              Default: <S-Tab>        Mode: Insert, Select
"<Plug>snipMateShow              Default: <C-R><Tab>     Mode: Insert
"<Plug>snipMateVisual            Default: <Tab>          Mode: Visual

" Put these here, didn't work. Putting them in vim-snipmate-master/after/plugin/snipMate.vim
" inoremap <Leader><Tab> <Plug>snipMateNextOrTrigger
" snoremap <Leader><Tab> <Plug>snipMateNextOrTrigger
" vnoremap <Leader><Tab> <Plug>snipMateVisual


""20 command line editing
set history=100
"if has("persistent_undo")
"  set undofile
"  set undodir=~/.vim/undo
"endif

"Color Schemes
colorscheme molokai

"Font
if os == "windows"
  " set guifont=Consolas:h12:cANSI
  set guifont=Inconsolata:h12:cANSI
else
  set guifont=Monospace\ 10
endif

if exists(":Tabularize")
    nnoremap <Leader>a= :Tabularize /=<CR>
    vnoremap <Leader>a= :Tabularize /=<CR>
    nnoremap <Leader>a: :Tabularize /:\zs<CR>
    vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif

nnoremap <F5> :filetype detect<Cr>
inoremap <F5> <Esc>mz:filetype detect<Cr>`z

if os != "windows"
  source ~/.vim/marvim/marvim.vim
  let marvim_store='~/.vim/marvim'
endif

nnoremap <C-Tab> :tabn<Cr>
nnoremap <C-S-Tab> :tabp<Cr>

" Tabman settings"
" Change the default mappings:

let g:tabman_toggle = '<leader>mt'
let g:tabman_focus  = '<leader>mf'

" Change the width of the TabMan window:
let g:tabman_width = 25

" And the position:
let g:tabman_side = 'left'

" Set this to 1 to show windows created by plugins, help and quickfix:
let g:tabman_specials = 0

" Set this to 0 to disable line numbering in the TabMan window:
let g:tabman_number = 1

" Git gutter settings, too slow, disable.
let g:gitgutter_enabled = 0
"let g:gitgutter_signs = 0
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

" Rainbow Parentheses"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Quick write session with F6
map <F6> :mksession! ~/.vim/last.session <cr>

" And load session with F7
map <F7> :source ~/.vim/last.session <cr>

" Disable scrollbars and tab button bar.
setglobal guioptions-=L
setglobal guioptions-=l
setglobal guioptions-=R
setglobal guioptions-=r
setglobal guioptions-=b
setglobal guioptions-=h

" Disable tab button bar.
"setglobal guioptions-=e

" Settings for octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
"let g_cpp_experimental_template_highlight = 1



