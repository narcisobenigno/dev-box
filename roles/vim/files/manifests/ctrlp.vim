let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_lazy_update = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 1
set wildignore+=*/tmp/*,*target/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|.jest'

nnoremap <leader>b :CtrlPBuffer<cr>
