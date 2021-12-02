let g:mapleader = ","
set nocompatible
" set statusline+=%{get(b:,'gitsigns_status','')}

set ignorecase
set expandtab

" use system clipboard
set clipboard+=unnamedplus

"change directory into the file we are editing
set autochdir

" Add to .vimrc to enable project-specific vimrc

set exrc
set secure

" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

call plug#begin() 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'

Plug 'neovimhaskell/haskell-vim'
" This has huge problems with cpu hogging
" Plug 'parsonsmatt/intero-neovim'
Plug 'pangloss/vim-javascript'
Plug 'alx741/vim-hindent'

" Languages
Plug 'jceb/vim-orgmode'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Themes
Plug 'morhetz/gruvbox'
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

Plug 'easymotion/vim-easymotion'

" gt        to set title case
" gT        to set title case whole line
Plug 'christoomey/vim-titlecase'

" C-n       multiple times then c, I, A, d
" Plug 'terryma/vim-multiple-cursors'


Plug 'google/vim-jsonnet'
                        

" For using vim in the browser
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }


" Track the engine.
"Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

" Folds for yaml
" Plug 'pedrohdz/vim-yaml-folds'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'



Plug 'mbbill/undotree'
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
nmap <leader>Q :qall!<CR>
nmap <leader>W :wqall<CR>

" refill
noremap <silent> <M-i> gwip<cr>
nnoremap <silent> <M-x> :Commands<cr>
nnoremap <silent> <M-h> :Helptags<cr>
nnoremap <silent> <M-y> :Snippets<cr>


" open fzf for ag in local files,
nnoremap <silent> <M-f> :call fzf#vim#ag_raw(". --nocolor --hidden -U --ignore '.git*' --ignore node_modules", {'options': '--delimiter : --nth 4..'}, 1)<cr>

" set spell language to italian or english
nnoremap <silent> <leader>si :setlocal spell spelllang=it<cr>
nnoremap <silent> <leader>se :setlocal spell spelllang=en_US<cr>

" <M-o> correct last word with the first one from the vocabulary
imap <M-o>c <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <M-o>c [s1z=<c-o>

" move around buffers and tabs
nnoremap <silent> <C-[> :tabprevious<CR>
nnoremap <silent> <C-]> :tabnext<CR>
nnoremap <leader>n :bnext <CR>
nnoremap <leader>p :bprev <CR>

map <C-l> <Plug>(easymotion-bd-jk)
nmap <C-l> <Plug>(easymotion-overwin-line)

" wrap current word or selection with textbf/textit (need surround.vim)
nmap <leader>xb ysiw}i\textbf<ESC>
nmap <leader>xi ysiw}i\textit<ESC>
nmap <leader>xu ysiw}i\underline<ESC>
vmap <leader>xb S}i\textbf<ESC>
vmap <leader>xi S}i\textit<ESC>
vmap <leader>xu S}i\underline<ESC>

vmap <leader>" S"<ESC>
vmap <leader>' S'<ESC>


"replace word under cursor
nnoremap <leader>sr :%s/<C-R><C-W>//gI<left><left><left>


let g:tex_flavor = 'latex'

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}



" nmap <C-a> <C-w>

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

" ALE keybindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-h> <Plug>(ale_detail)

" When editing mails from neomutt use markdown
augroup filetypedetect
    au BufRead,BufNewFile neomutt-* set filetype=markdown
augroup END

" let g:markdown_folding = 1

if exists('*ale#linter#Define')
call ale#linter#Define('tex', {
\   'name': 'vzredpen',
\   'executable': 'vzredpen',
\   'command': 'vzredpen -f latex -r json %t',
\   'callback': 'ale#handlers#redpen#HandleRedpenOutput',
\})
endif

" if exists('*ale#linter#Define')
" call ale#linter#Define('lhaskell', {
" \   'name': 'lit-stack-ghc',
" \   'output_stream': 'stderr',
" \   'executable': function('ale#handlers#haskell#GetStackExecutable'),
" \   'command': function('ale_linters#haskell#stack_ghc#GetCommand'),
" \   'callback': 'ale#handlers#haskell#HandleGHCFormat',
" \})
" endif

call ale#linter#Define('haskell', {
\   'name': 'stack_ghc_local',
\   'aliases': ['stack-ghc-local'],
\   'output_stream': 'stderr',
\   'executable': 'stack',
\   'command': 'stack ghc -- -fno-code -v0 %t -hide-package cryptonite',
\   'callback': 'ale#handlers#haskell#HandleGHCFormat',
\})


let g:ale_linters = {}

"hide cryptonite for relation calculus
let g:ale_linters.haskell = [ 'stack-ghc-local', 'hlint']
" See here https://blog.jez.io/haskell-development-with-neovim/
"let g:ale_linters.haskell = [ 'stack-ghc', 'hlint']
let g:ale_linters.yaml = ['yamllint']
let g:ale_linters.verilog = ['iverilog']
let g:ale_linters.tex = ['proselint', 'write-good', 'vzredpen']

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'haskell': ['stylish-haskell'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\   'c': ['clang-format'],
\   'asm': ['gcc'],
\   'cpp': ['clang-format'],
\}

let g:rustfmt_autosave = 1
let g:ale_javascript_prettier_options = '--prose-wrap always'
let g:ale_fix_on_save = 1

nnoremap <silent> <leader>m :make<cr>

"set background=dark
colorscheme gruvbox

"set background=light
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
"

" fugitive <leader>g
nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]
nnoremap <silent> [fugitive]s  :Git status<CR>
nnoremap <silent> [fugitive]b  :Git blame<CR>
nnoremap <silent> [fugitive]B  :GBrowse<CR>

" Current staged changes are added to last commit
nnoremap <silent> [fugitive]m :Git commit --amend<CR>
nnoremap <silent> [fugitive]c :Git commit -v -q<CR>
nnoremap <silent> [fugitive]d  :Gdiffsplit<CR>
nnoremap <silent> [fugitive]a  :Gwrite<CR>
nnoremap <silent> [fugitive]r  :Gread<CR>
nnoremap <silent> [fugitive]p  :Git push<CR>
nnoremap <silent> [fugitive]l  :Git log -- %<CR>
nnoremap <silent> [fugitive]h :GitGutterStageHunk<CR>

nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F1> :Gwrite<CR>
nnoremap <F2> :Git commit -v -q<CR>
nnoremap <F3> :Git commit --amend<CR>
nnoremap <F12> :GBrowse<CR>


" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg 
highlight SignColumn ctermbg=bg

let g:coc_global_extensions = ['coc-clangd', 'coc-docker']


" Update sign column every quarter second
set updatetime=250



ab bacio 😘
ab eheh 😁
ab uhm 🤔
ab perche' perché
ab poiche' poiché  
ab finche' finché  
ab e' è
ab E' È
ab cioe cioè
ab puo può
ab nonappena non appena
ab ce' c'è
ab qual'e' qual è
ab gia' già
ab sara' sarà
ab verra' verrà
ab avra' avrà
ab dovra' dovrà
ab realta' realtà
ab verita' verità
ab citta' città
ab unita' unità
ab disponibilita' disponibilità
ab attivita' attività
ab Attivita' Attività
ab potra' potrà
ab avro' avrò
ab saro' sarò
ab potro' potrò
ab pero' però
ab puo' può
ab pero' però
ab avro' avrò
ab faro' farò
ab dovro' dovrò
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

" Recall to invoke "CocInstall -sync coc-clangd" 

" The following is the configuration for CoC.
" Useful commands to remember 
"
" gd     go to symbol definition
" gr     show where the symbol is referenced
" [g     previous error/warning 
" ]g     next error/warning
" K      show inline the symbol definition
" *      find all occurrences of symbol under cursor
" ,rn    rename all occurences of symbol under cursor

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>



