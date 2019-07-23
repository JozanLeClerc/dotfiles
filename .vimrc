let mapleader =","

"call plug#begin('~/.config/nvim/plugged')
"call plug#end()

execute pathogen#infect()
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

" Comfy
	inoremap " ""<left>
	inoremap ' ''<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap { {}<left>
	inoremap {<CR> {<CR>}<ESC>O
	inoremap {;<CR> {<CR>};<ESC>O
	inoremap < <><left>
	inoremap <? <?php  ?><left><left><left>
	inoremap <?<CR> <?php<CR>?><ESC>O
	inoremap <<space> <<space>
	inoremap << <<<space>
	inoremap ><space> ><space>
	inoremap >> >><space>
	inoremap "" ""
	inoremap '' ''
	inoremap () ()
	inoremap [] []
	inoremap {} {}
	inoremap <> <>
