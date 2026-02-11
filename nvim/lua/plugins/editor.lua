return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				defaults = { file_ignore_patterns = { ".git/", "node_modules/", "__pycache__/" } },
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "go", "typescript", "javascript", "bash", "json", "yaml", "toml" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function() require("which-key").setup() end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function() require("Comment").setup() end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function() require("nvim-autopairs").setup() end,
	},
}
