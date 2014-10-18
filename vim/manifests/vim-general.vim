filetype plugin indent on
syntax on

set history=100
set nobackup
set noswapfile
set pastetoggle=<F6>
set mouse=a
set encoding=utf-8

set title
set titleold=
set ruler

set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l
set shortmess=aTsI     " see :help shortmess
set noerrorbells
set visualbell
set scrolloff=3
set sidescroll=3

set autoread
set splitright
set splitbelow
set hidden

set timeoutlen=500
set showmatch
set matchtime=1
set hlsearch
set incsearch
set list
set listchars=eol:$,trail:·,tab:>·
set laststatus=2

set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set textwidth=80
set linebreak

set foldenable
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s\\+#'  " fold comments
set foldminlines=4
set foldopen-=undo      " don't open folds when you undo stuff

set virtualedit=block

set wildignore+=tmp/**
set wildignore+=vendor/bundle/**
set wildignore+=*.png,*.jpg,*.gif,*.gem,*.o

autocmd FileType c,h,cpp,hpp setl cindent ts=4 sts=4 sw=4 noet nolist lcs+=tab:\ \
autocmd FileType asm setl ts=8 sts=8 sw=8 noet lcs+=tab:\ \
autocmd FileType go setl ts=4 sts=4 sw=4 noet commentstring=\/\/\ %s lcs+=tab:\ \
autocmd FileType python setl ts=4 sts=4 sw=4
autocmd FileType make,automake setl ts=4 sts=4 sw=4 noet lcs+=tab:\ \
autocmd BufRead *.clj let b:delimitMate_quotes="\""
autocmd BufRead *irb-interactive* setl ft=ruby
autocmd BufRead nginx.conf setl ft=nginx

hi clear Folded
hi Folded ctermfg=darkgray ctermbg=none guifg=#444444
hi clear Search
hi Search gui=underline cterm=underline ctermfg=black ctermbg=yellow

hi clear DiffAdd
hi DiffAdd    cterm=bold ctermfg=green
hi clear DiffChange
hi DiffChange cterm=bold ctermfg=yellow
hi clear DiffDelete
hi DiffDelete cterm=bold ctermfg=red
hi clear DiffText
hi DiffText   cterm=bold,underline ctermfg=magenta

hi clear SpellBad
hi SpellBad ctermfg=red
hi clear SpellCap
hi SpellCap ctermfg=lightblue

hi clear MatchParen
hi MatchParen ctermfg=white ctermbg=blue

hi clear PMenu
hi PMenu ctermfg=white ctermbg=black

nmap Y y$
nmap Q <nop>
nmap K <nop>
nnoremap <silent> <C-L> :nohls<cr>
" avoid cursor jumping around when joining lines
nnoremap J mzJ`z

