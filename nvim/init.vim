set nocompatible

" Load vim-plug
call plug#begin()
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-commentary'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'windwp/nvim-autopairs'
  Plug 'alexghergh/nvim-tmux-navigation'
call plug#end()

set number
set signcolumn=yes

" Map jk to Escape 
inoremap jk <ESC>
inoremap kj <ESC>

" Airline options
let g:airline#extensions#tabline#enabled = 1

" NerdTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Tmux keybinds
"nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
"nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
"nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
"nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
"nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
"nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>
