" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Some basics:
"	set bg=light
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus
	set tabstop=4
	nnoremap c "_c
	set nocompatible
	filetype plugin indent on
	set encoding=utf-8
	set number
	set ruler
	syntax on
	set hidden

" Enable autocompletion:
	set wildmode=longest,list,full

" Previous / next buffer
	noremap <C-k> :bprevious<CR>
	noremap <C-j> :bnext<CR>
	map <C-S-t> :bp <BAR> bd #<CR>

" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	"let g:airline_left_sep = '>'
	"let g:airline_right_sep = '<'
	let g:airline_detect_modified = 1
	let g:airline_detect_paste = 1
	let g:airline_detect_crypt = 1
	let g:airline_theme = 'term'
	let g:airline_powerline_fonts = 1
	let g:airline_symbols_ascii = 1
	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Powerline
	set laststatus=2
	set t_Co=256

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler <c-r>%<CR>
	autocmd BufWritePost *.tex !compiler %

" Compile C file
	autocmd FileType c noremap <silent> <F8> :w<CR>:!clear;gcc<space>-Wall<space>-Wextra<space>-Werror % <CR>
	autocmd FileType c noremap <F9> :!clear; ./a.out  && echo "~>\n\n.vimrc 2.3-release Tilde Edition by Joe"<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
	autocmd FileType c noremap <F10> :!clear; ./a.out && echo "~>\n\n.vimrc 2.3-release Tilde Edition by Joe"<CR>
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
	autocmd FileType c nnoremap <Leader>M o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>printf("NOT<space>ENOUGH<space>ARGS\n");<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>Oprintf();<left><left>

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
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>cout<space><<<space>"NOT<space>ENOUGH<space>ARGS"<space><<<space>endl;<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>O

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

" CSS
	autocmd FileType css inoremap " ""<left>
	autocmd FileType css inoremap ' ''<left>
	autocmd FileType css inoremap ( ()<left>
	autocmd FileType css inoremap [ []<left>
	autocmd FileType css inoremap { {}<left>
	autocmd FileType css inoremap {<CR> {<CR>}<ESC>O


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

" .vimrc 2.3-release | Copyright Joe 2k19
