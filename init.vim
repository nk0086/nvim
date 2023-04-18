"plugin + settings 
call jetpack#begin()
" vim 
call jetpack#add('tani/vim-jetpack')
call jetpack#add('Shougo/neosnippet.vim')
call jetpack#add('Shougo/neosnippet-snippets')
call jetpack#add('neoclide/coc.nvim')
call jetpack#add('cocopon/iceberg.vim')
call jetpack#add('rebelot/kanagawa.nvim')
call jetpack#add('vim-skk/eskk.vim')
call jetpack#add('simeji/winresizer')
call jetpack#add('junegunn/fzf')
call jetpack#add('junegunn/fzf.vim')
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('tpope/vim-surround')
call jetpack#add('airblade/vim-gitgutter')
call jetpack#add('jeetsukumaran/vim-indentwise')
call jetpack#add('lambdalisue/gina.vim')
"language
call jetpack#add('rust-lang/rust.vim')
call jetpack#add('cohama/lexima.vim')
call jetpack#add('qnighy/satysfi.vim')
call jetpack#add('alaviss/nim.nvim')
call jetpack#add('github/copilot.vim')
call jetpack#add('nk0086/tosnippet.vim')
call jetpack#add('mattn/vim-maketabel')
call jetpack#add('fatih/vim-go')
call jetpack#add('lukas-reineke/indent-blankline.nvim')
call jetpack#add('mattn/emmet-vim')
call jetpack#add('chrisbra/csv.vim')
call jetpack#end()

command! Config :e $MYVIMRC
command! I3 :e $HOME/.config/i3/config
command! Source :source $MYVIMRC
command! MakeSnippet :!cargo snippet % > $HOME/.config/nvim/neosnippet-snippet/rust/%<.snip

"competitive programming {
command! Test :!cargo compete test %<
command! Sub :!cargo compete submit %<
"}

inoremap <C-f> <C-g>U<ESC><S-a>
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap ; :
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set foldmethod=manual
set number
set smartindent
set shiftwidth=4
set autochdir
set encoding=utf-8
set termencoding=utf-8
set wildmenu
set noswapfile
set background=dark
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,nbsp:.

syntax enable
colorscheme kanagawa

tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>ji

"rust.vim
let g:rustfmt_autosave=1
"neosnippet.vim
let g:neosnippet#snippets_directory = $HOME."/.config/nvim/neosnippet-snippet/"
"coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"nim.nvim
let g:nim_nimsuggest_path = $HOME."/.nimble/bin/nimsuggest"
let g:nim_nvim_nimpretty_path = $HOME."/.nimble/bin/nimpretty"
if executable("nim")
    source $HOME/.config/nvim/autocmd.rc.vim
endif

"eskk.vim
let g:eskk#directory = $HOME."/.config/eskk"
let g:eskk#dictionary = { 'path': g:eskk#directory."/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#default_dictionary_path = { 'path': g:eskk#directory."/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#egg_like_newline = 1
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"

"fzf
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

let mapleader = "\<Space>"

" fzf
" <C-v> width
" <C-x> height
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

"winresizer
nnoremap <silent> <C-r> :WinResizerStartResize<CR>

"github copilot
let g:copilot_node_command = "/usr/bin/node"
"ToSnipet
let g:tosnippet#save_directory = $HOME."/.config/nvim/neosnippet-snippet/"

autocmd BufRead,BufNewFile *.saty,*.satyh,*satyh-*,*.satyg setlocal filetype=satysfi
filetype plugin indent on

command! Preview call Preview()
function! Preview() abort
    let file = expand('%:p')
    :!satysfi % > /dev/null
    ":!xdg-open %<.pdf
endfunction


let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall

