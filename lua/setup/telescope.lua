local extensions = {
    fuzzy = "fzf",
    emoji = "emoji",
}

return {
    setup = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
                selection_caret = "▸ ",
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            extensions = {
                emoji = {
                    action = function(emoji)
                        vim.fn.setreg("+", emoji.value)
                        print([[Press p or " + + to paste this emoji]] .. emoji.value)
                        vim.api.nvim_put({ emoji.value }, "c", false, true)
                    end,
                },
            },
        })

        for i, value in pairs(extensions) do
            telescope.load_extension(value)
        end

        local function find_git_root()
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            if current_file == "" then
                current_dir = cwd
            else
                current_dir = vim.fn.fnamemodify(current_file, ":h")
            end

            local git_root =
                vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
            if vim.v.shell_error ~= 0 then
                print("Not a git repository. Searching on current working directory")
                return cwd
            end
            return git_root
        end

        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require("telescope.builtin").live_grep({
                    search_dirs = { git_root },
                })
            end
        end

        local function telescope_live_grep_open_files()
            require("telescope.builtin").live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end

        vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

        local map = vim.keymap.set
        map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
        map("n", "<leader>ob", require("telescope.builtin").lsp_references, { desc = "Show backlinks" })
        map("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
        map("n", "<leader>/", function()
            require("telescope.builtin").current_buffer_fuzzy_find()
        end, { desc = "[/] Fuzzily search in current buffer" })

        map("n", "<leader>sn", "<CMD>Telescope emoji<CR>", { desc = "Open telescope emoji" })

        map("n", "<leader>df", function()
            require("telescope.builtin").find_files()
        end, { desc = "Find file in directory" })

        -- live_grep integration
        map("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
        map("n", "<leader>qg", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
        map("n", "<leader>qh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
        map("n", "<leader>qw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
        map("n", "<leader>qr", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
        map("n", "<leader>qR", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
        map("n", "<leader>qd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
        map("n", "<leader>qe", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
    end,
}
