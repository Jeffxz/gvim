" vim: set fenc=utf-8 fdm=marker ts=4 sw=4 sts=0:
" -----------------------------------------------------------------------------
" Vim Settings
" -----------------------------------------------------------------------------

set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" -----------------------------------------------------------------------------
" for vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
" Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'

" Generic Programming Support 
" Plugin 'jakedouglas/exuberant-ctags'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'
Plugin 'udalov/kotlin-vim'
Plugin 'tfnico/vim-gradle'
Plugin 'hsanson/vim-android'
Plugin 'taglist.vim'

" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Theme / Interface
Plugin 'AnsiEsc.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'NLKNguyen/papercolor-theme'

" Programming support
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plugin 'OmniSharp/omnisharp-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" -----------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set textwidth=0   " Don't wrap words by default
set nobackup    " Don't keep a backup file
set viminfo='50,<1000,s100,\"50 " read/write a .viminfo file, don't store more than
" set viminfo='50,<1000,s100,:0,n~/.vim/viminfo
set history=10000   " keep 10000 lines of command line history
set ruler   " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" ------------------------------------------------------------------------------
" Enabled file type detection
" Use the default filetype settings. If you also want to load indent files
" to automatically do language-dependent indenting add 'indent' as well.
filetype plugin on
set ofu=syntaxcomplete#Complete
" Using indent based on file type
filetype indent on
" これらのftではインデントを無効に
" autocmd FileType php filetype indent off
" autocmd FileType php :set indentexpr=
" autocmd FileType html :set indentexpr=
" autocmd FileType xhtml :set indentexpr=

" ------------------------------------------------------------------------------
" width of indent
autocmd FileType xhtml :set sw=2
autocmd FileType html :set sw=2

" ------------------------------------------------------------------------------
" Programming Support
"
" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" OmniSharp
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
if has('unix') || has('macunix')
  let g:OmniSharp_server_use_mono = 1
endif

" set modelines=0

" set indent
set smartindent
" set autoindent

" ------------------------------------------------------------------------------
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
function! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
function! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" ------------------------------------------------------------------------------
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" コマンドライン補間をシェルっぽく
set wildmode=list:longest
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread

" ------------------------------------------------------------------------------
" 文字コード関連
" from ずんWiki http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" if &encoding !=# 'utf-8'
  " set encoding=japan
" endif
" set fileencoding=japan
" if has('iconv')
  " let s:enc_euc = 'euc-jp'
  " let s:enc_jis = 'iso-2022-jp'
  " " iconvがJISX0213に対応しているかをチェック
  " if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    " let s:enc_euc = 'euc-jisx0213'
    " let s:enc_jis = 'iso-2022-jp-3'
  " endif
  " " fileencodingsを構築
  " if &encoding ==# 'utf-8'
    " let s:fileencodings_default = &fileencodings
    " let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    " let &fileencodings = &fileencodings .','. s:fileencodings_default
    " unlet s:fileencodings_default
  " else
    " let &fileencodings = &fileencodings .','. s:enc_jis
    " set fileencodings+=utf-8,ucs-2le,ucs-2
    " if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
      " set fileencodings+=cp932
      " set fileencodings-=euc-jp
      " set fileencodings-=euc-jisx0213
      " let &encoding = s:enc_euc
    " else
      " let &fileencodings = &fileencodings .','. s:enc_euc
    " endif
  " endif
  " " 定数を処分
  " unlet s:enc_euc
  " unlet s:enc_jis
" endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" cvs,svnの時は文字コードをeuc-jpに設定
" autocmd FileType cvs :set fileencoding=euc-jp
" autocmd FileType svn :set fileencoding=utf-8

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

" set tags
" if has("autochdir")
" set autochdir
set tags=tags
" else
"  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
" endif

" ------------------------------------------------------------------------------
" 辞書ファイルからの単語補間
autocmd FileType actionscript set omnifunc=actionscriptcomplete#CompleteAS
autocmd FileType actionscript :set dictionary=$HOME/.vim/dict/actionscript.dict

" ------------------------------------------------------------------------------
" PEAR & includes
" autocmd FileType php :set path+=c:/php/pear,c:/php/includes

" ------------------------------------------------------------------------------
" :makeでPHP構文チェック
" autocmd FileType php :set makeprg=php\ -l\ %
" autocmd FileType php :set errorformat=%m\ in\ %f\ on\ line\ %l

" ------------------------------------------------------------------------------
" PHP fileencoding UTF-8
" autocmd FileType php :set fileencoding=utf-8

" ------------------------------------------------------------------------------
" 文字列中のSQLクエリをハイライト
" let php_sql_query=1
" 文字列中のHTMLをハイライト
" let php_htmlInStrings=1
" ショートタグ(<?)を無効にする(ハイライト除外)
" let php_noShortTags=1
" クラスと関数のfoldingを無効にする
" let php_folding=1

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" ------------------------------------------------------------------------------
" mapleader
let mapleader = ","

" ------------------------------------------------------------------------------
" nmap <Space> :MBEbn<CR>
" nmap <S-Space> :MBEbp<CR>
nmap <Space> :bn<CR>
nmap <S-Space> :bp<CR>
nnoremap <Leader>s :IncBufSwitch<CR>
nnoremap <Leader><C-s> :IncBufSwitch<CR>

" vsplit, split
nmap <Leader>c :close<CR>
nmap <Leader>v :vsplit<CR>
nmap <Leader>s :split<CR>

" ------------------------------------------------------------------------------
" code2html
let html_use_css = 1

" SeeTab
let g:SeeTabCtermFG="black"
let g:SeeTabCtermBG="red"

" ------------------------------------------------------------------------------
" html escape function
:function! HtmlEscape()
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
:endfunction
" :command! HtmlEscape :call HtmlEscape()

:function! HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
:endfunction
" :command! HtmlUnEscape :call HtmlUnEscape()


" -----------------------------------------------------------------------------
" 検索関連
"
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索結果文字列をハイライト
set hls
" IncrementalSearch
set incsearch

" -----------------------------------------------------------------------------
" turn on syntax
if exists("syntax")
    syntax on
endif

" Show linenumbers
set number
set ruler

" Set proper tabs
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set showcmd

set showmatch

set laststatus=2

if winwidth(0) >= 120
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

" ------------------------------------------------------------------------------
" どの文字でタブや改行を表示するかを設定
set listchars=tab:~\ ,extends:<,trail:-,eol:_

" listcharsで指定した文字でタブ・改行・行末スペース・行末を表示する
set list

" ------------------------------------------------------------------------------
" 表示行単位で行移動する
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

" フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-

" C-]でtjと同等の効果
nmap <C-]> g<C-]>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye :let @"=expand("<cword>")<CR>

" ------------------------------------------------------------------------------
" eregex.vim
" / で行なう通常の検索と :M/ を入れ替える。
" nnoremap / :M/
" nnoremap ,/ /

" command mode 時 tcsh風のキーバインドに
cmap <C-a> <Home>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-d> <Delete>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>
cnoremap  


" yankring setting
let g:yankring_persist = 0

" ------------------------------------------------------------------------------
" 補完候補の色づけ for vim7
hi Pmenu ctermbg=9
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=3

" ------------------------------------------------------------------------------
" increment.vim
" 矩形選択中に<C-A>で連番になるようにインクリメントする
vnoremap <C-A> :Inc<CR>

" ------------------------------------------------------------------------------
" 折り畳み
set foldmethod=syntax
autocmd FileType php :set foldmethod=indent
autocmd FileType javascript :set foldmethod=indent
autocmd FileType yaml :set foldmethod=indent
autocmd FileType actionscript :set foldmethod=indent
autocmd FileType perl :set foldmethod=indent
autocmd FileType java :set foldmethod=indent


" ------------------------------------------------------------------------------
" GUIのクリップボードを使う
" if has('GUI')
"    set clipboard=unnamed
" endif

" ------------------------------------------------------------------------------
"  map
"  自動補完
imap <C-Space> <C-x><C-o>

" ------------------------------------------------------------------------------
" NERDCommenter
" toggleComment
" nmap <Leader>x ,c<Space>
" vmap <Leader>x ,c<Space>

let NERDShutUp = 1
let NERDSpaceDelims = 1
map <C-x> ,c<space>

" ------------------------------------------------------------------------------
" CapsLockをCtrlにしていると<C-X>が押しにくいため
"  modeに<C-S>でも入れるようにする
inoremap <C-S> <C-X>

" omni completionへのショートカット
inoremap <C-F> <C-X><C-O>

" ------------------------------------------------------------------------------
" Emacs Like Key Bind
inoremap <C-A> <Home>
inoremap <C-B> <Left>
" inoremap <C-D> <Del>
inoremap <C-F> <Right>
inoremap <C-E> <End>

" ------------------------------------------------------------------------------
" migemo辞書設定
if has('migemo')
    set migemo
    set migemodict=$VIM/vimfiles/migemo_dict/migemo-dict
endif

" ------------------------------------------------------------------------------
" <C-\>でIME切替
if has('win32')
    inoremap  
    cnoremap  
endif

" ------------------------------------------------------------------------------
" tagsの生成
" function! Ctags()
    " if &filetype == 'cpp'
        " :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.cpp *.h *.hpp
    " elseif &filetype == 'php'
        " :!ctags -R --PHP-kinds=+cf-v *.php
    " else
        " :!ctags -R *.*
    " endif
" endfunction
" :command! Ctags :call Ctags()
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" ------------------------------------------------------------------------------
" vimperatorrcのfiletype
autocmd BufRead,BufNewFile .vimperatorrc set filetype=vimperator

" ------------------------------------------------------------------------------
" insert mode中の<C-@>誤発動対策
inoremap <C-@> <Nop>

" ------------------------------------------------------------------------------
" session save & load function
" function! Mks()
"    :mks! $home\Session.vim
" endfunction
" :command! Mks :call Mks()
"
" function! Ses()
"    :so $home\Session.vim
"    :so $vim\_vimrc
"    :so $vim\_gvimrc
" endfunction
" :command! Ses :call Ses()

" ------------------------------------------------------------------------------
" backup
" set backup
" set backupdir=$home/.vim/tmp
" let file = strftime(".%Y%m%d%H%M%S", localtime())
" exe "set backupext=".file
" unlet file

" ------------------------------------------------------------------------------
" 関数移動の後にzz
nnoremap [[ [[zt<C-y><C-y>
nnoremap [] []zb<C-e><C-e>
nnoremap ]] ]]zt<C-y><C-y>
nnoremap ][ ][zb<C-e><C-e>

" ------------------------------------------------------------------------------
" FZF

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" mappings
nmap <Leader>b :Buffers<CR>
nnoremap <Leader>f :ProjectFiles<CR>
nmap <Leader>h :History<CR>
nmap <Leader>g :GFiles?<CR>

" ------------------------------------------------------------------------------
" NERDTree
nmap <Leader>n :NERDTree<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

" ------------------------------------------------------------------------------
" taglist.vim
nmap <F7> :Tlist<CR>
nmap <C-F7> :TlistClose<CR>

" ------------------------------------------------------------------------------
" mapleader
let mapleader =","
map <silent><leader>ss :source ~/_vimrc<cr>
map <silent><leader>ee :e ~/_vimrc<cr>

" ------------------------------------------------------------------------------
" set current folder
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" ------------------------------------------------------------------------------
" patchreview.vim
" let g:patchreview_filterdiff = '/usr/local/bin/filterdiff'

" ------------------------------------------------------------------------------
" calender.vim (with QFixHowm)
" let g:calendar_diary="P:\001_Daily"
" need QFixHowm
" let calendar_holidayfile = 'P:\howm\Sche-Hd-0000-00-00-000000.howm'
let calendar_action = "QFixHowmCalendarDiary"
let calendar_sign   = "QFixHowmCalendarSign"

" ------------------------------------------------------------------------------
" QFixHowm

let QFixHowm_Key = 'g'

" setup howm dir
let howm_dir             = 'P:\howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'


