-- ╔════════════════════════════════════════════════════╗
-- ║ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ║
-- ║ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ║
-- ║ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ║
-- ║ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ║
-- ║ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ║
-- ║ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ║
-- ╚════════════════════════════════════════════════════╝
-- ╭──────────────────────────────────────╮
-- │ Basic settings, remaps and utilities │
-- ╰──────────────────────────────────────╯
vim.cmd("filetype plugin on")
vim.cmd("packadd termdebug")
-- vim.cmd("colorscheme sorbet")

local gpt = vim.g
local opt = vim.o
local wpt = vim.wo
local map = vim.keymap.set

gpt.mapleader = " "
gpt.maplocalleader = " "
gpt.have_nerd_font = true
opt.colorcolumn = "80"
opt.path = "**"
opt.syntax = "on"
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.cursorline = true
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.formatoptions = "t"
opt.foldmethod = "manual"
opt.incsearch = true
opt.wrap = true
opt.pumheight = 10
opt.laststatus = 3
opt.showcmd = true
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.showmode = false
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.completeopt = "menuone,noselect"
opt.timeout = true
opt.timeoutlen = 300
opt.linebreak = true
opt.breakindent = true
opt.list = true
opt.listchars = "leadmultispace:│   ,trail:·,nbsp:␣"
opt.updatetime = 500
wpt.signcolumn = "yes"
wpt.fillchars = "eob: ,vert:│"

vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)

-- ╭────────────────────────────────────╮
-- │ Netrw (Disabled if using oil.nvim) │
-- ╰────────────────────────────────────╯
gpt.netrw_banner = 0
gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
gpt.netrw_browse_split = 0
gpt.netrw_liststyle = 3
gpt.netrw_altv = 1

-- ╭──────────────────────────────╮
-- │ Gui configurations (neovide) │
-- ╰──────────────────────────────╯
opt.guifont = "Iosevka Nerd Font Mono:h11"
gpt.neovide_padding_top = 10
gpt.neovide_padding_left = 10
gpt.neovide_padding_right = 10
gpt.neovide_padding_bottom = 10
gpt.neovide_position_animation_length = 0.05
gpt.neovide_scroll_animation_length = 0.05
gpt.neovide_cursor_animation_length = 0.05

-- ╭──────────╮
-- │ Movement │
-- ╰──────────╯
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("i", "<C-k>", "<right>", { noremap = true })
map("i", "<C-j>", "<left>", { noremap = true })

-- ╭─────────────────╮
-- │ File operations │
-- ╰─────────────────╯
map("n", "<leader>fs", vim.cmd.w, { desc = "Save file" })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim" })
map("n", "<leader>fn", vim.cmd.tabnew, { desc = "New file" })
map("n", "<leader>fa", ":w ", { desc = "Save as" })

-- ╭─────────────────────────────────────────────╮
-- │ Buffer and splits management and navigation │
-- ╰─────────────────────────────────────────────╯
map("n", "<leader>W", "<CMD>bd!<CR>", { desc = "Remove current buffer" })
map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })

-- ╭──────────────────────────────────────────────────────────────────╮
-- │ Automatically close brackets, parethesis, quotes and other stuff │
-- ╰──────────────────────────────────────────────────────────────────╯
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "(;", "();<left><left>")
map("i", "/*", "/**/<left><left>")
map("i", "<A-q>", "__<left>", { noremap = true })
map("i", "<A-w>", "``<left>")
map("i", "<A-e>", "****<left><left>")
map("i", "<C-b>", "```<Enter>```<Up>")
map("n", "<C-A-m>", "i- [ ] ")
map("i", "<C-A-m>", "- [ ] ")

map("v", "<C-b>", "\"hy:'<,'>s/<C-r>h/**<C-r>h**/g<cr>")
map("v", "<C-i>", "\"hy:'<,'>s/<C-r>h/_<C-r>h_/g<cr>")
map("v", "<A-k>", "\"hy:'<,'>s/<C-r>h/`<C-r>h`/g<cr>")

-- ╭────────────────╮
-- │ Open terminals │
-- ╰────────────────╯
map("t", "<C-A-c>", [[<C-\><C-n>]])
map("t", "<Esc>", [[<C-\><C-n>]])

map("n", "<leader>]", function()
    vim.cmd("70vsplit +term")
end, { desc = "Open vertical term" })
map("n", "<leader>[", function()
    vim.cmd("10split +term")
end, { desc = "Open horizontal term" })
map("n", "<C-A-g>", function()
    vim.cmd("term lazygit")
end, { desc = "Open a terminal with lazygit" })
map("n", "<C-A-Space>", function()
    vim.cmd("term")
end, { desc = "Open a full size terminal" })

-- ╭────────────────────────────────╮
-- │ Move between markdown headings │
-- ╰────────────────────────────────╯
map("n", "gk", function()
    vim.cmd("silent! ?^##\\+\\s.*$")
    vim.cmd("nohlsearch")
end, { desc = "Move to upper heading" })

map("n", "gj", function()
    vim.cmd("silent! /^##\\+\\s.*$")
    vim.cmd("nohlsearch")
end, { desc = "Move to lower heading" })

-- ╭────────────╮
-- │ Move lines │
-- ╰────────────╯
map("n", "<C-k>", "<CMD>m-2<CR>", { noremap = true })
map("n", "<C-j>", "<CMD>m+1<CR>", { noremap = true })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- ╭────────────────────────────────────────╮
-- │ Replace all instances of selected word │
-- ╰────────────────────────────────────────╯
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', {
    desc = [[Replace all
instances of selected word]],
})

-- Open netrw
-- map("n", "<leader>le", "<CMD>20Lex<CR>")

-- ╭───────────────────╮
-- │ Highlight on yank │
-- ╰───────────────────╯
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- ╭────────────────────────╮
-- │ Numbers on help buffer │
-- ╰────────────────────────╯
local helpnums = vim.api.nvim_create_augroup("HelpNums", { clear = true })
vim.api.nvim_create_autocmd("filetype", {
    group = helpnums,
    pattern = "help",
    callback = function()
        wpt.number = true
        wpt.relativenumber = true
    end,
})

-- ╭──────────────────────────────────────────────────╮
-- │ Vanilla statusline, because lualine is for nerds │
-- ╰──────────────────────────────────────────────────╯
local function set_status()
    local function gitbranch()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        if string.len(branch) > 0 then
            return " 󰊢 " .. branch .. " "
        else
            return " "
        end
    end

    opt.statusline = "  " .. gitbranch() .. " %y" .. " %F %m " .. "%=" .. " Row: %l/%L " .. " Col: %v " .. " %p%% "
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("BufStatusLine", {}),
    callback = set_status,
})

-- ╭──────────────╮
-- │ Lazy plugins │
-- ╰──────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
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
            -- "R-nvim/cmp-r",
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
        dependencies = { "echasnovski/mini.icons" },
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
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                compile = true,
            })
            require("setup.kanagawa").setup()
        end,
    },
    -- {
    --     "Mofiqul/dracula.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = require("setup.dracula").setup,
    -- },
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
        "R-nvim/R.nvim",
        version = "~0.1.0",
        dependencies = { "R-nvim/cmp-r" },
        ft = "r",
        config = require("setup.rnvim").setup,
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
    },
}, {
    change_detection = {
        notify = false,
    },
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
