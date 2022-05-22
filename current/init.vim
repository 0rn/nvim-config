" nvim configuration script, install plug first
set nocp
syntax enable
" has to be set after plug
"color kanagawa "murphy
set nu rnu
set colorcolumn=80

set tabstop=4
set autoindent
set smartindent
set shiftwidth=4
set expandtab

set shell=/bin/fish

set list
set listchars=""            " Reset the listchars
set listchars=tab:›\        " show tabs as lsaquos
set listchars+=trail:·      " show trailing spaces as dots
set listchars+=nbsp:·       " show trailing non-breaking-spaces as dots
set listchars+=extends:❯    " The character in the last column when the line continues right
set listchars+=precedes:❮   " The character in the first column when the line continues left


" {{{ Search settings
set hlsearch    " highlight matches
set incsearch   " incremental searching
set inccommand= " incremental everything
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set gdefault    " by default, replace globally (you can ommit /g at the end of a search-and-replace
" }}}

set backspace=indent,eol,start
set mouse=a

nnoremap H h
nnoremap L l

" term config
" press escape in term mode to go to normal mode
tnoremap <Esc> <C-\><C-n>
" auto enter term mode when opening terminal
autocmd TermOpen * startinsert

" Windows like bindings, also like micro
noremap <C-q> :q!<CR>
"nnoremap <C-w> :w!<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-x> c<CR>
" control tabs
nnoremap <C-n> :tabnew<CR>
nnoremap <C-t> :tabn<CR>


au BufWrite,BufwritePost ~/.config/nvim/init.vim :source ~/.config/nvim/init.vim
" run, build and templates

" File specific run on F5
" %:r inserts path and file name (not extension), %:t is with extenstion
autocmd BufRead *.cpp map <F5> :term g++ -Wall -Werror -std=c++14 -O -o %:r.out %:t; ./%:r.out

autocmd BufNewFile *.cpp :read ~/Templates/cpp
autocmd BufNewFile *.h :read ~/Templates/h

augroup templates
    autocmd BufNewFile *.cpp 0r ~/Templates/cpp
    autocmd BufNewFile *.h 0r ~/Templates/h
augroup END

" PLUGINS
call plug#begin()
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'alaviss/nim.nvim'
Plug 'dense-analysis/ale'
Plug 'bfrg/vim-cpp-modern'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/which-key.nvim'
Plug 'L3MON4D3/LuaSnip'
call plug#end()

colorscheme kanagawa


" Autocomplete config

function s:completor(opt, ctx)
  call nim#suggest#sug#GetAllCandidates({startcol, candidates -> asyncomplete#complete(a:opt['name'], a:ctx, startcol, candidates) })
endfunction

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'allowlist': ['nim'],
    \ 'completor': function('s:completor'),
    \ })

"au User asyncomplete_setup call asyncomplete#register_source({
"    \ 'name': 'nim',
"    \ 'whitelist': ['nim'],
"    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
"    \ })

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

"auto close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" ALE config
let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\   'cpp': ['g++',],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\}
"C++ ALE config
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }

let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" Put highlight changes after colorscheme
"hi ALEErrorSign cterm=underline ctermbg=NONE ctermfg=NONE guifg=red
"hi ALEWarningSign cterm=NONE ctermbg=NONE guifg=yellow
" hi SpellBad cterm=underline ctermfg=red ctermbg=none
" hi SpellCap cterm=none ctermfg=magenta ctermbg=none
"hi ALEError cterm=underline ctermfg=none ctermbg=none
" What is this?
"hi Error cterm=none ctermfg=blue ctermbg=none
