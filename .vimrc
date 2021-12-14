"
" ███████  █████  ██   ██      ██████  ███████ 
"  ██      ██   ██  ██ ██      ██    ██ ██      
"  █████   ███████   ███       ██    ██ ███████ 
"  ██      ██   ██  ██ ██      ██    ██      ██ 
"  ██      ██   ██ ██   ██      ██████  ███████ 

"----------------------------------------------
"----------------------------------------------
" Vim configuration file                     --
"                                            --
" FAX OS, 14/XII 2021, Moscow                --
"----------------------------------------------
"----------------------------------------------

set nocompatible              " be iMproved, required filetype off                  " required

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sainnhe/gruvbox-material'

call vundle#end()            " required
filetype plugin indent on    " required

" General
syntax enable
syntax on
set tabstop=4
set number
set shell=/bin/bash

set background=dark
colorscheme gruvbox-material 


" Haskell syntax highlighting

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


