local plugins = {
  {
    'glepnir/dashboard-nvim', cmd = 'Dashboard', event = 'VimEnter', dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      return require "custom.configs.dashboard-nvim"
    end,
  },
  -- {
  --   "goolord/alpha-nvim", event = "VimEnter", cmd = "Alpha",
  --   config = function ()
  --     return require "custom.configs.alpha-nvim"
  --   end
  -- },
  {
    'Shatur/neovim-session-manager', lazy = false, -- event = 'VimEnter',
    config = function()
      require('session_manager').setup({
        autoload_mode = 'Disabled' -- What to do when started without arguments [Disabled, CurrentDir, LastSession].
      })
    end,
  },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "kdheepak/lazygit.nvim", event = "VeryLazy", dependencies = {"nvim-lua/plenary.nvim"} },
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = true, -- event = "VeryLazy",
    config = function()
      return require "custom.configs.nvim-treesitter"
    end,
  },
  {
    "williamboman/mason.nvim", ft = {"tf", "terraform"}, build = ":MasonInstallAll",
    opts = function()
      return require "custom.configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig", ft = {"tf", "terraform"}, -- event = "VeryLazy",
    config = function()
      return require "custom.configs.nvim-lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim", ft = {"tf", "terraform"}, -- event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
	{
		"mg979/vim-visual-multi", branch = "master", event = "VeryLazy",
		init = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Find Subword Under"] = "<C-d>",
				["Visual All"] = "<C-a>",
			}
		end,
	},
  {
    "NvChad/nvterm",
    opts = function()
      return require "custom.configs.nvterm"
    end,
  },
  { 
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      return require "custom.configs.indent-blankline"
    end,
  },
  { 
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "custom.configs.gitsigns"
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      return require "custom.configs.which-key"
    end,
  },
}

return plugins
