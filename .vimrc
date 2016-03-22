set nocompatible
set autoindent             "自动缩进
set cindent
set showmatch              "代码匹配
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noet
set nu
set hlsearch               "检索时高亮显示匹配项
set ruler
set ru
set colorcolumn=90
set ignorecase
set helplang=cn            "帮助系统设置为中文
set showcmd                "输入的命令显示出来，看的清楚些
set foldenable             "允许折叠
set backspace=indent,eol,start
set completeopt=preview,longest,menu
set ruler                  "打开状态栏标尺
set expandtab
"" set cursorline          "突出显示当前行

set list listchars=tab:→\ ,trail:·

filetype plugin on
let g:pydiction_location = '/usr/share/vim/vim74/pydiction/complete-dict'
let g:pydiction_menu_height = 10
autocmd FileType python set omnifunc=pythoncomplete#Complete
set foldmethod=indent      "手动折叠

colorscheme desert

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

""新建 .sh, .py, .markdown 文件，自动插入文件头
autocmd BufNewFile *.sh,*.markdown,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'python'
        call setline(1, "just for py")
        call setline(1, "\#!/usr/bin/python")
        call append(line(".")+0, "\#-*- coding:utf-8 -*-")
        call append(line(".")+1, "")
        call append(line(".")+2, "\#############################################")
        call append(line(".")+3, "\# File Name: ".expand("%"))
        call append(line(".")+4, "\# Author: xiaoh")
        call append(line(".")+5, "\# Mail: xiaoh@about.me")
        call append(line(".")+6, "\# Created Time: ".strftime(" %Y-%m-%d %H:%M:%S"))
        call append(line(".")+7, "\#############################################")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
        call append(line(".")+10, "")
        call append(line(".")+11, "")
        call append(line(".")+12, "def main():")
        call append(line(".")+13, "    print 'hello'")
        call append(line(".")+14, "")
        call append(line(".")+15, "if __name__ == \"__main__\":")
        call append(line(".")+16, "    main()")
        call append(line(".")+17, "")
    endif
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line(".")+0, "")
        call append(line(".")+1, "\#############################################")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: xiaoh")
        call append(line(".")+4, "\# mail: xiaoh@about.me")
        call append(line(".")+5, "\# Created Time: ".strftime(" %Y-%m-%d %H:%M:%S"))
        call append(line(".")+6, "\#############################################")
        call append(line(".")+7, "")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
    endif
    if &filetype == 'markdown'
        call setline(1, "\---")
        call append(line(".")+0, "layout:     post")
        call append(line(".")+1, "title:      \"title\"")
        call append(line(".")+2, "subtitle:   \"subtitle\"")
        call append(line(".")+3, "date:       ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, "author:     \"xiaoh\"")
        call append(line(".")+5, "header-img: \"img/post-bg-default.jpg\"")
        call append(line(".")+6, "tags:")
        call append(line(".")+7, "    - tag")
        call append(line(".")+8, "\---")
        call append(line(".")+9, "")
        call append(line(".")+10, "\### 目录")
        call append(line(".")+11, "")
        call append(line(".")+12, "\---")
        call append(line(".")+13, "")
        call append(line(".")+14, "> ")
        call append(line(".")+15, "")
        call append(line(".")+16, "\---")
        call append(line(".")+17, "")
    endif
endfunc

autocmd BufNewFile * normal G

