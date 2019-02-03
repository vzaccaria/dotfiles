" Background process and window management
nnoremap <silent> <leader>is :InteroStart<CR>
nnoremap <silent> <leader>ik :InteroKill<CR>

" Open intero/GHCi split horizontally
nnoremap <silent> <leader>io :InteroOpen<CR>
" Open intero/GHCi split vertically
nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
nnoremap <silent> <leader>ih :InteroHide<CR>

" Reloading (pick one)
" Automatically reload on save
au BufWritePost *.hs InteroReload
" Manually save and reload

" Load individual modules
nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

" Type-related information
" Heads up! These next two differ from the rest.
map <silent> <leader>t <Plug>InteroGenericType
map <silent> <leader>T <Plug>InteroType
nnoremap <silent> <leader>it :InteroTypeInsert<CR>

" Navigation
nnoremap <silent> <leader>jd :InteroGoToDef<CR>

" Managing targets
" Prompts you to enter targets (no silent):
nnoremap <leader>ist :InteroSetTargets<SPACE>

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 1

" Enable type information on hover (when holding cursor at point for ~1 second).
let g:intero_type_on_hover = 0

" Change the intero window size; default is 10.
let g:intero_window_size = 15

" Sets the intero window to split vertically; default is horizontal
let g:intero_vertical_split = 0

" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
set updatetime=1000
