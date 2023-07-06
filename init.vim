" Basic config

set nocompatible
set number relativenumber
set showmatch						" Show matching brackets
set linebreak						" Wrap lines around boundaries, not in the middle of the word
set wrap							" Enable line wrapping
set ignorecase						" Case insensitive search
set smartcase						" Combined with ignorecase the search will be case sensitive only if you use capitals
set clipboard+=unnamedplus			" Use system clipboard, I'll test it later
set tabstop=4						" Tab equ to 4 spaces
set history=200						" Commands history, self explanatory...
set spelllang=en_us
set termguicolors

" Optional mouse support

" if has('mouse')
"   if &term =~ 'xterm'
"     set mouse=a
"   else
"     set mouse=nvi
"   endif
" endif

" Basic styling

syntax on
set showcmd
set wildmenu
set ruler
set scrolloff=5						" If at the end or at the beginning of the screen, show 5 lines around cursor position
set termguicolors
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}

" Fonts and colors
" 
" Here we set relative number color to blue and current number color to red,
" also displaying comments in italics
highlight Comment cterm=italic
highlight LineNr ctermfg=Blue
highlight CursorLineNr ctermfg=Red
" Styling for spellchecker, works the same way
highlight SpellBad ctermbg=Red ctermfg=White

" Set keybindings

let mapleader=";"					" Set mapleader key to ';', this will allow us to create some fancy additional shortcuts
" ';+r' to replace strings
map <leader>r ddp				
" ';+d' to duplicate the string
map <leader>d yyp				
" This copies a line w/o a '\n'
map yil 0y$
" This turns spellchecker on
map <leader>c :setlocal spell!<CR>
" This resets the search
map <leader>/ :let @/=""<CR>	
" This toggles nerdtree
map <leader>n :NERDTreeToggle<CR>
" Make a tab
map <leader>t :tabe
" Toggle folds
map <leader>z za

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Add plugins

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ollykel/v-vim'
call plug#end()

" Customize themes

set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_ui_contrast = 'high'
colorscheme gruvbox-material

highlight LineNr ctermfg=Blue
highlight CursorLineNr ctermfg=Red
highlight SpellBad ctermbg=Red ctermfg=White

" OmniSharp
let g:OmniSharp_server_use_net6 = 1
