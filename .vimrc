let mapleader =","

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin indent on
	syntax on
	set encoding=utf-8
	set number

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Powerline
	set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
	set laststatus=2
	set t_Co=256

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler <c-r>%<CR>
	autocmd BufWritePost *.tex !compiler %
	
" === Comfy ===
" C
	autocmd FileType c inoremap " ""<left>
	autocmd FileType c inoremap ' ''<left>
	autocmd FileType c inoremap ( ()<left>
	autocmd FileType c inoremap [ []<left>
	autocmd FileType c inoremap { {}<left>
	autocmd FileType c inoremap < <><left>
	autocmd FileType c inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType c inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType c inoremap <<space> <<space>
	autocmd FileType c inoremap ><space> ><space>
	autocmd FileType c inoremap <= <=
	autocmd FileType c nnoremap <Leader>m o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType c nnoremap <Leader>M o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<CR>return<space>0;<CR>if<space>(argv[])<space>{}<CR>return<space>0;<CR>}<up><ESC>O

" C++
	autocmd FileType cpp inoremap " ""<left>
	autocmd FileType cpp inoremap ' ''<left>
	autocmd FileType cpp inoremap ( ()<left>
	autocmd FileType cpp inoremap [ []<left>
	autocmd FileType cpp inoremap { {}<left>
	autocmd FileType cpp inoremap < <><left>
	autocmd FileType cpp inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType cpp inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType cpp inoremap <<space> <<space>
	autocmd FileType cpp inoremap << <<<space>
	autocmd FileType cpp inoremap ><space> ><space>
	autocmd FileType cpp inoremap >> >><space>
	autocmd FileType cpp inoremap <= <=
	autocmd FileType cpp nnoremap <Leader>m oint<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<CR>return<space>0;<CR>if<space>(argv[])<space>{}<CR>return<space>0;<CR>}<up><ESC>O

" = Web =
" HTML
	autocmd FileType html inoremap " ""<left>
	autocmd FileType html inoremap ' ''<left>
	autocmd FileType html inoremap ( ()<left>
	autocmd FileType html inoremap [ []<left>
	autocmd FileType html inoremap { {}<left>
	autocmd FileType html inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType html inoremap < <><left>

" PHP
	autocmd FileType php inoremap " ""<left>
	autocmd FileType php inoremap ' ''<left>
	autocmd FileType php inoremap ( ()<left>
	autocmd FileType php inoremap [ []<left>
	autocmd FileType php inoremap { {}<left>
	autocmd FileType php inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType php inoremap < <><left>
	autocmd FileType php inoremap <? <?php  ?><left><left><left>
	autocmd FileType php inoremap <?<CR> <?php<CR>?><ESC>O

" Just in case
	inoremap " ""<left>
	inoremap ' ''<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap { {}<left>
	inoremap "" ""
	inoremap '' ''
	inoremap () ()
	inoremap [] []
	inoremap {} {}
	inoremap <> <>
