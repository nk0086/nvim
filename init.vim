command! Config :e $MYVIMRC
command! Source :source $MYVIMRC
command! MakeSnippet :!cargo snippet % > ~/.config/nvim/neosnippet-snippet/rust/%<.snip

"competitive programming {
command! Test :!cargo compete t %<
command! Submit :!cargo compete s %<
"}

inoremap <C-f> <C-g>U<ESC><S-a>
nnoremap ; :
set number
set smartindent
set shiftwidth=2
set autochdir
set encoding=utf-8
set wildmenu
set noswapfile
set background=dark

syntax enable
colorscheme iceberg

tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>ji



"plugin + settings 
call jetpack#begin()
call jetpack#add('Shougo/neosnippet.vim')
call jetpack#add('Shougo/neosnippet-snippets')
call jetpack#add('neoclide/coc.nvim')
call jetpack#add('cocopon/iceberg.vim')
call jetpack#add('vim-skk/eskk.vim')
call jetpack#add('rust-lang/rust.vim')
call jetpack#add('cohama/lexima.vim')
call jetpack#add('qnighy/satysfi.vim')
call jetpack#add('alaviss/nim.nvim')
call jetpack#end()

"rust.vim
let g:rustfmt_autosave=1
"neosnippet.vim
let g:neosnippet#snippets_directory='~/.config/nvim/neosnippet-snippet/'
"coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"eskk.vim
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#egg_like_newline = 1
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"
"vimspector



autocmd BufRead,BufNewFile *.saty,*.satyh,*satyh-*,*.satyg setlocal filetype=satysfi
filetype plugin indent on

