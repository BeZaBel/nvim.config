return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		config = require("setup.render-markdown").setup,
	},
	{
		-- LaTeX wrinting
		"lervag/vimtex",
		ft = "tex",
		config = require("setup.vimtex").setup,
	},
	{
		-- Lisp like languages auto parenthesis
		"eraserhd/parinfer-rust",
		build = "cargo build --release",
		ft = {
			"scm",
			"yuck",
		},
	},
	{
		-- R development
		"R-nvim/R.nvim",
		dependencies = { "R-nvim/cmp-r" },
		lazy = false,
		config = require("setup.rnvim").setup,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = require("setup.gitsigns").setup,
	},
}
