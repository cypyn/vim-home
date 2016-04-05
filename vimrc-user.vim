if has ('gui_running')
	"set guifont=Cousine:h12:cANSI
	set guifont=DejaVu_Sans_Mono:h12:cANSI
	"set guifont=Lucida_Console:h12:cANSI

endif

if has('win32') || has('win64')
    set runtimepath=E:\vimhome\vimfiles,E:\vimhome,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
    let $HOME='E:\vimhome'
    let $VIMHOME='E:\vimhome\vimfiles'
endif


" Vundle Edits
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=E:\vimhome\vimfiles\bundle\Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('$VIMHOME\bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Pandoc and Vim
"Plugin 'vim-pandoc/vim-pandoc'

"Nerdtree
Plugin 'scrooloose/nerdtree'

"Wordy
Plugin 'reedes/vim-wordy'
"Vim Wheel
Plugin 'reedes/vim-wheel'
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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
"

" FORCE markdown recognition
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt source E:\vimhome\vimfiles\syntax\patapp.vim


" BACKUP and SWAP CONTROL

set backupdir=E:\vimhome\backup
set directory=E:\vimhome\swap

" TAB CONTROL
set tabstop=4 " Set the tab stop for python
set shiftwidth=4 " Number of space characters for indentation
set expandtab
filetype plugin indent on

" DISPLAY CONTROL

set number " Turn on line numbers
set nonumber " Turn on line numbers
set foldcolumn=1

" SPELL / GRAMMAR / THESAURUS
set spell " Turn on spell checking

" Execute file being edited with <Shift> + e:
map <buffer> <localleader>e :w<CR>:!python % <CR>
" <Shift-d> pandoc doc generation
map <buffer> <localleader>d :w<CR>:!pandoc -s -S --reference-docx="E:\vimhome\PandocReference.docx" -o "C:\Users\devrienj\Documents\Output.docx" -f markdown -t docx "%" <CR>
"map <buffer> <localleader>d :w<CR>:!pandoc -s -S -o "C:\Users\devrienj\Documents\Output.docx" -f markdown -t docx "%" <CR>
" <Shift-p> pandoc pdf generation
map <buffer> <localleader>p :w<CR>:!pandoc -s -S --number-sections -o "C:\Users\devrienj\Documents\Output.pdf" -f markdown -t latex "%" <CR>
" <Shift-h> pandoc html generation
map <buffer> <localleader>h :w<CR>:!pandoc -s -S --number-sections -o "C:\Users\devrienj\Documents\Output.html" -f markdown -t html "%" <CR>

" Thesaurus Lookup
nnoremap <silent> <localleader>t :OnlineThesaurusCurrentWord<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Up and down within wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

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

"Vim-litecorrect Config
augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
augroup END

"Wrap Control AND DISPLAY
set textwidth=0
set wrap
set linebreak "break on appropriate locations
set nolist " list disables linebreak
set linespace=5
set display=lastline

"Remove startup screen
set shortmess+=I

"Smartcase sensitive searching
set smartcase
set ignorecase

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


"function! WordCount()
"  let s:old_status = v:statusmsg
"  let position = getpos(".")
"  exe ":silent normal g\<C-g>"
"  let stat = v:statusmsg
"  let s:word_count = 0
"  if stat != '--No lines in buffer--'
"    let s:word_count = str2nr(split(v:statusmsg)[11])
"    let v:statusmsg = s:old_status
"  end
"  call setpos('.', position)
"  return s:word_count 
"endfunction

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




