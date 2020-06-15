" tmux
" Run current rspecs
map <Leader>rs :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
" Run rspecs
map <Leader>rb :call VimuxRunCommand("clear; bundle exec rspec")<CR>
" Run current rspecs
map <Leader>rt :call VimuxRunCommand("clear; bundle exec rails test " . bufname("%"))<CR>
" Run rspecs
map <Leader>ra :call VimuxRunCommand("clear; bundle exec rails test")<CR>
" Run last command
map <Leader>rl :VimuxRunLastCommand<CR>
