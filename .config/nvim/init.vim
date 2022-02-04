syntax on

"enable blinking cursor
set guicursor=n-v-:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
set noshowmatch
"set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
"set scrolloff=8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'vim-scripts/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'wincent/terminus'
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-mix-format'
Plug 'airblade/vim-gitgutter'

" ctrl+D , ctrl+f
Plug 'psliwka/vim-smoothie'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Antlr
Plug 'dylon/vim-antlr'
call plug#end()


colorscheme gruvbox
"colorscheme badwolf
"colorscheme jellybeans

set background=dark

set showtabline=2
set laststatus=2

"let g:badwolf_darkgutter = 1





if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2

let g:netrw_banner = 0
let g:netrw_winsize = 30

let g:ctrlp_use_caching = 0
let g:rustfmt_autosave = 1
let g:vrfr_rg = 'true'

let g:undotree_SplitWidth = 50
let g:loaded_matchit = 1

"let mapleader = ","


autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> <leader>c :!cargo clippy <CR>
nnoremap <silent> <leader>r :!cargo run <CR>
nnoremap <silent> <leader>u :UndotreeToggle <CR>
nnoremap <silent> <leader>s :CtrlP <CR> 
nnoremap <silent> <leader>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)


"save format reload
"nnoremap <silent> <leader>s :w <CR> :!black % <CR><CR> <bar> :e <CR>



"map <C-u> :UndotreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"autocmd are executed in order they are defined
":autocmd BufWritePost *.py silent !black <afile> "format when save
":autocmd BufWritePost *.py :e "reload 


"
let g:ale_fixers = { 'elixir': ['mix_format'], 'python': ['yapf'] }
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:ale_fix_on_save = 1

au BufNewFile,BufRead *.py
    \ set expandtab       " replace tabs with spaces
    \ set autoindent      " copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4


function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}


let g:airline_theme='badwolf'
"let g:airline_powerline_fonts=1


" antlr
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
