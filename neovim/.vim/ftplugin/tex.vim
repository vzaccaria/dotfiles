
"Remember to open the tex file with nvr
if has("nvim")
  let g:vimtex_latexmk_progname = 'nvr'
  let g:vimtex_compiler_progname = 'nvr'
endif

nnoremap <leader>v :VimtexView<CR>
nnoremap <leader>b :VimtexCompile<CR>
xmap <buffer> <M-i> <Plug>VSurround}i\emph<esc>
xmap <buffer> <M-b> <Plug>VSurround}i\textbf<esc>
xmap <buffer> <M-k> <Plug>VSurround}i\texttt<esc>

" let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0},
" \}

let g:vimtex_quickfix_enabled = 0
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_cites = 1
let g:vimtex_complete_auto= 1
let g:vimtex_matchparen_enabled = 0
setlocal spell spelllang=en
if has('mac')
	let g:vimtex_view_method = 'skim'
	let g:vimtex_fold_manual = 1
	let g:tex_fast = "bMpr"
	let g:tex_conceal = ""
        let g:matchup_matchparen_deferred = 1
elseif has('unix')
	let g:vimtex_view_method = 'zathura'
	let g:vimtex_fold_manual = 1
	let g:tex_fast = "bMpr"
	let g:tex_conceal = ""
        let g:matchup_matchparen_deferred = 1
endif
