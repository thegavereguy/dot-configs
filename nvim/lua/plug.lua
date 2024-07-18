local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree' -- Albero file laterale
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' -- SH per Nertree
Plug 'ryanoasis/vim-devicons' -- Icone per Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'onsails/lspkind.nvim'

-- Temi

Plug 'lunarvim/horizon.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
-- Plug ('sonph/onehalf', { rtp =  'vim' })

-- Status line
-- Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'

-- format
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mhartington/formatter.nvim'

-- LS
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug('j-hui/fidget.nvim', {tag = "legacy"}) -- lsp progress
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.x'})
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'benfowler/telescope-luasnip.nvim'

-- Ui customization
Plug 'stevearc/dressing.nvim'

-- debugger protocol
Plug 'mfussenegger/nvim-dap'

-- ui debugger
Plug 'rcarriga/nvim-dap-ui'

-- linter
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mfussenegger/nvim-lint'

Plug 'Civitasv/cmake-tools.nvim'
-- completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'folke/neodev.nvim'
Plug 'saecki/crates.nvim'

-- snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'iurimateus/luasnip-latex-snippets.nvim'
Plug 'rafamadriz/friendly-snippets'

-- Git
Plug 'kdheepak/lazygit.nvim'
Plug 'f-person/git-blame.nvim'

-- Pluglin per salvere file come root
Plug 'chrisbra/sudoedit.vim'

-- autochiusura parentesi
-- Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

-- Latex Plugin
Plug 'lervag/vimtex'
Plug 'jakewvincent/texmagic.nvim'

Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'

-- Plug 'simrat39/rust-tools.nvim'
Plug 'thegavereguy/rust-tools.nvim'

-- Arduino
Plug 'stevearc/vim-arduino'
Plug 'edKotinsky/Arduino.nvim'

-- orgmode
Plug 'nvim-orgmode/orgmode'

-- copilot
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

-- Comment
Plug 'numToStr/Comment.nvim'

Plug 'nvim-neotest/nvim-nio'

vim.call('plug#end')
