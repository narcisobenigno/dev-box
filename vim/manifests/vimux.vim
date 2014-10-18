" tmux
" Run current rspecs
map <Leader>rs :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
" Run rspecs
map <Leader>rb :call VimuxRunCommand("clear; bundle exec rspec ")<CR>
" Run last command
map <Leader>rl :VimuxRunLastCommand<CR>
