execute pathogen#infect()
"在选中模式下，ctrl-x 或者 ctrl-c 就能复制选择区到osx的粘贴板了 
vmap <C-x> :!pbcopy<CR>   
vmap <C-c> :w !pbcopy<CR><CR>

" 为 pydoc3 添加以下配置（python v3.x 文档）。在正常模式下创建 H 键的映射：
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax

"禁止产生swp文件
set noswapfile

set mouse=a

if exists('$TMUX')
      set term=screen-256color
endif

set t_Co=256

set nocompatible " 必须
filetype off     " 必须
let $CONFIG_DIR = "~/"

"vundle config"
let $VUNDLE_CONFIG = $CONFIG_DIR.".vimrc_vundle"

if filereadable(expand($VUNDLE_CONFIG))
    source $VUNDLE_CONFIG
endif

"vim theme"
colorscheme molokai

"设置漂亮的属性条

set encoding=utf-8
set langmenu=zh_CN.UTF-8
"设置中文提示
language messages zh_CN.utf-8 
""设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'


"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1 

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

syntax on          
set number        
set numberwidth=5

" 高亮显示搜索结果
set hlsearch

set tabstop=4       

set softtabstop=4  
set shiftwidth=4
set expandtab
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Show the cursor position all the time
set ruler
filetype plugin on
let g:pydiction_location ='~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 20

"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F6> :NERDTreeToggle<cr>


" Tagbar"
let g:tagbar_width=35
let g:tagbar_autofocus=1
 nmap <F7> :TagbarToggle<CR>
 " parse markdown"
 let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }

"vimwiki"
map <Leader>tt :VimwikiToggleListItem<cr>


" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1

" PYTHON 相关的设置
"设置= + - * 前后自动空格
"设置,后面自动添加空格
au FileType python inoremap <buffer>= <c-r>=EqualSign('=')<CR>
au FileType python inoremap <buffer>+ <c-r>=EqualSign('+')<CR>
au FileType python inoremap <buffer>- <c-r>=EqualSign('-')<CR>
au FileType python inoremap <buffer>* <c-r>=EqualSign('*')<CR>
au FileType python inoremap <buffer>/ <c-r>=EqualSign('/')<CR>
au FileType python inoremap <buffer>> <c-r>=EqualSign('>')<CR>
au FileType python inoremap <buffer>< <c-r>=EqualSign('<')<CR>
au FileType python inoremap <buffer>: <c-r>=Swap()<CR>
au FileType python inoremap <buffer>, ,<space>

""""""""""""""""""""""""""""""""""""""""
"实现+-*/前后自动添加空格，逗号后面自动添加空格，适用python
"支持+= -+ *= /+格式
function! EqualSign(char)
    if a:char  =~ '='  && getline('.') =~ ".*("
        return a:char
    endif
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]
    if ex1 =~ "[-=+><>\/\*]"
        if ex2 !~ "\s"
            return "\<ESC>i".a:char."\<SPACE>"
        else
            return "\<ESC>xa".a:char."\<SPACE>"
        endif
    else
        if ex2 !~ "\s"
            return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
        else
            return a:char."\<SPACE>\<ESC>a"
        endif
    endif
endf 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"实现光标位置自动交换:) -->  ):
function! Swap()
    if getline('.')[col('.') - 1] =~ ")"
        return "\<ESC>la:"
    else
        return ":"
    endif
endf

" Calendar
map <F8> :Calendar<cr>

" YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_min_num_of_chars_for_completion       =  1         " 触发(符号)补全时需要键入的字符数
let g:ycm_min_num_identifier_candidate_chars    =  0         " 补全候选项的最小字符数
let g:ycm_show_diagnostics_ui                   =  0         " 关闭诊断显示功能(已经使用了ale进行异步语法检查)
let g:ycm_complete_in_comments                  =  1         " 在注释中仍会触发补全
let g:ycm_complete_in_strings                   =  1         " 在字符串中也会触发补全
let g:ycm_cache_omnifunc                        =  0         " 禁止缓存匹配项，每次都重新生成匹配项

" 自动触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{1}'],
            \ 'cs,lua,javascript': ['re!\w{1}'],
            \ }
" 遇到下列文件时才会开启YCM
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "python":1,
            \ "sh":1,
            \ }
" 跳转到声明或定义处
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<cr>
" 重新加载YCM(每次改变配置时需要)
nnoremap <leader><leader>y :YcmRestartServer<cr>
