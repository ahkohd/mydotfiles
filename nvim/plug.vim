if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  " Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'ur4ltz/surround.nvim'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'MunifTanjim/prettier.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'weilbith/nvim-code-action-menu'
  " Plug 'psliwka/vim-smoothie'
  " Plug 'kyazdani42/nvim-tree.lua'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  " Plug 'ahmedkhalf/project.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'akinsho/toggleterm.nvim'
  " Plug 'tpope/vim-commentary'
  Plug 'numToStr/Comment.nvim'
  Plug 'mhinz/vim-startify'
  " Plug 'nvim-lua/lsp_extensions.nvim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  " Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'romgrk/barbar.nvim'
  Plug 'zbirenbaum/copilot.lua'
  Plug 'hrsh7th/cmp-path'
  Plug 'anuvyklack/hydra.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'NeogitOrg/neogit'
  Plug 'anuvyklack/keymap-layer.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'akinsho/git-conflict.nvim'
  Plug 'chentoast/marks.nvim'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'windwp/nvim-spectre'
  Plug 'phaazon/hop.nvim'
  Plug 'vim-test/vim-test'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'AckslD/nvim-neoclip.lua'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'rebelot/heirline.nvim'
  Plug 'kevinhwang91/promise-async'
  Plug 'kevinhwang91/nvim-ufo'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'axkirillov/hbac.nvim'
  Plug 'f-person/git-blame.nvim'
  Plug 'zbirenbaum/copilot-cmp'
  Plug 'luukvbaal/statuscol.nvim'
  Plug 'stevearc/oil.nvim'
  Plug 'xbase-lab/xbase', { 'do': 'make install' }
  Plug 'ThePrimeagen/harpoon'
  Plug 'christoomey/vim-tmux-navigator'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
