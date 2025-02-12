-- ╭────────────────────────────────────╮
-- │                                    │
-- │  ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓ │
-- │  ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒ │
-- │ ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░ │
-- │ ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██  │
-- │ ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒ │
-- │ ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░ │
-- │ ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░ │
-- │    ░   ░ ░     ░░   ▒ ░░      ░    │
-- │          ░      ░   ░         ░    │
-- │                ░                   │
-- ╰────────────────────────────────────╯

-- ╭──────────────────────────────────────╮
-- │ Basic settings, remaps and utilities │
-- ╰──────────────────────────────────────╯
vim.filetype.add({ enable = true })
vim.cmd("packadd termdebug")
vim.cmd("colorscheme sorbet")

local gpt = vim.g
local opt = vim.o
local wpt = vim.wo

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
opt.smartindent = true
opt.showmode = false
opt.scrolloff = 2
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
opt.listchars = "space:·,leadmultispace:│   ,trail:·,nbsp:␣"
opt.updatetime = 500
opt.smoothscroll = true
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = "nvim_treesitter#foldtext()"
wpt.signcolumn = "yes"
wpt.fillchars = "eob: ,vert:│"

vim.schedule(function()
  opt.clipboard = "unnamedplus"
  opt.shiftwidth = 2
  opt.tabstop = 2
  opt.softtabstop = 2
  opt.expandtab = true
end)

-- ╭────────────────────────────────────╮
-- │ Netrw (Disabled if using oil.nvim) │
-- ╰────────────────────────────────────╯
gpt.netrw_banner = 0
gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
gpt.netrw_browse_split = 0
gpt.netrw_liststyle = 3
gpt.netrw_altv = 1

-- ┌─────────┐
-- │ Keymaps │
-- └─────────┘
require("config.keymaps")

-- ┌──────────┐
-- │ Autocmds │
-- └──────────┘
require("config.autocmds")

-- ┌──────┐
-- │ Lazy │
-- └──────┘
require("config.lazy")

-- ┌────────────┐
-- │ Statusline │
-- └────────────┘
require("config.statusline")
