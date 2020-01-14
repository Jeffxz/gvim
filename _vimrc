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
Plugin 'w0rp/ale'
Plugin 'Quramy/tsuquyomi'
" Still use the one in plugin folder to keep C-x working
" Plugin 'preservim/nerdcommenter'

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
" autocmd FileType html :set indentexpr=
" autocmd FileType xhtml :set indentexpr=

" ------------------------------------------------------------------------------
" width of indent
autocmd FileType xhtml :set sw=2
autocmd FileType html :set sw=2
autocmd FileType typescript :set sw=2 ts=2

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
if has('win32')
  let g:OmniSharp_server_path = 'C:\tools\omnisharp\omnisharp-win-x64\OmniSharp.exe'
end
" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Update semantic highlighting after all text changes
let g:OmniSharp_highlight_types = 3
" Update semantic highlighting on BufEnter and InsertLeave
" let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

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
set wildmenu
set wildmode=list:longest
set hidden
set autoread

set fileformats=unix,dos,mac
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

" move to cursor last time left from
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
" display character for tab and new line
set listchars=tab:~\ ,extends:<,trail:-,eol:_
set list

" ------------------------------------------------------------------------------
" cursor move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

nmap ye :let @"=expand("<cword>")<CR>

" yankring setting
let g:yankring_persist = 0

" ------------------------------------------------------------------------------
" fold
set foldmethod=syntax
autocmd FileType javascript :set foldmethod=indent
autocmd FileType yaml :set foldmethod=indent
autocmd FileType java :set foldmethod=indent


" ------------------------------------------------------------------------------
" use clipboard
if has('GUI')
   set clipboard=unnamed
endif

" ------------------------------------------------------------------------------
"  map
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
" tags
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
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
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


