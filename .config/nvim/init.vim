call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-startify'
call plug#end()

let g:coc_global_extensions = [
            \ 'coc-lists',
            \ 'coc-explorer',
            \ 'coc-yank',
            \ 'coc-git',
            \ 'coc-translator',
            \ 'coc-json',
            \ 'coc-cmake',
            \ ]

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'

" automatically open quickfix window when AsyncRun command is executed
let g:asyncrun_open = 8

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set colorcolumn=80
set number
set relativenumber
set signcolumn=yes
colorscheme gruvbox

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

let mapleader = ' '

inoremap jk <Esc>
cnoremap jk <C-c>
nnoremap <silent> <leader>w :update<cr>
nnoremap <silent> <leader>q :quit<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>e :CocCommand explorer<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " JSON file get correct comment highlighting
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup end

nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv

nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>

nnoremap <silent> <leader>v :Vista!!<cr>

" toggle quickfix window
nnoremap <silent> <leader>cj :call asyncrun#quickfix_toggle(8)<cr>

nnoremap <leader>cc :AsyncRun<space>
nnoremap <leader>cx :AsyncStop<cr>

function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" NOTE
" compile_commands.json
" -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
" ctrl-t, ctrl-d - indent current line forward, backwards (insert mode)
" ctrl-o - go to older position in jump list
