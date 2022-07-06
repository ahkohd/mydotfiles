if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'ur4ltz/surround.nvim'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'MunifTanjim/prettier.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'Pocco81/AutoSave.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'weilbith/nvim-code-action-menu'
  Plug 'psliwka/vim-smoothie'
  Plug 'kyazdani42/nvim-tree.lua'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'ahmedkhalf/project.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'}
  Plug 'tpope/vim-commentary'
  Plug 'mhinz/vim-startify'
  " Plug 'nvim-lua/lsp_extensions.nvim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  " Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'romgrk/barbar.nvim'
  Plug 'github/copilot.vim'
  Plug 'hrsh7th/cmp-path'
  Plug 'anuvyklack/hydra.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'TimUntersberger/neogit'
  Plug 'anuvyklack/keymap-layer.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Yggdroot/indentLine'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
