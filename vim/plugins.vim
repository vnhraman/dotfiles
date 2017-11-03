"===============================================================================
" vim-plug plugin manager config.

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Use single quotes for all arguments to Plug

Plug 'vim-scripts/Align'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tmux-plugins/vim-tmux'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Initialize plugin system
call plug#end()

" Brief help
" PlugInstall [name ...] [#threads]   Install plugins
" PlugUpdate [name ...] [#threads]    Install or update plugins
" PlugClean[!]                        Remove unused directories (bang version
"                                     will clean without prompt)
" PlugUpgrade                         Upgrade vim-plug itself
" PlugStatus                          Check the status of plugins
" PlugDiff                            Examine changes from the previous update
"                                     and the pending changes
" PlugSnapshot[!] [output path]       Generate script for restoring the current
"                                     snapshot of the plugins
"-------------------------------------------------------------------------------

"===============================================================================
" netrw - Built in file browser plugin
"===============================================================================
"Don't separate *.h from other files (as is done by default) in Explore
let g:netrw_sort_sequence = "[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$"
let g:netrw_list_hide = "\.swp$,\.o$,\.so$"

"-------------------------------------------------------------------------------

"===============================================================================
" octol/vim-cpp-enhanced-highlight options
"===============================================================================
let g:cpp_class_scope_highlight = 1
let g_cpp_experimental_template_highlight = 1
"-------------------------------------------------------------------------------

"===============================================================================
" YouCompleteMe options
"===============================================================================

let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_config.global.py"
let g:ycm_confirm_extra_conf = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

" Other options include [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_goto_buffer_command = 'same-buffer' 

let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1,
  \ 'infolog' : 1,
  \ 'mail' : 1
  \}

"-------------------------------------------------------------------------------

"===============================================================================
" Syntastic options - Disabled 2017-03-14
"===============================================================================

"" " Jump to errors with ']'/'[' and lowercase 'L'
"" let g:syntastic_always_populate_loc_list = 1
"" 
"" " C++
"" let g:syntastic_cpp_check_header = 1
"" let g:syntastic_cpp_checkers=['g++']
"-------------------------------------------------------------------------------

"===============================================================================
" Git gutter settings, too slow, disable.
"===============================================================================
let g:gitgutter_enabled = 0
"let g:gitgutter_signs = 0
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0
"-------------------------------------------------------------------------------

"===============================================================================
" Rainbow Parentheses"
"===============================================================================
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
"-------------------------------------------------------------------------------

" Format the status line, this should be in settings.vim but I don't know how to
" conditionally enable it only when vim-arline hasn't loaded.
" Used in case we don't have powerline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ [%l,%c]


"===============================================================================
" Tabularize
"===============================================================================
if exists(":Tabularize")
    nnoremap <Leader>a= :Tabularize /=<CR>
    vnoremap <Leader>a= :Tabularize /=<CR>
    nnoremap <Leader>a: :Tabularize /:\zs<CR>
    vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif
"-------------------------------------------------------------------------------
