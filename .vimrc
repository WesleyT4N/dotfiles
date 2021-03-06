" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'mhinz/vim-sayonara'
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular', { 'for': ['tex', 'markdown'] }
Plug 'neoclide/jsonc.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Yggdroot/indentLine'
Plug 'honza/vim-snippets'
call plug#end()


" general settings
colorscheme one
set showtabline=4
if has('gui_running')
    set guioptions=
    set guifont=Iosevka\ Custom\ Nerd\ Font\ Mono:h16
endif
set mouse=a
set termguicolors
set linespace=0
set incsearch
set path=$PWD/**
set wildmenu
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=100
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set noswapfile
set ignorecase
set smartcase
set splitbelow
set splitright
set clipboard=unnamed
set list listchars=tab:→\ ,trail:·
set hlsearch
set nolazyredraw
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> <Leader><Leader> :e#<CR>
vnoremap <Leader>y "+y
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
set number relativenumber
set noshowmode
set background=light
set ttyfast
set laststatus=2
set foldmethod=indent
set foldlevel=99
nmap <Leader>t :enew<CR>
nmap <silent> <Leader>` :10Term<CR>
tnoremap <Esc> <C-\><C-n>
set conceallevel=2
set concealcursor=niv
set shortmess+=c
autocmd BufWritePre * %s/\s\+$//e

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Filetype settings
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c set tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ fileformat=unix
            \ colorcolumn=81

au BufNewFile,BufRead *.html,*.php set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2

au BufReadPost,BufNewFile *.js set filetype=javascript.jsx
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ colorcolumn=120

au BufNewFile,BufRead *.gql.js set filetype=graphql
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4

au BufNewFile,BufRead *.tex set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ colorcolumn=81
            \ textwidth=80

autocmd Filetype markdown setlocal tabstop=2
            \ softtabstop=4
            \ shiftwidth=4
            \ colorcolumn=81
            \ textwidth=80
            \ spell spelllang=en_us

autocmd Filetype python setlocal tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ fileformat=unix
            \ colorcolumn=81

" Indent shortcuts
" for command mode
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-d>
" for insert mode
nnoremap <Tab> >>
vnoremap <Tab> >gv
:vnoremap < <gv
:vnoremap > >gv

" Lightline
function! CocStatus()
  if winwidth(0) < 100
    return ''
  endif
  return coc#status()
endfunction


let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename' ] ],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'filename': 'LightlineFilename',
            \   'cocstatus': 'CocStatus',
            \ },
            \ }

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#unnamed      = '[Unnamed]'
let g:lightline#bufferline#number_map = {
\ 0: '0 ', 1: '1 ', 2: '2 ', 3: '3 ', 4: '4 ',
\ 5: '5 ', 6: '6 ', 7: '7 ', 8: '8 ', 9: '9 '}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[Unnamed]'
    let modified = &modified ? ' +' : ''
    return WebDevIconsGetFileTypeSymbol() . ' ' . filename . modified
endfunction


" NERDTree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeShowLineNumbers = 1
let NERDTreeNaturalSort = 1
nmap <silent> <leader>\ :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
autocmd BufEnter NERD_tree* :LeadingSpaceDisable

" Buffer related settings
nnoremap <silent> <Leader>k :bnext<CR>
nnoremap <silent> <Leader>j :bprev<CR>
nmap <Leader>w :Sayonara!<CR>
nmap <Leader>q :Sayonara<CR>
nnoremap <Leader>W :%bd\|e#\|bd#<CR>

" Tab movement
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" Integrated terminal colors
let g:terminal_color_0  = "#000000"
let g:terminal_color_8  = "#000000"
let g:terminal_color_1  = "#d51e1d"
let g:terminal_color_9  = "#d51e1d"
let g:terminal_color_2  = "#008923"
let g:terminal_color_10 = "#008923"
let g:terminal_color_3  = "#aa8800"
let g:terminal_color_11 = "#aa8800"
let g:terminal_color_4  = "#1561dc"
let g:terminal_color_12 = "#1561dc"
let g:terminal_color_5  = "#be2ec7"
let g:terminal_color_13 = "#be2ec7"
let g:terminal_color_6  = "#008661"
let g:terminal_color_14 = "#008661"
let g:terminal_color_7  = "#f9faf9"
let g:terminal_color_15 = "#f9faf9"


" Vim Polyglot
let g:polyglot_disabled = ['latex']

" Vimtex
let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:tex_conceal = ""
let g:vimtex_syntax_enabled = 1
let g:tex_flavor = 'latex'

" Fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['bg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['bg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>P :Ag<CR>

" Coc
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType jsonc syntax match Comment +\/\/.\+$+
autocmd FileType json set filetype=jsonc

"Autocomplete controls
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_status_error_sign = "! "
let g:coc_status_warning_sign = "⚠  "

set updatetime=300
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call <SID>show_documentation()<CR>

hi CocHighlightText guibg=#dddddd

autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Show commands
nnoremap <leader>c  :<C-u>CocList commands<cr>


" vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1

let g:pandoc#syntax#conceal#use = 0
let g:mkdp_auto_close = 0

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END



" vim-IndentLine
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '│'
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ["nerdtree"]
let g:indentLine_bufNameExclude = ['_.', 'NERD_tree.']

" vim-tagbar
nnoremap <silent> <leader>/ :TagbarToggle<CR>

highlight TagbarSignature guifg=Gray ctermfg=Gray
let g:tagbar_sort = 0
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Git guetter

" Faster updatetime so that GitGutter can update instantly
set updatetime=100

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
