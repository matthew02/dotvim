highlight NonText ctermfg=236 guifg=#383a3e
highlight SpecialKey ctermfg=236 guifg=#383a3e

" Hide non-leading spaces (can still be seen when highlighted)
highlight HiddenSpaces ctermfg=234 guifg=#272822
match HiddenSpaces /\v\S\zs\s+/
