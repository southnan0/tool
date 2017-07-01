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
set shiftwidth=4 "��������
set tabstop=4 "tab������
set expandtab "tab��Ϊ�ո�
set ruler "�����½���ʾ��ǰ����Ϣ
set incsearch "������ǿ
set hlsearch "��������
set guioptions-=T "һ��������
set showcmd "��ʾ�����������
set lines=55 "���ڶ೤����Ϊ���
set columns=100
set cmdheight=2 "�����и߶ȼ�1
" �����ñ��������Ч
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" �رռ���ģʽ
set nocompatible
" vim ����������ģʽ���ܲ�ȫ
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


"�������
set rtp+=C:\Users\asus\.vim\bundle\Vundle.vim\
call vundle#begin('C:\Users\asus\.vim\bundle\')
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"�﷨
Plugin 'chemzqm/unite-js-func'
" unite is requried
Plugin 'Shougo/unite.vim'
" vimproc is required by unite
Plugin 'Shougo/vimproc'

"html css �﷨
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'

"es6
Plugin 'isRuslan/vim-es6'
Bundle 'scrooloose/nerdtree'

"���� �����Զ���ȫ
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
"���ÿ��
let NERDTreeWinSize=33
map <F2> :NERDTreeToggle<CR>
" ��ʾ�к�
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" �Ƿ���ʾ�����ļ�
let NERDTreeShowHidden=1
" ���ն�����vimʱ������NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" ����һ���ļ�����ʾ
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" ��ʾ��ǩ�б�
let NERDTreeShowBookmarks=1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1

let g:jsx_ext_required = 0


"֧�ָ���д��JavaScript�е�CSS��HTML
let javascript_enable_domhtmlcss = 1

call vundle#end()
filetype plugin indent on
