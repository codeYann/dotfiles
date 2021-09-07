" Specify a directory for plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" Themes, status line and other things relate to estetics
Plug 'bluz71/vim-moonfly-colors'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-startify'

" Git integration
Plug 'mhinz/vim-signify'

" Commenter
Plug 'preservim/nerdcommenter'

" Completions plugins and intellisense
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Initialize plugin system
call plug#end()

" Python CheckHealth
let g:python3_host_prog="/usr/bin/python3"

"Lightline configurations
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\ }

"Signify configurations
let g:signify_sign_change = '~'

"Nerd commenter" NERDcommenter 
filetype plugin indent on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = "left"
let g:NERDTreeWinPos = "left"
map cc <Plug>NERDCommenterInvert

