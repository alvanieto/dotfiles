call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'w0rp/ale'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

" Para auto-import python
Plug 'ludovicchabant/vim-gutentags'

Plug 'psf/black', { 'branch': 'stable' }
Plug 'mtdl9/vim-log-highlighting'

" Typescript & Javascript
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'prettier/prettier'

" Vue
" Plug 'posva/vim-vue'

" Elixir
" Plug 'neovim/nvim-lspconfig'
" Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" Plug 'elixir-lsp/elixir-ls'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhanberg/elixir.nvim'

" Quicklist / LocationList
Plug 'Valloric/ListToggle'
"Plug 'majutsushi/tagbar'

" Ansible
Plug 'pearofducks/ansible-vim'

" Syntax for many languages
Plug 'sheerun/vim-polyglot'

" nim
Plug 'zah/nim.vim'

call plug#end()

" Ack config
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'rg --vimgrep'
noremap <Leader>a :Ack <cword><cr>

" Fix autoread
set autoread
au FocusGained * :checktime

" ListTogle
let g:lt_quickfix_list_toggle_map = '<F2>'
let g:lt_location_list_toggle_map = '<F3>'

" Tagbar
nmap <F8> :TagbarToggle<CR>

let g:deoplete#enable_at_startup = 1

set laststatus=2
let g:airline_theme='dark'

set noshowmode
set noruler
set showcmd
set laststatus=0

"colorscheme base16-ocean
" colorscheme base16-material-darker
" colorscheme base16-tomorrow-night                                                                  
" colorscheme base16-onedark                                                                          
" colorscheme base16-google-dark
colorscheme base16-default-dark

"colorscheme onedark
set termguicolors

set ul=10000
set tabstop=4
set softtabstop=4
set expandtab " Se sustituyen los tabuladores por espacios en blanco como recomiendan en python
set cursorline
set backspace=indent,eol,start
set textwidth=120
set colorcolumn=+1
set number
set incsearch
set hlsearch
set showmatch
set shiftwidth=4
set noswapfile

"execute "set <M-1>=\e1"
"nnoremap <M-1> 1
"execute "set <M-2>=\e2"
"nnoremap <M-2> 2
"execute "set <M-3>=\e3"
"nnoremap <M-3> 3
"execute "set <M-4>=\e4"
"nnoremap <M-4> 4
"execute "set <M-5>=\e5"
"nnoremap <M-5> 5

" gutentag configuration
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/ang/.vimignore'"

" Mapear CTRL+LeftArrow y CTRL+RightArrow para moverme entre pestañas
" Y ALT+1, ALT+2, etc para moverme como en el terminal
map <silent><C-Left> :tabprevious<CR>
map <silent><C-Right> :tabnext<CR>
map <silent> <S-Insert> "+p
imap <silent> <S-Insert> <Esc>"+pa
" noremap <A-1> 1gt
" noremap <A-2> 2gt
" noremap <A-3> 3gt
" noremap <A-4> 4gt
" noremap <A-5> 5gt
" noremap <A-6> 6gt
" noremap <A-7> 7gt
" noremap <A-8> 8gt
nnoremap <leader>1 1gt 
nnoremap <leader>2 2gt 
nnoremap <leader>3 3gt 
nnoremap <leader>4 4gt 
nnoremap <leader>5 5gt 
nnoremap <leader>6 6gt 
nnoremap <leader>7 7gt 
nnoremap <leader>8 8gt 
nnoremap <leader>9 9gt
set scrolloff=4

" Open terminal, 10 lines height
map <F12> :belowright 10split term://bash <CR>

" To exit terminal-mode
tnoremap <A-x> <C-\><C-n>

" fzf
" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

" Redimensionar splits al redimensinar la ventana
au VimResized * :wincmd =

"map <C-p> :GonvimFuzzyFiles<cr>
map <C-p> :Files<cr>

" type ,p to insert breakpoint. ^[ is at the end.  Insert with ctrl v and then esc
" (the github web gui doesn't display control characters, but it is there)
nnoremap <A-p> Oimport ipdb;ipdb.set_trace()<esc>

" Force python3 interpreter
let g:pymode_python = 'python3'

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
"
"
let g:pymode_lint = 0
let g:pymode_lint_checker = ["pyflakes"]

let g:pymode_lint_cwindow= 0
" Configuración python-mode
let g:pymode_options_max_line_length = 120

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
let g:pymode_rope_autoimport = 1

let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'rest_framework']

let g:pymode_rope_autoimport_import_after_complete = 1

" Disable python folding
let g:pymode_folding = 0

" indent
let g:pymode_indent = 4

" Desactivar documentacion de la palabra actual
let g:pymode_doc = 0

" Enable all python highlightings
let g:pymode_syntax_all = 1

let g:pymode_virtualenv = 1

let g:jedi#use_splits_not_buffers = 'bottom'
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview

" Configuración ctrlp
let g:ctrlp_by_filename = 0

" Configuración de ale
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters.elixir = ['credo', 'elixir-ls']
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_fixers.elixir = ['mix_format']
" let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
" let g:ale_python_flake8_args = '-m flake8'
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_flake8_use_global = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:ale_elixir_elixir_ls_release='/home/ang/utils/elixir-ls/rel'

augroup elixir
  nnoremap <leader>r :! elixir %<cr>
  autocmd FileType elixir,eelixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Activacion automatica de pylint como compilador para fichero .py
autocmd FileType python compiler pylint
let g:pylint_onwrite=0 " No compilar cada vez que se salva, ya decido yo
"let g:pylint_cwindow = 0
let g:pylint_show_rate=0

" prettier con ALE
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}
" 
" let g:prettier#config#print_width = 100
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#prose_wrap = 'never'

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" Para pyflakes
filetype on
filetype plugin on

let g:pyflakes_use_quickfix = 0   

" Automatically remove preview window after autocomplete (mainly for clang_complete)                        
augroup RemovePreview
	autocmd!
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" Copy settings

set ttyfast                    " Allow for faster redrawing
set lazyredraw                 " Avoid sticky cursor and slow scrolling
set showmatch                  " Show matching parenthesis
set title                      " Set terminal title to filename
set visualbell                 " please DONT BEEP
set noerrorbells               " please DONT BEEP

"" Temporary files
" set backup
" set backupdir=$HOME/.config/nvim/files/backup/
" set backupext =-vimbackup
" set backupskip =
" set directory =$HOME/.config/nvim/files/swap/
set updatecount=100
set undofile
set undodir=$HOME/.config/nvim/files/undo/
if has('nvim')
    set viminfo='100,n$HOME/.config/.nvim/files/info/nviminfo
else
    set viminfo='100,n$HOME/.config/.nvim/files/info/viminfo
end

" Elixir config
