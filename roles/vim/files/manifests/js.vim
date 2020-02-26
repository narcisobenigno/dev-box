augroup PrettierCMDs
autocmd! FileType javascript,json,typescript packadd vim-prettier
autocmd BufWritePre *.js,*.jsx PrettierAsync
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
augroup END
