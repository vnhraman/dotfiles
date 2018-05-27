"Font
if os == "windows"
  " set guifont=Consolas:h12:cANSI
  silent! set guifont=Inconsolata:h12:cANSI
else
  silent! set guifont=Monospace\ 10
endif

"Color Schemes
silent colorscheme molokai

" Set extra options when running in GUI mode
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=70 columns=190
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

