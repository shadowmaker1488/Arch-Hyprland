set number
set clipboard=unnamedplus
colorscheme vim
set termguicolors
set spelllang=cs

" Příkazy

"České uvozovky
command! Uvozovky %s/"\([^"]\+\)"/„\1“/g

" Pluginy
call plug#begin('~/.local/share/nvim/plugged')

Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/vim-pencil'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Goyo funkce
function! s:goyo_enter()
	set linebreak
	set spell
	:SoftPencil 
endfunction

function! s:goyo_leave()
	set nolinebreak
	:PencilOff
	set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

call plug#end()
lua require'colorizer'.setup()

" Klávesové zkratky
nnoremap S :%s//g<Left><Left>
nnoremap <F6> :Goyo<CR>

" Airline počítadlo slov
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes ='\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'

" České uvozovky v Goyo
let g:czech_quote_state = 0

function! ToggleCzechQuote()
  if g:czech_quote_state == 0
    let g:czech_quote_state = 1
    return '„'
  else
    let g:czech_quote_state = 0
    return '“'
  endif
endfunction

augroup goyo_quotes
  autocmd!
  autocmd User GoyoEnter call CzechQuotesEnable()
  autocmd User GoyoLeave call CzechQuotesDisable()
augroup END

function! CzechQuotesEnable()
  " Přemapování " na české uvozovky – střídání dolní/vrchní
  inoremap <expr> " ToggleCzechQuote()
endfunction

function! CzechQuotesDisable()
  " Odmapování při opuštění Goyo
  iunmap "
endfunction

