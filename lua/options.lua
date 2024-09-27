-- ╔══════════════════════════════════════════════════════════╗
-- ║  ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗ ║
-- ║ ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝ ║
-- ║ ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗ ║
-- ║ ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║ ║
-- ║ ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║ ║
-- ║  ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ║
-- ╚══════════════════════════════════════════════════════════╝

Gpt = vim.g
Opt = vim.o
Wpt = vim.wo

Gpt.mapleader = " "
Gpt.maplocalleader = " "
Gpt.netrw_banner = 0
Gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
Gpt.netrw_liststyle = 3
Gpt.netrw_altv = 1

Opt.background = "dark"
Opt.colorcolumn = "80"
Opt.path = "**"
Opt.syntax = "ON"
Opt.backup = false
Opt.compatible = false
Opt.number = true
Opt.relativenumber = true
Opt.mouse = "a"
Opt.cursorline = true
Opt.smartcase = true
Opt.ignorecase = true
Opt.hlsearch = true
Opt.formatoptions = "t"
Opt.foldmethod = "manual"
Opt.incsearch = true
Opt.wrap = true
Opt.tabstop = 4
Opt.shiftwidth = 4
Opt.fileencoding = "utf-8"
Opt.pumheight = 12
Opt.laststatus = 3
Opt.showcmd = true
Opt.expandtab = true
Opt.smartindent = true
Opt.showmode = true
Opt.scrolloff = 4
Opt.sidescrolloff = 8
Opt.clipboard = "unnamedplus"
Opt.splitbelow = true
Opt.splitright = true
Opt.termguicolors = true
Opt.completeopt = "menuone,noselect"
Opt.timeout = true
Opt.timeoutlen = 300
Opt.linebreak = true

Wpt.signcolumn = "yes"
Wpt.fillchars = "eob: ,vert:│"
Wpt.conceallevel = 2
