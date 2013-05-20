filetype off              "必须的设置：

"set term=xterm

"Color Settings {
set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler
set backspace=indent,eol,start

let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"
"}

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set encoding=utf-8

set timeoutlen=1000 ttimeoutlen=0               "设置map延时和按键延时 
"set laststatus=2
set number                                    "显示行号
"set undofile                                  "无限undo
"set nowrap                                    "禁止自动换行
"autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

set relativenumber                             "相对行号 要想相对行号起作用要放在显示行号后面
set wrap                                       "自动换行

if has("gui_running")
    set guifont=Monospace
    set background=light
    colorscheme desert
endif

set isk+=-                                     "将-连接符也设置为单词

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
set showcmd                  "显示命令

command W w !sudo tee % >/dev/null

set numberwidth=4          "行号栏的宽度
"set columns=135           "初始窗口的宽度
"set lines=50              "初始窗口的高度
"winpos 620 45             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插入模式下移动
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-l> <right>
"inoremap <c-h> <left>

"===================================================
"修改leader键为逗号
let mapleader=","
"imap jj <esc>

inoremap <F2> <ESC>
nnoremap <F2> <ESC>
vnoremap <F2> <ESC>

"修改vim的正则表达
nnoremap / /\v
vnoremap / /\v

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

"折叠html标签 ,fold tag
"nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
"nnoremap <leader>w <c-w>v<c-w>l

"nnoremap <leader>wc <c-w>c
"nnoremap <leader>ww <c-w>w

"tab切换
"nnoremap <leader>t gt
"nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
"nnoremap <leader><space> :noh<cr>

"十六进制切换
let s:hexModle = "N"
function! ToHexModle()
    if s:hexModle == "Y"
        %!xxd -r
        let s:hexModle = "N"
    else
        %!xxd
        let s:hexModle = "Y"
    endif
endfunction

map <silent> <S-h> :call ToHexModle()<cr>

"html中的js加注释 取消注释
"nmap <leader>h I//jj
"nmap <leader>ch ^xx
"切换到当前目录
"nmap <leader>q :execute "cd" expand("%:h")<CR>
"搜索替换
nmap <leader>s :,s///c

"取消粘贴缩进
"nmap <leader>p :set paste<CR>
"nmap <leader>pp :set nopaste<CR>

inoremap <C-O> <C-X><C-O>

"设置隐藏gvim的菜单和工具栏 F2切换
"set guioptions-=m
"set guioptions-=T
"去除左右两边的滚动条
"set go-=r
"set go-=L

"map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        "\set guioptions-=T <Bar>
        "\set guioptions-=m <bar>
    "\else <Bar>
        "\set guioptions+=T <Bar>
        "\set guioptions+=m <Bar>
    "\endif<CR>


"Indent Guides设置
"let g:indent_guides_guide_size=1

"Vundle Settings {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
"Bundle 'ZenCoding.vim'
"Bundle 'matchit.zip'
"Bundle 'Tabular'
Bundle 'vim-scripts/Auto-Pairs'

Bundle 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py"
let g:ycm_complete_in_comments_and_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_confirm_extra_conf=0

Bundle 'fsouza/go.vim'
"Bundle 'spiiph/vim-space'
Bundle 'trailing-whitespace'

Bundle 'altercation/vim-colors-solarized'
colorscheme solarized

"Bundle 'SuperTab'
"Bundle 'AutoComplPop'

Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"Bundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'unicode'

"Bundle '_jsbeautify'
"nnoremap <leader>_ff :call g:Jsbeautify()<CR>

Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
"设置EasyMotion颜色
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionshade Comment

"Fencview的初始设置
"Bundle 'FencView.vim'
"let g:fencview_autodetect=1

Bundle 'The-NERD-tree'
""设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

Bundle 'The-NERD-Commenter'
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>

Bundle 'UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"}
"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
nmap <leader>fm :set ft=mako<CR>
syntax on
