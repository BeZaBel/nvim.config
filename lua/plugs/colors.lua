return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("setup.catppuccin").setup("mocha")
		end,
	},
}
