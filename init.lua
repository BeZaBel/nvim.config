-- ╭─────────────────────────────────────────────────────╮
-- │  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ │
-- │  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ │
-- │ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ │
-- │ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  │
-- │ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ │
-- │ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ │
-- │ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ │
-- │    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    │
-- │          ░    ░  ░    ░ ░        ░   ░         ░    │
-- │                                 ░                   │
-- ╰─────────────────────────────────────────────────────╯
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
opt.scrolloff = 0
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
end)

-- ╭────────────────────────────────────╮
-- │ Netrw (Disabled if using oil.nvim) │
-- ╰────────────────────────────────────╯
gpt.netrw_banner = 0
gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
gpt.netrw_browse_split = 0
gpt.netrw_liststyle = 3
gpt.netrw_altv = 1

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
local ff = require("file_functions")

map("n", "<leader>fs", vim.cmd.w, { desc = "Save file", noremap = true, silent = true })
map("n", "<leader>fw", vim.cmd.wq, { desc = "Save and quit", noremap = true, silent = true })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim", noremap = true, silent = true })
map("n", "<leader>ft", vim.cmd.tabnew, { desc = "New file in a tab", noremap = true, silent = true })
map("n", "<leader>fn", vim.cmd.enew, { desc = "New file", noremap = true, silent = true })
map("n", "<leader>fm", ff.new_named_file, { desc = "New named file", noremap = true, silent = true })
map("n", "<leader>fa", ff.save_as, { desc = "Save as", noremap = true, silent = true })
map("n", "<leader>fop", ff.new_personal, { desc = "New personal note", noremap = true, silent = true })
map(
    "n",
    "<leader>fog",
    ff.create_general_note,
    { desc = "New note in general directory", noremap = true, silent = true }
)
map("n", "<leader>foe", ff.new_escrito, { desc = "New note in escritos directory", noremap = true, silent = true })

-- ╭─────────────────────────────────────────────╮
-- │ Buffer and splits management and navigation │
-- ╰─────────────────────────────────────────────╯
map("n", "<leader>W", "<CMD>bd!<CR>", { desc = "Remove current buffer" })
map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })

-- ╭────────────────────╮
-- │ Some misc keybinds │
-- ╰────────────────────╯
map("i", "<C-A-m>", "- [ ] ")
map("n", "<leader>om", "i- [ ] ")
map("n", "<leader>od", function()
    vim.cmd.execute('"normal idate\\<Tab>\\<CR>"')
end, { desc = "Insert date" })

-- ╭──────────────────╮
-- │ Inside terminals │
-- ╰──────────────────╯
map("t", "<C-A-c>", [[<C-\><C-n>]])
map("t", "<Esc>", [[<C-\><C-n>]])

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

-- ╭────────────────────╮
-- │ Vanilla statusline │
-- ╰────────────────────╯

local function set_status()
    local parts = {
        "  : %t %m",
        "%=",
        " : %{expand('%:p:h')} ",
        "| ",
        "󰠷 : %l/%L ",
        "󰠵: %v ",
        "| ",
        "󰠞 : %p%% ",
    }
    return table.concat(parts, "")
end

opt.statusline = set_status()

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
    require("setup.plugin_spec"),
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
