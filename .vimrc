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
	autocmd FileType c inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType c inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType c nnoremap <Leader>M i<CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O

" C++
	autocmd FileType cpp inoremap " ""<left>
	autocmd FileType cpp inoremap ' ''<left>
	autocmd FileType cpp inoremap ( ()<left>
	autocmd FileType cpp inoremap [ []<left>
	autocmd FileType cpp inoremap { {}<left>
	autocmd FileType cpp inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType cpp inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType cpp inoremap <<space> <<space>
	autocmd FileType cpp inoremap << <<<space>
	autocmd FileType cpp inoremap ><space> ><space>
	autocmd FileType cpp inoremap >> >><space>
	autocmd FileType cpp nnoremap <Leader>M i<CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O

" = Web =
" HTML
	autocmd FileType html inoremap " ""<left>
	autocmd FileType html inoremap ' ''<left>
	autocmd FileType html inoremap ( ()<left>
	autocmd FileType html inoremap [ []<left>
	autocmd FileType html inoremap { {}<left>
	autocmd FileType html inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType html inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType html inoremap < <><left>

" PHP
	autocmd FileType php inoremap " ""<left>
	autocmd FileType php inoremap ' ''<left>
	autocmd FileType php inoremap ( ()<left>
	autocmd FileType php inoremap [ []<left>
	autocmd FileType php inoremap { {}<left>
	autocmd FileType php inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType php inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType php inoremap < <><left>
	autocmd FileType php inoremap <? <?php  ?><left><left><left>
	autocmd FileType php inoremap <?<CR> <?php<CR>?><ESC>O

" Just in case
	inoremap "" ""
	inoremap '' ''
	inoremap () ()
	inoremap [] []
	inoremap {} {}
	inoremap <> <>
