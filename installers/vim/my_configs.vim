let NERDTreeShowHidden=1

set clipboard=unnamed

set number
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Shougo/neocomplete'
Plug 'autoclose'
Plug 'Konfekt/FastFold'
Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim'
Plug 'nikvdp/ejs-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-obsession'
Plug 'editorconfig/editorconfig-vim'
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'


" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" let vim-jsx plugin handle .js files too
let g:jsx_ext_required = 0

" Vim indentLine color for indentLine plugin
let g:indentLine_color_term = 239


"enable neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion via neocomplete.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" more key remaps
    map <Right> :NERDTreeToggle<cr>
    map <C-p> :PeepOpen<cr>
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Map jj to Esc
    :imap jj <Esc>
    " Map leader plus p to paste into new line
:nmap <Leader>p :pu<CR>

" Map ; to : (hate typing shift first)
    nnoremap ; :

    "Function to show higlight group
    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
          \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
          \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Set default color scheme to that 'morning'
colorscheme ir_black 


function! ToggleColorScheme()
  if &background == "dark"
    set background="light"
    echom "now light"
  else
    set background="dark"
    echom "now dark"
  endif
endfunction


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let b:syntastic_javascript_checkers=['eslint']
