set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
execute pathogen#infect()
filetype plugin indent on
filetype indent on
set shiftwidth=2
" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
set number
" make Esc happen without waiting for timeoutlen
syntax on
" " fixes Powerline delay
augroup FastEscape
   autocmd!
     au InsertEnter * set timeoutlen=0
       au InsertLeave * set timeoutlen=1000
       augroup END
let g:airline_powerline_fonts = 1
set tabstop=4
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-\> :NERDTreeToggle .
set guifont=DejaVu\ Sans\ Mono\ 10
set antialias
set incsearch
set hlsearch 
