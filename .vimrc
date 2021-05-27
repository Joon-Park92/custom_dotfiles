set nocompatible              " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" basic
Plugin 'jnurmine/Zenburn'
Plugin 'preservim/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Yggdroot/indentLine'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/tagbar'

" python
Plugin 'fisadev/vim-isort'

" vcs 
Plugin 'tpope/vim-fugitive'
Plugin 'vim-gitgutter'

Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'plasticboy/vim-markdown'

" wed-developer
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" go / kotlin
" Plugin 'fatih/vim-go'
Plugin 'udalov/kotlin-vim'

call vundle#end()


" basic setttings
let mapleader=","
set hlsearch
set nu rnu
set splitbelow
set splitright
" set nowrap
" set linebreak
set clipboard=unnamed
set term=screen-256color
set encoding=utf-8
set backspace=indent,eol,start

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
" nnoremap <leader>q :bp \| bd #<CR>
nnoremap <leader>q <C-W>c
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
" nnoremap gt :bnext<CR>
" nnoremap g<S-t> :bprevious<CR>
set pastetoggle=<F2>


" enable folding
set foldmethod=indent
set foldlevel=99
"see the docstrings for folded code:
let g:SimpylFold_docstring_preview=0
"enable folding with the spacebar
nnoremap <space> za

" indentation
let g:indentLine_color_term = 245
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <leader>3 :IndentLinesToggle<CR>

"For fullstack developer
set expandtab

au FileType c,cpp,sql,java setlocal shiftwidth=4 softtabstop=4 cindent
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 autoindent fileformat=unix
au FileType javascript,css,json setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent
au FileType yaml setlocal ts=2 sts=2 sw=2

au BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent
au BufNewFile,BufRead *.sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent
au BufNewFile,BufRead Jenkinsfile setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent

au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead *.kt,*kts setf kotlin

" mlflow setting
au BufNewFile,BufRead MLproject setf yaml

"Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

"Syntax Checking/Highlighting
syntax on
let python_highlight_all=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " 1 auto open
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 1 " max error line
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_aggregate_errors = 1

nnoremap ]q :lnext<CR>
nnoremap [q :lprev<CR>

" colorscheme
" set t_Co=256
silent! colorscheme zenburn

" NERDTree options
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yaml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" key binding
nmap <C-f> :NERDTreeFind<CR>
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] 

" "SuperTab
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" SuperTab completion fall-back 
" let g:SuperTabMappingForward = '<c-space>'
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" let g:ycm_autoclose_preview_window_after_completion = 0


" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'r'
"
"ignore redundant directiories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.csv,*.sqlite3
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|__pycache__$\|data$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>

" YCM options
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<tab>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<s-tab>']
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '*>'
let g:ycm_python_binary_path = 'python'

" LSP servers
let s:lsp = '~/.vim/lsp-examples'
let g:ycm_language_server = [
  \   {
  \     'name': 'bash',
  \     'cmdline': [ 'node', expand( s:lsp . '/bash/node_modules/.bin/bash-language-server' ), 'start' ],
  \     'filetypes': [ 'sh', 'bash' ],
  \   },
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ 'node', expand( s:lsp . '/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
  \     'filetypes': [ 'yaml' ],
  \   },
  \   {
  \     'name': 'json',
  \     'cmdline': [ 'node', expand( s:lsp . '/json/node_modules/.bin/vscode-json-languageserver' ), '--stdio' ],
  \     'filetypes': [ 'json' ],
  \   },
  \   {
  \     'name': 'kotlin',
  \     'filetypes': [ 'kotlin' ], 
  \     'cmdline': [ expand( s:lsp . '/kotlin/server/build/install/server/bin/kotlin-language-server' ) ],
  \   },
  \   {
  \     'name': 'docker',
  \     'filetypes': [ 'dockerfile' ],
  \     'cmdline': [ expand( s:lsp . '/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
  \   },
  \   {
  \     'name': 'vim',
  \     'filetypes': [ 'vim' ],
  \     'cmdline': [ expand( s:lsp . '/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
  \   },
  \ ]

" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['', '']
" let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_goto_buffer_command = 'split-or-existing-window'
nnoremap <leader>d :rightbelow vertical YcmCompleter GoTo<CR>
" nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>n :YcmCompleter GoToReferences<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 

" nnoremap <leader>g :tabnew \| YcmCompleter GoTo<CR>
" nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>p :YcmCompleter GetParent<CR>

" emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0

au FileType html,css EmmetInstall

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
nnoremap <Leader>a :Ack!<Space>
filetype plugin indent on

" Airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme='dark'


" gitgutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" vim-ack silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ackhighlight = 1
let g:ack_autofold_results = 1

" formatters
let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

noremap <F3> :Autoformat<CR>
let g:formatters_python = ['black']

" tagbar
let g:tagbar_width = 60
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
nmap <F8> :TagbarToggle<CR>
nmap <C-m> :TagbarToggle<CR>
