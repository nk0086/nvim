"plugin + settings 
call jetpack#begin()
call jetpack#add('Shougo/neosnippet.vim')
call jetpack#add('Shougo/neosnippet-snippets')
call jetpack#add('neoclide/coc.nvim')
call jetpack#add('cocopon/iceberg.vim')
call jetpack#add('rebelot/kanagawa.nvim')
call jetpack#add('vim-skk/eskk.vim')
call jetpack#add('rust-lang/rust.vim')
call jetpack#add('cohama/lexima.vim')
call jetpack#add('qnighy/satysfi.vim')
call jetpack#add('alaviss/nim.nvim')
call jetpack#add('github/copilot.vim')
call jetpack#add('vim-airline/vim-airline')
call jetpack#add('vim-airline/vim-airline-themes')
call jetpack#add('junegunn/fzf')
call jetpack#add('junegunn/fzf.vim')
call jetpack#add('nk0086/tosnippet.vim')
call jetpack#add('mattn/vim-maketabel')
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('airblade/vim-gitgutter')
call jetpack#add('fatih/vim-go')
call jetpack#add('lukas-reineke/indent-blankline.nvim')
call jetpack#end()

command! Config :e $MYVIMRC
command! I3 :e $HOME/.config/i3/config
command! Judge :! cargo-judge -t %
command! Source :source $MYVIMRC
command! MakeSnippet :!cargo snippet % > $HOME/.config/nvim/neosnippet-snippet/rust/%<.snip

"competitive programming {
command! Test :!cargo compete t %<
command! Submit :!cargo compete s %<
"}

inoremap <C-f> <C-g>U<ESC><S-a>
nnoremap ; :
set foldmethod=manual
set number
set smartindent
set shiftwidth=4
set autochdir
set encoding=utf-8
set wildmenu
set noswapfile
set background=dark
set list listchars=trail:.

syntax enable
colorscheme kanagawa

tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>ji


"rust.vim
let g:rustfmt_autosave=1
"neosnippet.vim
let g:neosnippet#snippets_directory=$HOME."~/.config/nvim/neosnippet-snippet/"
"coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"eskk.vim
let g:eskk#directory = $HOME."/.config/eskk"
let g:eskk#dictionary = { 'path': $HOME."/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': $HOME."/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#egg_like_newline = 1
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"

"github copilot
 let g:copilot_node_command = $HOME."/.nodenv/versions/17.9.1/bin/node"



autocmd BufRead,BufNewFile *.saty,*.satyh,*satyh-*,*.satyg setlocal filetype=satysfi
filetype plugin indent on

command! Preview call Preview()
function! Preview() abort
    let file = expand('%:p')
    :!satysfi % > /dev/null
    ":!xdg-open %<.pdf
endfunction
