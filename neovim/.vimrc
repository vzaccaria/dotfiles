let g:mapleader = ","
set nocompatible

set ignorecase
set expandtab

" use system clipboard
set clipboard+=unnamedplus

call plug#begin() 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'

" This has huge problems with cpu hogging
Plug 'neovimhaskell/haskell-vim'
" Plug 'parsonsmatt/intero-neovim'
Plug 'pangloss/vim-javascript'
Plug 'alx741/vim-hindent'
Plug 'jceb/vim-orgmode'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'NLKNguyen/papercolor-theme'

" text-objects:
" 
" ae        LaTeX environments (e.g. \begin{itemize})
" ac        commands
" i$        inline math structure
" a$        whole math structure
" dse|cse   delete/change the surrounding environment
" dsc|csc   delete/change the surrounding command
" c-x c-o   completion
Plug 'lervag/vimtex'

" +         to enlarge the visual selection
" _         to shrink it 
" gp        to refill the paragraph
Plug 'terryma/vim-expand-region'

" ysiw]     put square parentheses around iw text object
" cs"'      change surrounding quotes from " to '
" ds{       delete surrounding {
" S"        in visual mode, put quotes around selected text
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'

" gc        visual mode to comment out the selection, and 
" gcc       comment out a line (takes a count), 
" gc        comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc        operator pending mode to target a comment.
Plug 'tpope/vim-commentary'

" ,s**      to jump where you want with two characters
" ,k        to jump to an highlighted line up
" ,j        to jump to an highlighted line down
" ,.        to jump by selecting the line
Plug 'easymotion/vim-easymotion'

" gt        to set title case
" gT        to set title case whole line
Plug 'christoomey/vim-titlecase'

" C-n       multiple times then c, I, A, d
Plug 'terryma/vim-multiple-cursors'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Folds for yaml
Plug 'pedrohdz/vim-yaml-folds'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
call plug#end()

" when opening fzf look also for hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" open fzf for files in current directory,
nnoremap <silent> <C-x><C-f> :FZF -m<cr>

" open fzf for files in history,
nnoremap <silent> <M-u> :History<cr>

" quit,
nnoremap <silent> <M-q> :q<cr>
nnoremap <silent> <M-w> :q<cr>

" refill
noremap <silent> <M-i> gwip<cr>

" open fzf for commands,
nnoremap <silent> <M-x> :Commands<cr>

" open fzf for help,
nnoremap <silent> <M-h> :Helptags<cr>

" open fzf for ag in local files,
nnoremap <silent> <M-f> :call fzf#vim#ag_raw(". --nocolor --hidden -U --ignore '.git*' --ignore node_modules", {'options': '--delimiter : --nth 4..'}, 1)<cr>

" set spell language to italian
nnoremap <silent> <M-o>i :setlocal spell spelllang=it<cr>

" set spell language to english
nnoremap <silent> <M-o>u :setlocal spell spelllang=en_US<cr>

" <M-o> correct last word with the first one from the vocabulary
imap <M-o>c <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <M-o>c [s1z=<c-o>

" move around tabs
nnoremap <silent> <C-[> :tabprevious<CR>
nnoremap <silent> <C-]> :tabnext<CR>

map <C-l> <Plug>(easymotion-bd-jk)
nmap <C-l> <Plug>(easymotion-overwin-line)

let g:tex_flavor = 'latex'


nmap <C-a> <C-w>

nnoremap <Leader>d :ALEDetail<cr>

let g:EasyMotion_smartcase = 1

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }



" Start interactive EasyAlign in visual mode (e.g. vipga)
vnoremap <Enter> <Plug>(EasyAlign)

xnoremap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" ,as to realign a paragraph by spaces
nnoremap <leader>as vip:EasyAlign *\ <cr>

" ,ac to realign a paragraph by commas
nnoremap <leader>ac vip:EasyAlign *,<cr>

" ,aq to realign a paragraph by double quotes
nnoremap <leader>aq vip:EasyAlign *"<cr>

" ,ae to realign by ampersands
nnoremap <leader>ae vip:EasyAlign *&<cr>
			
" ,al to realign by colons
nnoremap <leader>al vip:EasyAlign *:<cr>

"search for visually selected text
vnoremap // y/<C-R>"<CR>

" Switch windows when in terminal
if has('nvim')
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w><left> <C-\><C-n><C-w>h
tnoremap <C-w><down> <C-\><C-n><C-w>j
tnoremap <C-w><up> <C-\><C-n><C-w>k
tnoremap <C-w><right> <C-\><C-n><C-w>l

" touchbar!
tnoremap § <C-c>
endif
cnoremap § <C-c>
inoremap § <Esc>
inoremap jk <Esc>

" When editing mails from neomutt use markdown
augroup filetypedetect
    au BufRead,BufNewFile neomutt-* set filetype=markdown
augroup END

let g:markdown_folding = 1

if exists('*ale#linter#Define')
call ale#linter#Define('tex', {
\   'name': 'vzredpen',
\   'executable': 'vzredpen',
\   'command': 'vzredpen -f latex -r json %t',
\   'callback': 'ale#handlers#redpen#HandleRedpenOutput',
\})
endif

if exists('*ale#linter#Define')
call ale#linter#Define('lhaskell', {
\   'name': 'lit-stack-ghc',
\   'output_stream': 'stderr',
\   'executable': function('ale#handlers#haskell#GetStackExecutable'),
\   'command': function('ale_linters#haskell#stack_ghc#GetCommand'),
\   'callback': 'ale#handlers#haskell#HandleGHCFormat',
\})
endif


let g:ale_linters = {}
let g:ale_linters.haskell = ['stack-ghc', 'stack-ghc-mod', 'hlint']
let g:ale_linters.lhaskell = ['lit-stack-ghc']
let g:ale_linters.yaml = ['yamllint']
let g:ale_linters.verilog = ['iverilog']
let g:ale_linters.tex = ['proselint', 'write-good', 'vzredpen']

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\   'c': ['clang-format'],
\   'asm': ['gcc']
\}

let g:ale_javascript_prettier_options = '--prose-wrap always'
let g:ale_fix_on_save = 1

nnoremap <silent> <leader>m :make<cr>

"set background=dark
colorscheme palenight

set background=light
" colorscheme PaperColor
" set cursorline 
" hi CursorLine term=bold cterm=bold guibg=Grey30
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Relative line numbers 
" set rnu

" slow motion
set nolazyredraw
set noshowcmd

" Folding shortcut
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" nnoremap <S-Right> zo
" inoremap <S-Right> <C-O>zo
" nnoremap <S-Left> zc
" inoremap <S-Left> <C-O>zc


ab bacio 😘
ab eheh 😁
ab uhm 🤔
ab perche' perché
ab poiche' poiché  
ab finche' finché  
ab e' è
ab cioe cioè
ab puo può
ab nonappena non appena
ab ce' c'è
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
ab puo' può
ab pero' però
ab avro' avrò
ab faro' farò
ab mandero' manderò
ab vedro' vedrò
ab rivedro' rivedrò
ab piu' più
ab lunedi lunedì
ab cosi così
ab martedi martedì
ab mercoledi mercoledì
ab giovedi giovedì
ab venerdi venerdì

" qq to record, Q to replay
nnoremap Q @q
" nnoremap <c-q> @q

" Utilities for data entry
" <c-s> when in insert mode, press c-s to look for next data, then press enter
inoremap <c-s> <c-c>/

" before we find anything better, jump to the next | after 2 words (first,last
" name) and append
nnoremap <c-i> 2wa

