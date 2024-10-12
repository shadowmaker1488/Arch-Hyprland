set number
set clipboard=unnamedplus
colorscheme vim
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'




call plug#end()
lua require'colorizer'.setup()

nnoremap S :%s//g<Left><Left>

