" codefocus-light.vim is a colorscheme that let you focus on the code, not on the
" syntax highlightning.
" See also codefocus.vim for a colorscheme with dark background.

set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "codefocus-light"

hi Normal      ctermfg=Black ctermbg=White
hi Comment     ctermfg=DarkGray
hi String      cterm=italic ctermfg=Black
hi Constant    cterm=NONE ctermfg=NONE
hi Identifier  cterm=NONE ctermfg=NONE
hi Function    cterm=NONE ctermfg=NONE
hi Statement   cterm=NONE ctermfg=NONE
hi PreProc     cterm=NONE ctermfg=NONE
hi Type        cterm=NONE ctermfg=NONE
hi Special     cterm=NONE ctermfg=NONE
hi Delimiter   cterm=NONE ctermfg=NONE
hi ColorColumn ctermbg=LightGray
