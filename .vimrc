set nocompatible

" Configure vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'klen/python-mode'
Plugin 'mhinz/vim-startify'
" Plugin 'peterhoeg/vim-qml'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mhinz/vim-signify'
" Plugin 'rdnetto/YCM-Generator'
"Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'neomake/neomake'
Plugin 'chriskempson/base16-vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

"set guifont=terminus\ 10
set guifont=Misc\ Tamsyn\ 12
"set guifont=DejaVu\ Sans\ Mono\ 11
"set guifont=Cousine\ 10

set ul=10000
set tabstop=4
set softtabstop=4
set expandtab " Se sustituyen los tabuladores por espacios en blanco como recomiendan en python
set cursorline
set backspace=indent,eol,start

" Identación C/C++ después de {
set shiftwidth=4

" Esquema de colores oscuro
"colorscheme ir_black
colorscheme base16-ocean
"colorscheme soso
"colorscheme jellybeans

" No repintar al ejecutar macros
set lazyredraw

" Para que se vea airline
set laststatus=2
let g:airline_theme='dark'

" Para que funcione watchdog
set noswapfile

" Que no haga ruido la campanita y no parpadee al pulsar esc
autocmd VimEnter * set visualbell t_vb=

" Busqueda incremental y resaltado
set incsearch
set hlsearch

" Resaltar comprobación ( [
set showmatch

" Resaltado de sintaxis
syntax on

" No quiero menús, ni barra de herramientas
set guioptions-=T
set guioptions-=m

" Atributos del cursor, bloque sin parpadeo en modo normal
set guicursor=a:block-blinkon0-blinkoff0

" Tamaño inicial de la ventana
"au GUIEnter * winsize 100 40

" Redimensionar splits al redimensinar la ventana
au VimResized * :wincmd =

" Mapear CTRL+LeftArrow y CTRL+RightArrow para moverme entre pestañas
" Y ALT+1, ALT+2, etc para moverme como en el terminal
map <silent><C-Left> :tabprevious<CR>
map <silent><C-Right> :tabnext<CR>
map <silent> <S-Insert> "+p
imap <silent> <S-Insert> <Esc>"+pa
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt

"Move between windows using Ctrl + home row motion keys
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Alt + Up y Alt + Down para moverme entre diferencias
map  <silent><A-Down> ]c
map  <silent><A-Up> [c

" Con F3 se abre menú de selección de ficheros
map <F3> :browse tabnew<CR>

" Con F8 se abre TagList
map <F8> :TagbarToggle<CR>

" RopeGotoDefinition
map <C-c>g: call RopeGotoDefinition()

" Con F9 explorador de ficheros NERD
map <F9> :NERDTreeToggle<CR>

" Autoidentado, pero no identado C
set ai
set nocindent

" Sin backup
set nobackup

" Fichero de tags con algunas abreviaturas útiles
" Se supone un fichero llamado tags en la ruta raíz del proyecto
set tagrelative
set tags=tags

" Configuracion flake8 con neomake
"autocmd! BufWritePost,BufEnter * Neomake
"
"let g:neomake_python_flake8_maker = {
"    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
"    \ 'errorformat':
"        \ '%E%f:%l: could not compile,%-Z%p^,' .
"        \ '%A%f:%l:%c: %t%n %m,' .
"        \ '%A%f:%l: %t%n %m,' .
"        \ '%-G%.%#',
"    \ }
"let g:neomake_python_enabled_makers = ['flake8']
"
"let g:neomake_warning_sign = {
"  \ 'text': 'W',
"  \ 'texthl': 'WarningMsg',
"  \ }
"let g:neomake_error_sign = {
"  \ 'text': 'E',
"  \ 'texthl': 'ErrorMsg',
"  \ }

" Compilar con mingw
set makeprg=make

" Mantiene el cursor 4 lineas por arriba y por abajo del final para preservar el contexto
set scrolloff=4

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" fzf
" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

" syntastic
"let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': ['c', 'cpp'], 'passive_filetypes': ['python']}
" Desactivar búsqueda de includes para librerías especiales
"let g:syntastic_cpp_no_include_search = 1
" let g:syntastic_cpp_remove_include_errors = 1
" let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_cpp_gcc_exec = 'g++'
" let g:syntastic_cpp_include_dirs = ['/home/ang/proyectos/taricpy/core/include/module','/home/ang/proyectos/taricpy/core/include', '/home/ang/proyectos/taricpy/pywrap', '/home/ang/.wine/drive_c/Python27/include', '/usr/x86_64-w64-mingw32/include']
" let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
" let g:syntastic_check_on_open = 1
" let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_enable_signs = 1

" Load pylint code plugin
"let g:pymode_lint = 0

" Force python3 interpreter
let g:pymode_python = 'python3'

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = ["pyflakes"]
"pyflakes,pep8,mccabe"

" Check code every save
"let g:pymode_lint_write = 0

" Place error signs
"let g:ymode_lint_sings = 1

" Check code every save
"let g:pymode_lint_write = 0

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 0

" Ignorar mensajes informativos "Locally disabling"
"let g:pymode_lint_ignore = "I0011"

" Show error message if cursor placed at the error line
"let g:pymode_lint_message = 1

" Auto jump on first error
"let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
"let g:pymode_lint_hold = 0

" Place error signs
"let g:pymode_lint_signs = 1

" Maximum allowed mccabe complexity
"let g:pymode_lint_mccabe_complexity = 8

" Minimal height of pylint error window
"let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
"let g:pymode_lint_maxheight = 6

" Load rope plugin
let g:pymode_rope = 1

" No cargar desde el padre
let g:pymode_rope_lookup_project = 0

" No utilizar rope como autocomplete
let g:pymode_rope_completion = 0

" No autocompletar con punto
let g:pymode_rope_complete_on_dot = 0

" No regenerar cada vez que se salva
let g:pymode_rope_regenerate_on_write = 0

" Autocompletado extendido
let g:pymode_rope_autoimport = 0

" Disable python folding
let g:pymode_folding = 0

" indent
let g:pymode_indent = 4

" Desactivar documentacion de la palabra actual
let g:pymode_doc = 0

" Enable all python highlightings
let g:pymode_syntax_all = 1

let g:pymode_options_max_line_length = 100

" Activar virtualenv
let g:pymode_virtualenv = 1

" Configuración ctrlp
let g:ctrlp_by_filename = 0

" YouCompleteMe
" Cerrar preview al seleccionar
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_confirm_extra_conf=0
" let g:ycm_python_binary_path='/usr/bin/python'
" 
" let g:ycm_enable_diagnostic_signs = 1
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_always_populate_location_list = 1 "default 0
" 
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string

" Configuración de jedi
" let g:jedi#completions_enabled = 0
" let g:jedi#popup_select_first = 0

let g:jedi#use_splits_not_buffers = 'bottom'
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview

" Saltar a definicion con \g
" nnoremap <leader>g :YcmCompleter GoToImplementationElseDeclaration<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<a-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]

" Configuración de ale
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_args = '-m flake8'
let g:ale_python_flake8_options = '--max-line-length=100'

" Para que funcione gf en los imports
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Formato de ficheros dos
" set fileformat=dos

" Activacion automatica de pylint como compilador para fichero .py
autocmd FileType python compiler pylint
let g:pylint_onwrite=0 " No compilar cada vez que se salva, ya decido yo
"let g:pylint_cwindow = 0
let g:pylint_show_rate=0

" Numeros de línea
set nu

" Encoding utf-8
" set encoding=utf-8

" Para pyflakes
filetype on
filetype plugin on
let g:pyflakes_use_quickfix = 0

" Cabecera python
map <A-p> a#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR><CR>if __name__ == '__main__':<CR><Esc>

",c comments out a region
",u uncomments a region

" Diferencias en español
let g:DirDiffDynamicDiffText = 1

" Spell castellano
" setlocal spell spelllang=es

" Tamaño máximo de linea a 100
set textwidth=100

" Linea identificadora limite
set colorcolumn=+1

" Configuracion CtrlP DELEGO EN FZF
map <C-p> :Files<cr>

" set wildignore+=*.pyc,*.pyo,*.orig,*.check_cache,*.rule,*.gcov.*,*.func.*,*.func-sort*,*.gcno,*/htmlcov/*,*/gcc/*,*/build/*
" let g:ctrlp_by_filename = 1  " Buscar por fichero y no también por ruta
" let g:ctrlp_working_path_mode = 'ra'  " De directory of the current file
" 
" " Configuracion startify
" let g:ctrlp_reuse_window = 'startify' " don't split in startify
let g:startify_custom_header =
      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" Automatically remove preview window after autocomplete (mainly for clang_complete)
augroup RemovePreview
    autocmd!
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" Signify configuration. git and hg difftool
let g:signify_vcs_list = ['git']
"-------------------------------------------------------------
"								ANTIGUOS
"-------------------------------------------------------------
"highlight Type ctermfg=darkmagenta ctermbg=black  guifg=black gui=bold
"highlight String ctermfg=brown  ctermbg=black  guifg=LightMagenta
"" highlight Comment  term=NONE ctermbg=black ctermfg=DarkGreen guifg=DarkGreen guibg=LightGreen
"highlight pythonComment  term=NONE ctermbg=black ctermfg=LightGreen guifg=#00FF00 gui=bold
"highlight pythonComment  term=NONE ctermbg=black ctermfg=DarkGreen guifg=#007F00 guibg=#E8FFE8 gui=bold
"highlight Statement ctermfg=darkcyan  ctermbg=black  guifg=black  gui=bold
"highlight Conditional ctermfg=darkcyan ctermbg=black  guifg=black gui=bold
"highlight pythonPreCondit ctermfg=darkcyan ctermbg=black  guifg=black gui=bold
"highlight Repeat ctermfg=darkcyan ctermbg=black  guifg=black gui=bold
"highlight Format ctermfg=darkcyan ctermbg=black  guifg=black gui=bold
"highlight PreProc ctermfg=brown  ctermbg=black  guifg=DarkGreen
"highlight Include ctermfg=DarkGreen  ctermbg=black  guifg=DarkGreen
"highlight Macro ctermfg=darkcyan  ctermbg=black  guifg=darkcyan
"highlight Operator ctermfg=LightMagenta ctermbg=black  guifg=black gui=bold
"highlight Number ctermfg=LightMagenta ctermbg=black  guifg=red
"highlight Character ctermfg=LightMagenta ctermbg=black  guifg=Red
"highlight cOperator ctermfg=LightMagenta ctermbg=black  guifg=black gui=bold
"highlight Operadores ctermfg=LightMagenta ctermbg=black  guifg=black gui=bold
"highlight pythonOperator ctermfg=LightMagenta ctermbg=black  guifg=black gui=bold
"highlight cppBoolean ctermfg=darkcyan ctermbg=black  guifg=magenta gui=bold
"highlight shDeref ctermfg=darkcyan ctermbg=black  guifg=magenta gui=bold
"
"highlight Identifier cterm=NONE ctermfg=Red guifg=#40ffff
"highlight PreCondit cterm=NONE ctermfg=Cyan guifg=DarkGreen
"highlight Constant term=NONE ctermfg=darkGreen  guifg=Brown
"highlight Special   cterm=NONE ctermfg=Yellow guifg=DarkCyan
"highlight Function   cterm=NONE ctermfg=Yellow guifg=darkRed
"highlight pythonFunction   cterm=NONE ctermfg=Yellow guifg=Blue
"highlight pythonBuiltin cterm=NONE ctermfg=Yellow guifg=darkcyan gui=bold
"highlight pythonStatement cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight pythonException cterm=NONE ctermfg=Yellow guifg=darkcyan gui=bold
"highlight pythonClass cterm=NONE ctermfg=Yellow guifg=#0C8EDF gui=bold
"highlight LineNr guibg=#C0D0E0
"
"highlight Error guibg=grey guifg=Red gui=italic
"highlight xmlTag guifg=blue
"highlight Tag guifg=darkgreen
"highlight xmlTagName guifg=blue
"highlight xmlEndTag guifg=blue
"highlight xmlAttrib guifg=black
"highlight xsdElement guifg=Red
"
"" Particular para C y C++
"highlight cStatement cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cStorageClass cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight Structure cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cType cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cLabel cterm=NONE ctermfg=Yellow guifg=black gui=bold
"" highlight cComment cterm=NONE ctermfg=Yellow guifg=darkblue gui=italic
"" Comentarios estilo Python
"highlight cComment  term=NONE ctermbg=black ctermfg=DarkGreen guifg=#007F00 guibg=#E8FFE8 gui=italic
"highlight cppAccess cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cppExceptions cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cppStatement cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cppType cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cppCast cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight cppBoolean cterm=NONE ctermfg=Yellow guifg=black gui=bold
"
"let python_highlight_all = 1
"
"" Variables de shell con un color menos fuerte
"highlight Identifier ctermfg=DarkRed ctermbg=black guifg=Red
"
"" Especial para AutoIt
"highlight autoitComment  term=NONE ctermbg=black ctermfg=DarkGreen guifg=#007F00 guibg=#E8FFE8 gui=italic
"highlight autoitKeyword cterm=NONE ctermfg=Yellow guifg=black gui=bold
"highlight autoitFunction cterm=NONE ctermfg=Yellow guifg=DarkBlue gui=italic
"highlight autoitParen cterm=NONE ctermfg=Yellow guifg=black
"highlight autoitVariable cterm=NONE ctermfg=Yellow guifg=DarkRed
"highlight autoitVarSelector cterm=NONE ctermfg=Yellow guifg=DarkRed
"highlight autoitSend cterm=NONE ctermfg=Yellow guifg=LightMagenta
"highlight autoitNumber cterm=NONE ctermfg=Yellow guifg=Red
"" highlight autoitString cterm=NONE ctermfg=Yellow guifg=DarkMagenta
