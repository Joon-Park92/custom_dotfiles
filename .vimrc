set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Plugin 'lambdalisue/vim-pyenv'
Plugin 'ervandew/supertab'
Plugin 'exvim/ex-matchit'
Plugin 'tpope/vim-surround'

call vundle#end()


"setttings
let mapleader=","
set hlsearch
set nu
set splitbelow
set splitright
set clipboard=unnamed
set term=screen-256color


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
"See the docstrings for folded code:
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


"Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/


"utf-8 support
set encoding=utf-8


"Syntax Checking/Highlighting
let python_highlight_all=1
syntax on


set t_Co=256
silent! colorscheme zenburn


"File browsing
nmap <C-F> :NERDTreeFind<CR>
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree


"SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


"ignore redundant directiories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['', '']
" let g:ycm_key_list_previous_completion = ['', '']
" let g:ycm_warning_symbol = '>*'

" nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap gg :YcmCompleter GoToImprecise<CR>
" nnoremap <leader>d :YcmCompleter GoToDeclaration
" nnoremap <leader>d :vsplit \| YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :tab split \| YcmCompleter GoToDefinition<CR>
nnoremap K :YcmCompleter GetDoc<CR>
" nnoremap t :YcmCompleter GetType
" nnoremap p :YcmCompleter GetParent 

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
" 
" " SuperTab completion fall-back 
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" let g:ycm_autoclose_preview_window_after_completion = 0
