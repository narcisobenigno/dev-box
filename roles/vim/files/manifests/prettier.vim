augroup PrettierCMDs
autocmd! FileType javascript,html,json,typescript packadd vim-prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
augroup END
