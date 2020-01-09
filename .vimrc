  " pathogen
execute pathogen#infect()

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint']

" golang
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" other
set tabstop=2 expandtab
set shiftwidth=2
inoremap jk <ESC>
inoremap qw <C-n><Down>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
command W w
command Q q
so /usr/share/vim/vim74/autoload/css_color.vim

" completion options
:set completeopt=longest,menuone
:inoremap <expr> <TAB> pumvisible() ? "\<Down>" : "\<TAB>"
:inoremap <expr> <S-TAB> pumvisible() ? "\<Up>" : "\<TAB>"

autocmd FileType go map <F5> :! go run %<cr>
filetype plugin indent on
augroup filetype
 au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 au BufRead,BufNewFile *.cup    set filetype=cup
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim
au Syntax cup    so ~/.vim/syntax/cup.vim
