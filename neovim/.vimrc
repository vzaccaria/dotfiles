let g:mapleader = "\<Space>"

call plug#begin() 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'jceb/vim-orgmode'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'lervag/vimtex'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
call plug#end()

nnoremap <silent> <C-x><C-f> :FZF -m<cr>
nnoremap <silent> <M-u> :History<cr>
nnoremap <silent> <M-q> :q<cr>
nnoremap <silent> <M-x> :Commands<cr>
nnoremap <silent> <M-h> :Helptags<cr>
nnoremap <silent> <M-f> :call fzf#vim#ag_raw(". --nocolor --hidden -U --ignore '.git*'", {'options': '--delimiter : --nth 4..'}, 1)<cr>

nnoremap <silent> <M-o>i :setlocal spell spelllang=it<cr>
nnoremap <silent> <M-o>u :setlocal spell spelllang=en_US<cr>
imap <M-o>c <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <M-o>c [s1z=<c-o>

imap § <Esc>
imap jk <Esc>

" Use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

augroup filetypedetect
    au BufRead,BufNewFile neomutt-* set filetype=markdown
augroup END

let g:ale_linters = {}
let g:ale_linters.haskell = ['stack-ghc']

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_javascript_prettier_options = '--prose-wrap always'

let g:ale_fix_on_save = 1

set background=dark
colorscheme palenight
set cursorline 
hi CursorLine term=bold cterm=bold guibg=Grey30
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

let g:vimtex_compiler_progname = 'nvr'

" Relative line numbers 
set rnu

" slow motion
set nolazyredraw
set noshowcmd

ab bacio 😘
ab eheh 😁
ab uhm 🤔
ab perche' perché
ab poiche' poiché  
ab e' è
ab cioe cioè
ab puo può
ab nonappena non appena
ab c'e' c'è
ab qual'e' qual è
ab gia' già
ab sara' sarà
ab verra' verrà
ab avra' avrà
ab realta' realtà
ab verita' verità
ab citta' città
ab disponibilita' disponibilità
ab attivita' attività
ab potra' potrà
ab avra' avrà
ab saro' sarò
ab potro' potrò
ab pero' però
ab avro' avrò
ab mandero' manderò
ab vedro' vedrò
ab rivedro' rivedrò
ab piu' più"
ab lunedi lunedì
ab cosi così
ab martedi martedì
ab mercoledi mercoledì
ab giovedi giovedì
ab venerdi venerdì

" qq to record, Q to replay
nnoremap Q @q


