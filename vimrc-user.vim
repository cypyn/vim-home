set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/$VIMDIR/vimfiles/bundle/Vundle.vim
let path='$HOME/$VIMDIR/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
"
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'taglist'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/syntastic'
Plugin 'craigemery/vim-autotag'
Plugin 'taglist-plus'
Plugin 'jistr/vim-nerdtree-tabs'
"Nerdtree
Plugin 'scrooloose/nerdtree'
"Vim thesaurus
Plugin 'beloglazov/vim-online-thesaurus'
"Lightweight auto-correction
Plugin 'reedes/vim-litecorrect'
" Markdown folding by heading
Plugin 'nelstrom/vim-markdown-folding'
" Supertab Word complete
Plugin 'vim-scripts/supertab'
" Vim-signature -- bookmark display handling
Plugin 'kshenoy/vim-signature'


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
" Put your non-Plugin stuff after this line

" Insert vim_example
"
" " When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" End vim_example.vim

source $VIMRUNTIME/mswin.vim
behave mswin

if has("gui_running")
    set guifont=Consolas:h14:cANSI
    :cd c:\users\natha_000
    map <C-Tab> :bnext<cr>
    map <C-S-Tab> :bprevious<cr>
endif


set diffexpr=MyDiff()
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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" TAB AND WRAP CONTROL
set tabstop=4
set shiftwidth=4 softtabstop=4
set expandtab
filetype plugin indent on
"Turn on soft wraps, not hard wraps which insert lines
set textwidth=0
set wrap linebreak nolist
set linespace=5

" DISPLAY CONTROL
set display=lastline
set number " Turn on line numbers
"set nonumber " Turn off line numbers
set foldcolumn=1

" SPELL / GRAMMAR / THESAURAUS
set spell " Turn on spell checking
    " Thesaurus Lookup
nnoremap <silent> <localleader>t :OnlineThesaurusCurrentWord<CR>  

" PANDOC EXECUTION
" Execute file being edited with <Shift> + e:
map <buffer> <localleader>e :w<CR>:!python % <CR>
" <Shift-d> pandoc doc generation
map <buffer> <localleader>d :w<CR>:!pandoc -s -S --reference-docx="E:\vimhome\PandocReference.docx" -o "C:\Users\devrienj\Documents\Output.docx" -f markdown -t docx "%" <CR>
"map <buffer> <localleader>d :w<CR>:!pandoc -s -S -o "C:\Users\devrienj\Documents\Output.docx" -f markdown -t docx "%" <CR>
" <Shift-p> pandoc pdf generation
map <buffer> <localleader>p :w<CR>:!pandoc -s -S --number-sections -o "C:\Users\devrienj\Documents\Output.pdf" -f markdown -t latex "%" <CR>
" <Shift-h> pandoc html generation
map <buffer> <localleader>h :w<CR>:!pandoc -s -S --number-sections -o "C:\Users\devrienj\Documents\Output.html" -f markdown -t html "%" <CR>

set incsearch ignorecase hlsearch
source $VIMRUNTIME/colors/koehler.vim
"filetype plugin on
set ofu=syntaxcomplete#Complete

"Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!python % <CR>

" NerdTree commands, and automatically close vim when NERDTree is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeTabsToggle<CR>  

"MAP AND LINE NAVIGATION
noremap j gj
noremap k gk
" Up and down within wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"Editing
"Ctrl - Backspace -- delete backward word
imap <silent> <C-BS> <C-w>
"Ctrl - Del -- delete forward word
"imap <silent> <C-Del> <C-o>de
imap <silent> <C-Del> <C-o>dw
nmap <silent> <C-Del> dw
"nmap <silent> <C-Del> de
"Spacebar -- toggle folding
nnoremap <Space> za

"Open at last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Autosave on focus loss
au FocusLost * :wa

"Remove startup screen
set shortmess+=I

"Smartcase sensitive searching
set smartcase
set ignorecase

"Set backup and swap directors
set backupdir=$HOME/$VIMDIR/backup
set directory=$HOME/$VIMDIR/swap

"Auto set the active directory to the file opened
set autochdir

"Vim-litecorrect Config
augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
augroup END

"STATUS LINE
"Set StatusLine Options
set laststatus=2

"Wordcount -- taken from stackoverflow - Abslom Daak
function! WordCount()
   let lnum = 1
   let n = 0
   while lnum <= line('$')
       let n = n + len(split(getline(lnum)))
       let lnum = lnum + 1
   endwhile
   return n
endfunction

" SET THE STATUS LINE
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Color
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%{WordCount()}\ words

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" FORCE markdown recognition
"autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
"autocmd BufNewFile,BufReadPost *.txt source E:\vimhome\vimfiles\syntax\patapp.vim
