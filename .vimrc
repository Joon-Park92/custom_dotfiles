set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'jnurmine/Zenburn'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'nvie/vim-flake8'

Plugin 'exvim/ex-matchit'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'ervandew/supertab'
" Plugin 'lambdalisue/vim-pyenv'

call vundle#end()


"setttings
let mapleader=","
set hlsearch
set nu
set splitbelow
set splitright
set clipboard=unnamed
set term=screen-256color
set pastetoggle=<leader>2
nnoremap <leader>4 :nohl<CR> 

" move row unit
" noremap j gj
" noremap k gk

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" buffer setting
set hidden
" This allows buffers to be hidden if you've modified a buffer.
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bp \| bd #<CR>
nnoremap <leader>qq :q<CR>
nnoremap gt :bnext<CR>
nnoremap g<S-t> :bprevious<CR>


" enable folding
set foldmethod=indent
set foldlevel=99
"enable folding with the spacebar
nnoremap <space> za
"see the docstrings for folded code:
let g:SimpylFold_docstring_preview=0


"PEP 8 python indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix


"For fullstack developer
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent


au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set softtabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set shiftwidth=2
au BufNewFile,BufRead *.js,*.html,*.css set expandtab
au BufNewFile,BufRead *.js,*.html,*.css set autoindent


au BufNewFile,BufRead *.sh set tabstop=2
au BufNewFile,BufRead *.sh set softtabstop=2
au BufNewFile,BufRead *.sh set shiftwidth=2
au BufNewFile,BufRead *.sh set expandtab
au BufNewFile,BufRead *.sh set autoindent


"Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/


"utf-8 support
set encoding=utf-8

"Syntax Checking/Highlighting
syntax on
let python_highlight_all=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 1 " max error line
let g:syntastic_python_checkers = ['python']
" let g:syntastic_python_checkers = ['pylint']

" flake-8
" nnoremap <leader>c :so ~/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim<CR> \| :call flake8#Flake8()<CR>
nnoremap <leader>c :call flake8#Flake8()<CR>
nnoremap <leader>cc :call flake8#Flake8UnplaceMarkers()<CR>
let g:flake8_quickfix_height=4
let g:flake8_show_in_file=1   " show
let g:flake8_max_markers=500  " maximum # of markers to show(500 is default)

" colorscheme
set t_Co=256
silent! colorscheme zenburn


" NERDTree options
nmap <C-f> :NERDTreeFind<CR>
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree


" "SuperTab
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" SuperTab completion fall-back 
" let g:SuperTabMappingForward = '<c-space>'
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" let g:ycm_autoclose_preview_window_after_completion = 0


" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='simple'

" CtrlP options
"ignore redundant directiories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|__pycache__$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" YCM options
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<tab>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<s-tab>']
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '*>'
let g:ycm_python_binary_path = 'python'

" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['', '']
" let g:ycm_key_list_previous_completion = ['', '']

nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>n :YcmCompleter GoToReferences<CR>

" nnoremap <leader>g :tabnew \| YcmCompleter GoTo<CR>
" nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>p :YcmCompleter GetParent<CR>

" set conceallevel=2
" set concealcursor=vin
" let g:clang_snippets=1
" let g:clang_conceal_snippets=1
" " The single one that works with clang_complete
" let g:clang_snippets_engine='clang_complete'
" 
" " Complete options (disable preview scratch window, longest removed to aways
" " show menu)
" set completeopt=menu,menuone
" 
" " Limit popup menu height
" set pumheight=20

" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"
" let g:html_indent_inctags = "address,article,aside,audio,blockquote,canvas,dd,div,dl,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,hr,main,nav,noscript,ol,output,p,pre,section,table,tfoot,ul,video"
