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
    "williamboman/mason.nvim", event = "VeryLazy", build = ":MasonInstallAll",
    opts = function()
      return require "custom.configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig", event = "VeryLazy",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.nvim-lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim", event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
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
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "custom.configs.nvim-tree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
}

return plugins
