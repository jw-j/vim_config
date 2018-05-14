"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create by:    Vic
"               http://www.libgod.com
"               vic@libgod.com
"
" Plugins_Included:
"   minibufexplorerpp - https://github.com/gezidan/minibufexplorerpp.git
"   ctrlp.vim - https://github.com/kien/ctrlp.vim.git
"   vim-indent-guides - https://github.com/nathanaelkane/vim-indent-guides.git
"   indentLine - https://github.com/Yggdroot/indentLine.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if ! exists("g:signature")
    let g:signature = "Demo <demo@demo.com>"
endif

set nocompatible

if version >= 603
    set helplang=cn
endif

set history=50 "保留历史命令个数
set fenc=utf-8 "设置默认语言为8位unicode

"文件类型侦测
filetype on
filetype plugin on
filetype indent on

set autoread "如果发现文件在 Vim 之外修改过而在 Vim 里面没有的话，自动重新读入。

let mapleader = "," "要定义一个使用 \"mapleader\" 变量的映射，可以使用特殊字串 \"<Leader>\"
let g:mapleader = ","
let maplocalleader = "\\" "<LocalLeader> 和 <Leader> 类似，除了它使用 \"maplocalleader\" 而非 \"mapleader\"以外

nmap <leader>w :w!<cr> "快速保存
nnoremap <F2> :qa<CR>
nnoremap <F5> :e<CR>

if g:mysystem == "windows"
    map <leader>e :e! ~/_vim_config/vimrc<cr> "快速编辑.vimrc
    autocmd! bufwritepost vimrc source ~/_vim_config/vimrc "当vimrc修改后，自动加载
else
    map <leader>e :e! ~/.vim_config/vimrc<cr> "快速编辑.vimrc
    autocmd! bufwritepost vimrc source ~/.vim_config/vimrc "当vimrc修改后，自动加载
endif

set scrolloff=7 "光标上下两侧最少保留的屏幕行数
set sidescrolloff=7 "如果设置 'nowrap'，光标左右两侧保留的最少屏幕列数
"set showmode "在插入、替换和可视模式里，在最后一行提供消息
set showcmd "在屏幕最后一行显示 (部分的) 命令

set wildmenu "打开时，命令行补全以增强模式运行
set wildmode=list:longest "用 'widechar' 指定的字符所用的补全模式
set ttyfast "表明使用的是快速终端连接

set ruler "显示光标位置的行号和列号，逗号分隔

set cursorline "行高亮
set cursorcolumn "列高亮

set cmdheight=1 "命令行使用的屏幕行数

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "搜索时忽略大小写
set smartcase

set gdefault "如果打开，":substitute" 的 'g' 标志位缺省打开。这意味着所有的行内匹配都被替换，而不是只有一个。
set hlsearch "如果有上一个搜索模式，高亮它的所有匹配

set incsearch "输入搜索命令时，显示目前输入的模式的匹配位置。匹配的字符串被高亮
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 "匹配括号高亮的时间（单位是十分之一秒）

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable "语法高亮
"set spell "打开拼写检查。拼写有错的单词下方会有红色波浪线，将光标放在单词上，按 z= 就会出现拼写建议，按 ]s 可以直接跳到下一个拼写错误处。

"设置字体
if g:mysystem == "mac"
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif g:mysystem == "windows"
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif g:mysystem == "unix"
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif

if has("gui_running")
    colorscheme molokai
    set guioptions-=T
else
    "let g:molokai_original = 1
    let g:rehash256 = 1
    colorscheme molokai
endif

set background=dark

set encoding=utf8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
try
    lang en_US
catch
endtry

set ambiwidth=double "防止特殊符号无法正常显示。

set fileformat=unix "设置<EOL>格式
set fileformats=unix,dos,mac "设置<EOL>格式


"Turn off backups and undo
set nobackup "不备份
set nowb
set noswapfile

"Persistent undo
try
    if g:mysystem == "windows"
        set undodir=C:\Windows\Temp
    else
        set undodir=~/.vim_config/undodir
    endif

    set undofile
catch
endtry

set expandtab "空格替换TAB
set shiftwidth=4 "缩进空格数
set tabstop=4 "硬TAB
set softtabstop=4 "软TAB
set smarttab "智能TAB

"自动缩进
set autoindent
set cindent
set smartindent
set wrap "自动换行
"set nowrap "不自动换行

set lbr "不在单词中间断行。设置了这个选项后，如果一行文字非常长，无法在一行内显示完的话，它会在单词与单词间的空白处断开，尽量不会把一个单词分成两截放在两个不同的行里。
set formatoptions+=mB "打开断行模块对亚洲语言支持。m表示允许在两个汉字之间断行，即使汉字之间没有出现空格。B表示将两行合并为一行的时候，汉字与汉字之间不要补空格。

set textwidth=500 "插入文本的最大宽度

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" From an idea by Michael Naumann
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Smart mappings on the command line
"cno $h e ~/
"cno $d c <C-\>eCurrentFileDir("e")<cr>
"cno $j e ./
"cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
"cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
"cnoremap <C-A> <Home>
"cnoremap <C-E> <End>
"cnoremap <C-K> <C-U>

"cnoremap <C-P> <Up>
"cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
    let cwd = getcwd()
    return "e " . cwd 
endfunc

func! DeleteTillSlash()
    let g:cmd = getcmdline()
    if g:mysystem == "unix" || g:mysystem == "mac"
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    endif
    if g:cmd == g:cmd_edited
        if g:mysystem == "unix" || g:mysystem == "mac"
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        endif
    endif   
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"自动换行时可在行中移动
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
"map <space> /
"map <c-space> ?
"map <silent> <leader><cr> :noh<cr>

"在分割的窗口间移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>
nnoremap <F4> :Bclose<CR>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
"map <leader>tn :tabnew! %<cr>
"map <leader>te :tabedit 
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! " . l:currentBufNum)
    endif
endfunction

" Specify the behavior when switching between buffers 
try
    set switchbuf=usetab
    set stal=2
catch
endtry


"Remeber open buffers on close
"set viminfo^=%


"set foldenable "允许折叠
"set foldmethod=manual "手动折叠
"set foldmethod=indent "缩进折叠
"set foldmethod=syntax "语法高亮项目指定折叠
"set foldlevelstart=99 "在窗口里开始编辑一个缓冲区时设置 'foldlevel'。用于开始编辑时总是关闭所有的折叠 (值为零)，关闭某些折叠 (1) 或者没有折叠 (99)
"set foldlevel=0 "设置折叠级别: 高于此级别的折叠会被关闭
"set foldcolumn=0 "显示折叠列

set nosplitbelow "窗口的分割会把新窗口放到当前窗口之下
set nosplitright "窗口的分割会把新窗口放到当前窗口之右

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"Git branch
function! GitBranch()
    try
        let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    catch
        return ''
    endtry

    if branch != ''
        return ' Git: [' . substitute(branch, '\n', '', 'g') . ']'
    en

    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}%h\ \ Column:\ %c
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ Line:\ %l/%L\ \ Col:\ %c%{GitBranch()}%h\ \ [%{&ff}]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]
set statusline=\ [%{HasPaste()}%F%m%r%h%w]\ [%{CurDir()}%h]\ [%l/%L]\ [%c]%{GitBranch()}%h\ [%Y]\ [%{&ff}]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
"map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if g:mysystem == "mac"
"    nmap <D-j> <M-j>
"    nmap <D-k> <M-k>
"    vmap <D-j> <M-j>
"    vmap <D-k> <M-k>
"endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
"map <leader>cc :botright cope<cr>
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"取消搜索高亮
nnoremap <F11> :nohl<CR>

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 30
"let g:miniBufExplSplitBelow=1

"autocmd BufRead,BufNew :call UMiniBufExplorer

"map <leader>u :TMiniBufExplorer<cr>
"nnoremap <F12> :TMiniBufExplorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

"au FileType python inoremap <buffer> $r return 
"au FileType python inoremap <buffer> $i import 
"au FileType python inoremap <buffer> $p print 
"au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
"au FileType python map <buffer> <leader>1 /class 
"au FileType python map <buffer> <leader>2 /def 
"au FileType python map <buffer> <leader>C ?class 
"au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
"let MRU_Max_Entries = 400
"map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
"let g:CommandTMaxHeight = 15
"set wildignore+=*.o,*.obj,.git,*.pyc,*.svn
"noremap <leader>y :CommandTFlush<cr>
"noremap! <leader>j :PeepOpen<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .svn generated'
set grepprg=/bin/grep\ -nH

""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
if g:mysystem == "windows"
    set runtimepath+=~/_vim_config/third_party/ctrlp/
    helptags ~/_vim_config/third_party/ctrlp/doc/
else
    set runtimepath+=~/.vim_config/third_party/ctrlp/
    helptags ~/.vim_config/third_party/ctrlp/doc/
endif
set wildignore+=*/tmp/*,*.a,*.la,*.so,*.so.*,*.swp,*.zip,*.tar.gz,.git,.svn,*.deb,*.rpm

""""""""""""""""""""""""""""""
" => vim-indent-guides
""""""""""""""""""""""""""""""
if g:mysystem == "windows"
    set runtimepath+=~/_vim_config/third_party/vim-indent-guides/
    helptags ~/_vim_config/third_party/vim-indent-guides/doc/
else
    set runtimepath+=~/.vim_config/third_party/vim-indent-guides/
    helptags ~/.vim_config/third_party/vim-indent-guides/doc/
endif
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626   ctermbg=235 "238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626   ctermbg=235 "235
nnoremap <F10> :IndentGuidesToggle<CR>

""""""""""""""""""""""""""""""
" => indentLine
""""""""""""""""""""""""""""""
"if g:mysystem == "windows"
"    set runtimepath+=~/_vim_config/third_party/indentLine/after/
"    helptags ~/_vim_config/third_party/indentLine/doc/
"else
"    set runtimepath+=~/.vim_config/third_party/indentLine/after/
"    helptags ~/.vim_config/third_party/indentLine/doc/
"endif
"let g:indentLine_enabled = 1
"let g:indentLine_indentLevel = 20
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_maxLines = 100
"let g:indentLine_setColors = 1
"let g:indentLine_color_term = 237 "118, 239
"let g:indentLine_color_gui = '#A6E22E'
""let g:indentLine_faster = 1 "按快捷键有bug
"let g:indentLine_char = "." " default is '¦' or '|'
"let g:indentLine_first_char = '.'
"nnoremap <F10> :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""
"if g:mysystem == "windows"
"    set runtimepath+=~/_vim_config/third_party/YouCompleteMe/
"    helptags ~/_vim_config/third_party/YouCompleteMe/doc/
"else
"    set runtimepath+=~/.vim_config/third_party/YouCompleteMe/
"    helptags ~/.vim_config/third_party/YouCompleteMe/doc/
"endif
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'
"let g:ycm_global_ycm_extra_conf = '~/.vim_config/third_party/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' "配置默认的ycm_extra_conf.py
"let g:ycm_confirm_extra_conf=0 "打开vim时不再询问是否加载ycm_extra_conf.py配置
"nnoremap <F6> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F5> :YcmDiags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

"map <leader>pp :setlocal paste!<cr>
"map <leader>bb :cd ..<cr>
"map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
"map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr>
"map <leader>cp :cd ~/Desktop/PlurkGit/trunk<cr>

if g:mysystem == "mac"
    if has("gui_running")
        set fuoptions=maxvert,maxhorz
        au GUIEnter * set fullscreen
    endif
endif

"无法记住上次编辑的位置
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("normal '\"")|else|exe "normal $"|endif|endif

set number "显示行号
set numberwidth=1 "行号使用的最小列数

set completeopt-=preview

"二进制文件
"vim -b : 用xxd格式编辑二进制文件
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin,*.o,*.so,*.a let &bin=1
    autocmd BufReadPost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufReadPost *.bin,*.o,*.so,*.a set ft=xxd | endif
    autocmd BufWritePre *.bin,*.o,*.so,*.a if &bin | %!xxd -r
    autocmd BufWritePre *.bin,*.o,*.so,*.a endif
    autocmd BufWritePost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufWritePost *.bin,*.o,*.so,*.a set nomod | endif
augroup End

"自动插入文件头
autocmd BufNewFile *.sh,*.py,*.lua,*.h,*.hpp,*.c,*.cc,*.cpp,*.htm,*.html,*.xml,*.proto,CMakeLists.txt exec ":call SetFileTitle()"
func! SetFileTitle()
    let l:ext = expand("%:e")
    "call append(line(".") - 1, "File Type:       " . &filetype)
    "call append(line(".") - 1, "File Name:       " . expand("%"))
    if &filetype == 'sh'
        call append(line(".") - 1, "\#!/bin/bash")
        "call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "#set -e # 这告诉bash一但有任何一个语句返回非真的值，则退出bash。")
    elseif &filetype == 'python'
        call append(line(".") - 1, "\#!/usr/bin/env python")
        call append(line(".") - 1, "\# coding=utf-8")
        "call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "if __name__ == \"__main__\":")
        call append(line(".") - 1, "    pass")
    elseif &filetype == 'lua'
        call append(line(".") - 1, "\#!/usr/bin/env lua")
        "call append(line(".") - 1, "\-\- Created By:      " . g:signature)
        call append(line(".") - 1, "\-\- Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-\- Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
    elseif l:ext == 'h'
        call append(line(".") - 1, "\#pragma once")
    elseif &filetype == 'c'
        "call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "#include \<stdio.h\>")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "int main(int argc, char *argv[]) {")
        call append(line(".") - 1, "    return 0;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'cpp'
        "call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "#include \<iostream\>")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "using namespace std;")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "int main(int argc, char *argv[]) {")
        call append(line(".") - 1, "    return 0;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'html'
        call append(line(".") - 1, "<!--")
        "call append(line(".") - 1, "Created By:      " . g:signature)
        call append(line(".") - 1, "Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-->")
        call append(line(".") - 1, "<html>")
        call append(line(".") - 1, "<head>")
        call append(line(".") - 1, "<title>Hello</title>")
        call append(line(".") - 1, "</head>")
        call append(line(".") - 1, "<body bgcolor=\"#ffffff\">")
        call append(line(".") - 1, "    Hello, world！")
        call append(line(".") - 1, "</body>")
        call append(line(".") - 1, "</html>")
    elseif &filetype == 'xml'
        call append(line(".") - 1, "<!--")
        "call append(line(".") - 1, "Created By:      " . g:signature)
        call append(line(".") - 1, "Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\-->")
        call append(line(".") - 1, "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>")
        call append(line(".") - 1, "<hello>")
        call append(line(".") - 1, "</hello>")
    elseif &filetype == 'proto'
        "call append(line(".") - 1, "\/\/ Created By:      " . g:signature)
        call append(line(".") - 1, "\/\/ Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\/\/ Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "")
        call append(line(".") - 1, "package company.app;")
        call append(line(".") - 1, "option optimize_for = SPEED; // SPEED, CODE_SIZE, LITE_RUNTIME")
        call append(line(".") - 1, "")
        call append(line(".") - 1, "message demo {")
        call append(line(".") - 1, "    required int64 accid = 1;")
        call append(line(".") - 1, "    optional bool sex = 2;")
        call append(line(".") - 1, "    repeated string book = 3;")
        call append(line(".") - 1, "}")
    elseif &filetype == 'cmake'
        "call append(line(".") - 1, "\# Created By:      " . g:signature)
        call append(line(".") - 1, "\# Created Time:    " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "\# Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".") - 1, "cmake_minimum_required(VERSION 2.7.4 FATAL_ERROR)")
        call append(line(".") - 1, "project(DEMO)")
    endif
    "自动定位到文件末尾
    "autocmd BufNewFile * normal g
endfunc

autocmd BufWritePre,FileWritePre *.* exec ":call LastModified()"
func! LastModified()
    let l:lines = line("$")
    if l:lines > 10
        let l:lines = 10
    endif
    let l:cur_line = line(".")
    let l:cur_col = col(".")
    exe "1,".l:lines."s/Modified Time: .*/Modified Time:   " . strftime("%Y-%m-%d %H:%M:%S") . "/e"
    call cursor(l:cur_line, l:cur_col)
endfunc
