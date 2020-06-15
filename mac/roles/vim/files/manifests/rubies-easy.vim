noremap <leader>let :silent! .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/ \| :nohls \| :normal ==<cr>
noremap <leader>iv  :silent! .s/\v(\w+)/@\1 = \1/ \| :nohls \| :normal ==<cr>

au BufRead,BufNewFile *.god set filetype=ruby
