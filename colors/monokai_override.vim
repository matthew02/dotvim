highlight NonText ctermfg=237 guifg=#64645e
highlight SpecialKey ctermfg=237 guifg=#64645e

" Hide non-leading spaces (can still be seen when highlighted)
highlight HiddenSpaces ctermfg=234 guifg=#272822
match HiddenSpaces /\v\S\zs\s+/
