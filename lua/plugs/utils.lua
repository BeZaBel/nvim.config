return {
    {
        "stevearc/conform.nvim",
        config = function ()
            require("setup.conform").setup()
        end
    },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = require("setup.autopairs").setup
	},
	{
		-- Markdown editing
		"antonk52/markdowny.nvim",
		ft = "markdown",
		config = require("setup.markdowny").setup
	},
    {
        "nvimdev/lspsaga.nvim",
        config = require("setup.lspsaga").setup,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        config = require("setup.obsidian").setup
    },
	{
		-- Change the surrounding elements of things
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
            require("nvim-surround").setup()
        end,
	},
	{
		-- gc to comment line or selection
		"numToStr/Comment.nvim",
		opts = {},
	},
}
