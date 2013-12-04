"Get out of VI's compatible mode..
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'gmarik/github-search.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'gmarik/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/javacomplete'
Bundle 'vim-scripts/genutils'
Bundle 'vim-scripts/lookupfile'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/Screen-vim---gnu-screentmux'
Bundle 'cordarei/vim-cpp'
Bundle 'vim-scripts/xml.vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/ZoomWin'
Bundle 'xandox/vim-csharp'
Bundle 'uggedal/go-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'derekwyatt/vim-scala'
Bundle 'tfnico/vim-gradle'
Bundle "pangloss/vim-javascript"
Bundle 'scottmcginness/vim-jquery'
Bundle 'kchmck/vim-coffee-script'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle "honza/vim-snippets"
Bundle 'corntrace/bufexplorer'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'mattn/emmet-vim'
Bundle 'slim-template/vim-slim'
Bundle 'nelstrom/vim-qargs'
Bundle 'tpope/vim-abolish'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable filetype plugin
filetype plugin indent on

" Sets how many lines of history VIM har to remember
set history=400

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,cp936,big5,euc-jp,euc-kr,latin1

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write when :! or :make met
set autowrite

" Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","
noremap \ ,

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

"Fast redraw
nmap <silent> <leader>rr :redraw!<cr>

" Switch to buffer according to file name
function! SwitchToBuf(filename)
  " find in current tab
  let bufwinnr = bufwinnr(a:filename)
  if bufwinnr != -1
    exec bufwinnr . "wincmd w"
    return
  else
    " find in each tab
    tabfirst
    let tab = 1
    while tab <= tabpagenr("$")
      let bufwinnr = bufwinnr(a:filename)
      if bufwinnr != -1
        exec "normal " . tab . "gt"
        exec bufwinnr . "wincmd w"
        return
      endif
      tabnext
      let tab = tab + 1
    endwhile

    " not exist, new tab
    exec "tabnew " . a:filename
  endif
endfunction

"Fast edit vimrc
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

"Fast editing of .vimrc
map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 256 color
set t_Co=256

" Set font
if has("gui_running")
  set guifont=Monaco:h14
endif

" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
  "Enable syntax hl
  syntax enable

  " color scheme
  if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    colorscheme lucius
  else
    if &t_Co > 255 " support 256 color
      colorscheme lucius
    else
      colorscheme desert
    endif "suport
  endif " has
endif " exists(...)

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=c<cr>
map <leader>2 :set syntax=cpp<cr>
map <leader>3 :set syntax=ruby<cr>
map <leader>4 :set syntax=java<cr>
map <leader>5 :set syntax=sh<cr>
map <leader>6 :set syntax=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ff=unix

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 1 high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Set backspace
set backspace=eol,start,indent

"Backspace and cursor keys wrap to
set whichwrap+=<,>

" Include search
set incsearch

" Ignore case when searching
set ignorecase

" Case sensitile when search pattern includes UpperCase
set smartcase

" Highlight search things
set hlsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always show the statusline
set laststatus=2
set statusline=%f%m%r%h%w\ %=%([%{&ff}\][%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}\]%y%)\ \ %([%l,%v]\[%P]\ %)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab configuration
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

" Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i

" Switch to current dir
map <silent> <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! DeleteTrailingWhiteSpace()
  exe "normal mz"
  %s/\s\+$//ge
  nohl
  exe "normal `z"
endfunc

nmap <silent> <leader>ws :call DeleteTrailingWhiteSpace()<cr>:w<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <leader>es :tabnew<cr>:setl buftype=nofile<cr>
map <leader>ec :tabnew ~/tmp/scratch.txt<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Don't close window, when deleting a buffer
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
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set expandtab

set shiftwidth=4
map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

au FileType html,vim,sh,xml,ruby,eruby,groovy,coffee,javascript,css setl shiftwidth=2
au FileType html,vim,sh,xml,ruby,eruby,groovy,coffee,javascript,css setl tabstop=2

au FileType java,c,python,php setl shiftwidth=4
au FileType java,c,python,php setl tabstop=4

au FileType txt setl lbr
au FileType txt setl tw=78

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options
set completeopt=menu
set complete-=u
set complete-=i

" Enable syntax
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   
""""""""""""""""""""""""""""""
" bufexplorer setting
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerMaxHeight=13        " Max height

""""""""""""""""""""""""""""""
" tagbar setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>tb :TagbarToggle<cr>

""""""""""""""""""""""""""""""
" Nerd Tree setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>nt :NERDTreeToggle<cr>
let NERDTreeDirArrows=0

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
  let g:LookupFile_TagExpr = '"./filenametags"'
endif

nmap <silent> <leader>lk <Plug>LookupFile<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
  let _tags = &tags
  try
    let &tags = eval(g:LookupFile_TagExpr)
    let newpattern = '\c' . a:pattern
    let tags = taglist(newpattern)
  catch
    echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
    return ""
  finally
    let &tags = _tags
  endtry

  " Show the matches for what is typed so far.
  let files = map(tags, 'v:val["filename"]')
  return files
endfunction

let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

""""""""""""""""""""""""""""""
" OmniCppComplete setting
""""""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" HTML related
""""""""""""""""""""""""""""""
au FileType html set ft=xml
au FileType html set syntax=html

" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

"""""""""""""""""""""""""""""""
" Vim section
"""""""""""""""""""""""""""""""
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

""""""""""""""""""""""""""""""
" C/C++
"""""""""""""""""""""""""""""""
autocmd FileType c,cpp  map <buffer> <leader><space> :make<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Quickfix
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

function! s:GetVisualSelection()
  let save_a = @a
  silent normal! gv"ay
  let v = @a
  let @a = save_a
  let var = escape(v, '\\/.$*')
  return var
endfunction

" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>
nmap <silent> <leader>pa :set paste<cr>
nmap <silent> <leader>np :set nopaste<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1

nmap <silent> <leader>rp :!python %<cr>
nmap <silent> <leader>rs :!scala %<cr>
nmap <silent> <leader>rk :!ruby path_to_enlightenment.rb<cr>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
cnoremap <expr> %% getcmdtype() == ":" ? expand("%:h")."/" : "%%"
