return {
    {
        -- To write somethings else than code
        "preservim/vim-pencil",
        ft = "markdown",
        init = function()
            require("setup.vim-pencil").setup()
        end,
    },
    {
        -- Markdown editing
        "antonk52/markdowny.nvim",
        ft = "markdown",
        config = function()
            require("setup.markdowny").setup()
        end,
    },
    {
        "preservim/vim-markdown",
        dependencies = { "godlygeek/tabular" },
        ft = "markdown",
        init = function()
            require("setup/vim-markdown").setup()
        end,
    },
    {
        -- Automatic formatting
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("setup.conform").setup()
        end,
    },
    {
        -- Obsidian integration
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        config = function()
            require("setup.obsidian").setup()
        end,
    },
    {
        -- Paste images from clipboard
        "HakonHarnes/img-clip.nvim",
        cmd = "PasteImage",
        config = function()
            require("setup.img-clip").setup()
        end,
    },
    {
        -- C-a C-x to change true to false, top to bottom, or viceversa
        "nat-418/boole.nvim",
        config = function()
            require("setup.boole").setup()
        end,
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
    {
        -- Make nice commented boxes with unicode characters
        "LudoPinelli/comment-box.nvim",
        config = function()
            require("setup.comment-box").setup()
        end,
    },
}
