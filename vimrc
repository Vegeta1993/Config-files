set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

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
