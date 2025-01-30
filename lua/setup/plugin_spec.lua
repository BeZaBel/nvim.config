return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = require("setup.treesitter").setup,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "xiyaowong/telescope-emoji.nvim",
                lazy = true,
            },
        },
        config = require("setup.telescope").setup,
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            "R-nvim/cmp-r",
        },
        config = require("setup.cmp").setup,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = require("setup.lspconf").setup,
    },
    {
        "nvimdev/lspsaga.nvim",
        config = require("setup.lspsaga").setup,
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = require("setup.mason").setup,
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        config = require("setup.oil").setup,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = require("setup.flash").keys,
        config = require("setup.flash").setup,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = require("setup.which-key").setup,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        lazy = false,
        priority = 1000,
        event = "BufEnter",
        config = require("setup.rainbow-delimiters").setup,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            require("setup.conform").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "lervag/vimtex",
        ft = "tex",
        config = require("setup.vimtex").setup,
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
    },
    {
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            ---@type CompileModeOpts
            vim.g.compile_mode = {
                baleia_setup = true,
            }
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = require("setup.noice").setup,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup({
                input = {
                    title_pos = "center",
                    relative = "win",
                    prefer_width = 0.4,
                },
            })
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        config = require("setup.rendermarkdown").setup,
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "tadmccorkle/markdown.nvim",
        ft = { "markdown" },
        keys = {
            { "<leader>mt", "<cmd>MDTaskToggle<cr>", desc = "Toggle task" },
        },
        opts = {},
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = require("setup.snacks").opts,
        keys = require("setup.snacks").keys,
        init = require("setup.snacks").init,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        "numToStr/comment.nvim",
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "hkupty/iron.nvim",
        config = require("setup.iron").setup,
        fg = "python",
        keys = require("setup.iron").keys,
    },
    -- {
    --     "RRethy/base16-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("base16-colorscheme").with_config({
    --             telescope = true,
    --             cmp = true,
    --         })
    --         vim.cmd("colorscheme base16-everforest")
    --
    --         -- Set transparent background (should be called after colorscheme setup)
    --         -- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    --
    --         -- Optional: For better transparency consistency
    --         -- vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    --         -- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
    --     end,
    -- },
    {
        "nvimdev/zephyr-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("zephyr")
            vim.cmd("colorscheme zephyr")
        end,
    },
    {
        "atiladefreitas/lazyclip",
        config = function()
            require("lazyclip").setup()
        end,
        keys = {
            { "<leader>Cw", ":lua require('lazyclip').show_clipboard()<CR>", desc = "Open Clipboard Manager" },
        },
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = { -- Keys to be mapped to their corresponding default scrolling animation
                    "<C-u>",
                    "<C-d>",
                    "<C-b>",
                    "<C-f>",
                    "<C-y>",
                    "<C-e>",
                    "zt",
                    "zz",
                    "zb",
                },
                hide_cursor = false, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing = "linear", -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
                performance_mode = false, -- Disable "Performance Mode" on all buffers.
                ignored_events = { -- Events ignored while scrolling
                    "WinScrolled",
                    "CursorMoved",
                },
            })
        end,
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
}
