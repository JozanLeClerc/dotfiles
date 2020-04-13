" .vimrc 3.1 by Joe

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdcommenter'
call plug#end()

let mapleader=","

" Some basics:
	"set bg=light
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	nnoremap c "_c
	set nocompatible
	filetype plugin indent on
	set encoding=utf-8
	set number
	set ruler
	syntax on
	set hidden

" Nerdtree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable autocompletion:
	set wildmode=longest,list,full

" Some quick bindings
	noremap <C-x>g :G<CR>
	noremap <A-;> :call NERDComment(0,"toggle")<CR>
	noremap <silent> <A-k> :bprevious<CR>
	noremap <silent> <A-j> :bnext<CR>
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
	noremap <C-o> <C-w>o
	noremap <C-x>0 <C-w>q
	noremap <C-x><C-f> :e<space>
	noremap <silent> <leader>w :w <BAR> :bp <BAR> :bd #<CR>
	noremap <silent> <C-x>k :w <BAR> :bp <BAR> :bd #<CR>

" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_detect_modified = 1
	let g:airline_detect_paste = 1
	let g:airline_detect_crypt = 1
	let g:airline_theme = 'term'
	let g:airline_powerline_fonts = 1
	let g:airline_symbols_ascii = 1
	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Rainbow
	let g:rainbow_active = 1

" NERD Commenter
	let g:NERDSpaceDelims = 1
	let g:NERDCompactSexyComs = 1
	let g:NERDDefaultAlign = 'left'
	let g:NERDAltDelims_java = 1
	let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
	let g:NERDCommentEmptyLines = 1
	let g:NERDTrimTrailingWhitespace = 1
	let g:NERDToggleCheckAllLines = 1

" Cursor mode
	let g:airline#extensions#cursormode#enabled = 1
	let g:cursormode_color_map = {
	\	"i": 		"#7da9c7",
	\	"n": 		"#eac179",
	\	"R": 		"#bb5653",
	\	"r": 		"#bb5653",
	\	"v": 		"#b06597",
	\	"V": 		"#b06597",
	\	"\<C-V>":	"#b06597",
	\}

" 10 buffers jump
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	noremap <F1> :sp<CR><C-w>j:term<CR>:resize -10<CR>i
	noremap <F2> :NERDTreeToggle<CR>
	noremap <C-u> :UndotreeToggle<CR>
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9
	nmap <leader>0 <Plug>AirlineSelectTab10

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
	autocmd FileType * noremap <F5> :w<CR> :!clear<CR> :!make -j5 ASAN=1<CR>
	autocmd FileType * noremap <F6> :w<CR> :!clear<CR> :!./a.out; ret=$?; echo "~>"; if [ $ret -ne 0 ]; then echo -n "$ret"; if [ $ret -eq 127 ]; then echo " - Missing a.out"; exit; elif [ $ret -eq 134 ]; then echo " - Abort\!"; elif [ $ret -eq 138 ]; then echo " - Bus error\!"; elif [ $ret -eq 139 ]; then echo " - Segmentation fault\!"; fi; fi; echo "\n\n.vimrc v3.0 Tilde Edition by Joe"<CR>
" === Comfy ===
" C
	autocmd FileType c nnoremap <Leader>m o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType c nnoremap <Leader>M o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>printf("NOT<space>ENOUGH<space>ARGS\n");<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>Oprintf();<left><left>

" C++
	autocmd FileType cpp nnoremap <Leader>m oint<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<CR>return<space>0;<CR>if<space>(argv[])<space>{}<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>cout<space><<<space>"NOT<space>ENOUGH<space>ARGS"<space><<<space>endl;<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>O

" .vimrc 3.1 by Joe
