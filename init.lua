-- ╭─────────────────╮
-- │ NVIM Lua Config │
-- ╰─────────────────╯

local gpt = vim.g
local opt = vim.o
local wpt = vim.wo

-- ╭───────────────────────╮
-- │ Basic editor settings │
-- ╰───────────────────────╯

gpt.mapleader = " "
gpt.maplocalleader = " "
gpt.netrw_banner = 0
gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
gpt.netrw_liststyle = 3
gpt.netrw_altv = 1
gpt.markdown_fenced_languages = true

opt.background = "dark"
opt.colorcolumn = "80"
opt.path = "**"
opt.syntax = "ON"
opt.backup = false
opt.compatible = false
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
opt.tabstop = 4
opt.shiftwidth = 4
opt.fileencoding = "utf-8"
opt.pumheight = 12
opt.laststatus = 3
opt.showcmd = true
opt.expandtab = true
opt.smartindent = true
opt.showmode = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.completeopt = "menuone,noselect"
opt.timeout = true
opt.timeoutlen = 300
opt.linebreak = true

wpt.signcolumn = "yes"
wpt.fillchars = "eob: "

-- If plugins are disabled, use this theme 😄
-- vim.cmd("colorscheme habamax")
vim.cmd("filetype plugin on")

-- ╭────────────────╮
-- │ Custom keymaps │
-- ╰────────────────╯

local map = vim.keymap.set

-- Movement
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open netrw in 20% split in tree view
map("n", "<leader>l", "<CMD>20Lex<CR>")

-- File operations
map("n", "<leader>fs", vim.cmd.w, { desc = "Save file" })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim" })
map("n", "<leader>fn", vim.cmd.enew, { desc = "New file" })
map("n", "<leader>fsq", vim.cmd.wq, { desc = "Save and quit" })
map("n", "<leader>fss", ":w ", { desc = "Save as" })

-- Buffer and splits management and navigation
map("n", "<leader>W", "<CMD>bd!<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })
map("n", "<C-A-w>", "<cmd>bd<cr>", { desc = "Move to next buffer" })

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- Move lines
map("n", "<A-k>", "<CMD>m .-2<CR>==", { noremap = true })
map("n", "<A-j>", "<CMD>m .+1<CR>==", { noremap = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- Move in insert mode
map("i", "<C-k>", "<C-o>a", { noremap = true })
map("i", "<C-j>", "<C-o>h", { noremap = true })

-- Replace all instances of selected word
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', { desc = [[Replace all 
instances of selected word]] })

-- ╭──────────────────────────────╮
-- │ Utilities and extra settings │
-- ╰──────────────────────────────╯

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Netrw line numbers
local netrwnums = vim.api.nvim_create_augroup("NetrwNums", { clear = true })
vim.api.nvim_create_autocmd("filetype", {
    group = netrwnums,
    pattern = "netrw",
    callback = function()
        wpt.number = true
    end,
})

-- Help window numbers
local helpnums = vim.api.nvim_create_augroup("HelpNums", { clear = true })
vim.api.nvim_create_autocmd("filetype", {
    group = helpnums,
    pattern = "help",
    callback = function()
        wpt.number = true
        wpt.relativenumber = true
    end,
})

-- ╭───────────────────────╮
-- │ Neovide configuration │
-- ╰───────────────────────╯

if gpt.neovide then
    opt.guifont = "JetBrainsMono Nerd Font:h13"
    gpt.neovide_scroll_animation_length = 0.06
    gpt.neovide_cursor_animation_length = 0.1
    gpt.neovide_padding_top = 15
    gpt.neovide_padding_bottom = 15
    gpt.neovide_padding_right = 15
    gpt.neovide_padding_left = 15
    gpt.neovide_floating_blur_amount_x = 12.0
    gpt.neovide_floating_blur_amount_y = 12.0
    gpt.neovide_floating_shadow = true
    gpt.neovide_floating_z_height = 10
    gpt.neovide_light_angle_degrees = 45
    gpt.neovide_light_radius = 5
    gpt.neovide_refresh_rate = 75
    gpt.neovide_cursor_vfx_mode = "wireframe"
end

-- ╭──────────────────╮
-- │ LazyNvim plugins │
-- ╰──────────────────╯

-- Comment to disable all plugins and colorschemes
require("plugs.lazy")

-- ╭───────────────────────────────────────────────────╮
-- │ Vanilla statuslines, because lualine is for nerds │
-- ╰───────────────────────────────────────────────────╯
-- Load after plugins to ensure colors work correctly

vim.cmd("hi ActiveBuffer guibg=#AC526B guifg=white")
vim.cmd("hi GuiElements guibg=#393B44 guifg=#AC526B")
vim.cmd("hi GuiLogo guibg=#C4CCD8 guifg=#AC526B")
vim.cmd("hi GitStatus guibg=#C4CCD8 guifg=#393B44")
vim.cmd("hi GuiInvert guibg=#AC526B guifg=white")
vim.cmd("hi BufSeparator guibg=#393B44 guifg=#FDBB44")

local function set_status(args)
    local buffs = {}
    local no_list_buffs = { [""] = true, ["[Command Line]"] = true }
    for _, v in pairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        local fname = vim.fn.fnamemodify(v.name, ":t")
        if not no_list_buffs[fname] then
            if v.bufnr == args.buf then
                fname = "%#ActiveBuffer# " .. fname .. " %*"
            end
            table.insert(buffs, fname)
        end
    end

    local function gitbranch()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        if string.len(branch) > 0 then
            return "󰊢 " .. branch
        else
            return " "
        end
    end

    opt.statusline = " "
        .. ""
        .. "%#GuiLogo#"
        .. "   "
        .. "%*"
        .. "%#GitStatus#"
        .. gitbranch()
        .. "%*█▓▒░ "
        .. "%*%="
        .. "%#BufSeparator# ♦️ %*"
        .. table.concat(buffs, "%#BufSeparator# ♦️ %*")
        .. "%#BufSeparator# ♦️ %*"
        .. "%="
        .. "%#GuiElements#"
        .. " "
        .. "%*"
        .. " %y "
        .. " At:"
        .. " "
        .. "%l/%L"
        .. ", "
        .. "%v"
        .. " | %p%%  "
        .. "█"
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("BufStatusLine", {}),
    callback = set_status,
})

-- ╭───────────────────╮
-- │ Winbar formatting │
-- ╰───────────────────╯

opt.winbar = "%#GuiElements# "
    .. " ░▒▓█"
    .. "%#GuiInvert#"
    .. "  "
    .. "%f "
    .. "%m"
    .. "%#GuiElements#"
    .. "█▓▒░ "

-- ╭──────────╮
-- │ Modeline │
-- ╰──────────╯
-- vim: ts=2 sts=2 sw=2 et
