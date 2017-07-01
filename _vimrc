source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()

syntax enable
set background=light
colorscheme solarized

set number
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4 "缩进长度
set tabstop=4 "tab键长度
set expandtab "tab设为空格
set ruler "在右下角显示当前行信息
set incsearch "搜索加强
set hlsearch "搜索高亮
set guioptions-=T "一出工具栏
set showcmd "显示出输入的命令
set lines=55 "窗口多长，下为多宽
set columns=100
set cmdheight=2 "命令行高度加1
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"enable auto-complete every time a HTML file is opened
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"插件管理
set rtp+=C:\Users\asus\.vim\bundle\Vundle.vim\
call vundle#begin('C:\Users\asus\.vim\bundle\')
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"语法
Plugin 'chemzqm/unite-js-func'
" unite is requried
Plugin 'Shougo/unite.vim'
" vimproc is required by unite
Plugin 'Shougo/vimproc'

"html css 语法
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'

"es6
Plugin 'isRuslan/vim-es6'
Bundle 'scrooloose/nerdtree'

"括号 引号自动补全
Plugin 'Raimondi/delimitMate'

"eslint  
Plugin 'vim-syntastic/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'justinj/vim-react-snippets'
Plugin 'pangloss/vim-javascript'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'

Plugin 'mxw/vim-jsx'

" Ultisnips
Bundle "SirVer/ultisnips"

" Other sets of snippets (optional):
Bundle "honza/vim-snippets"

let NERDTreeWinPos='right'
"设置宽度
let NERDTreeWinSize=33
map <F2> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1

let g:jsx_ext_required = 0


"支持高亮写在JavaScript中的CSS和HTML
let javascript_enable_domhtmlcss = 1

call vundle#end()
filetype plugin indent on
