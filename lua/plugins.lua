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
      {
        "nvim-telescope/telescope-symbols.nvim",
      },
    },
    config = require("setup.telescope").setup,
    keys = require("setup.telescope").keys,
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
    lazy = false,
    config = require("setup.lspsaga").setup,
    keys = require("setup.lspsaga").keys,
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
    lazy = false,
    opts = {},
    config = require("setup.oil").setup,
    keys = require("setup.oil").keys,
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
    config = require("setup.conform").setup,
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
    config = require("setup.dressing").setup,
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
  {
    "karb94/neoscroll.nvim",
    config = require("setup.neoscroll").setup,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    config = require("setup.obsidian").setup,
    keys = require("setup.obsidian").keys,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = require("setup.kanagawa").setup,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
}
