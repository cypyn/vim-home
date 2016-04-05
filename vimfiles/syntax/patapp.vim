" Vim syntax file
" Language: Patent Applications
" Maintainer: Nathan DeVries
" Latest Revision: 2015-07-14

" Turn this if statement off -- want to append this syntax to another syntax
"if exists("b:current_syntax")
"  finish
"endif

syn match ref_num '\v<\d+>'

syn match Figures '\vFig\.'
syn match Figures '\vFigs\.'
syn keyword Figures Figure

syn match Headings '\v^[Tt]echnical\W[Ff]ield.*'
syn match Headings '\v^[Bb]ackground.*'
syn match Headings '\v^[Ss]ummary.*'
syn match Headings '\v^[Bb]rief.*[Dd]rawings.*'
syn match Headings '\v^[Dd]escription.*'
syn match Headings '\v^[Cc]laims.*'
syn match Headings '\v^[Aa]bstract.*'

"syn match celTodo  '\v\[[^\]]+\]'

"syn match celComments '\v^\/\/.*'
syn match celUnderline '\v\+\+[^\+]+\+\+'
syn match celStrike '\v\~\~[^\~]+\~\~'
syn match celStrike '\v\[\[[^\]]+\]\]'

hi def link ref_num     Constant
hi def link Figures     Type
hi celUnderline guifg=green gui=bold,underline
hi celStrike guifg=red gui=italic
"hi def link Headings    Statement
"hi def link celTodo     Todo
"hi def link celComments Comment


