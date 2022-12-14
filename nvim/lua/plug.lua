local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'	--Albero file laterale
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	--SH per Nertree
Plug 'ryanoasis/vim-devicons'	--Icone per Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'onsails/lspkind.nvim'

--Temi

-- Plug 'morhetz/gruvbox'
-- Plug 'jacoborus/tender.vim'
-- Plug 'glepnir/oceanic-material'
Plug 'ntk148v/vim-horizon'
Plug 'nyoom-engineering/oxocarbon.nvim'
-- Plug ('sonph/onehalf', { rtp =  'vim' })

-- Status line
--Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'

--LS

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag= '0.1.0' })
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'benfowler/telescope-luasnip.nvim'

--debugger protocol
Plug 'mfussenegger/nvim-dap'

--ui debugger
Plug 'rcarriga/nvim-dap-ui'

--linter
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mfussenegger/nvim-lint'


Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-omni'
Plug 'saadparwaiz1/cmp_luasnip'

-- snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'iurimateus/luasnip-latex-snippets.nvim'
Plug 'rafamadriz/friendly-snippets'

Plug 'kdheepak/lazygit.nvim'
Plug 'f-person/git-blame.nvim'

--Pluglin per salvere file come root
Plug 'chrisbra/sudoedit.vim'

--autochiusura parentesi
-- Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'


Plug 'lukas-reineke/lsp-format.nvim'
Plug 'mhartington/formatter.nvim'

-- Latex Plugin
Plug 'lervag/vimtex'

Plug 'voldikss/vim-floaterm'

vim.call('plug#end')

