local M = {}

function M.new_named_file()
    vim.ui.input({ prompt = "File (Give file extension): " }, function(name)
        if name then
            vim.cmd({ cmd = "enew" })
            vim.cmd.w(name)
        else
            vim.api.nvim_err_writeln("No name given. No file created.")
        end
    end)
end

function M.create_general_note()
    if vim.fn.isdirectory("./general") == 0 then
        return print("Not in notes directory")
    end

    vim.ui.input({ prompt = "New markdown note name: " }, function(name)
        if not name then
            return vim.api.nvim_err_writeln("No name given")
        end

        vim.ui.input({ prompt = "Note title (optional): " }, function(title)
            vim.ui.input({ prompt = "Tags (comma-separated, optional): " }, function(tags)
                local lines = {
                    "---",
                    "tags:",
                }

                -- Process tags
                if tags and tags ~= "" then
                    for tag in string.gmatch(tags, "([^,]+)") do
                        table.insert(lines, string.format("  - %s", tag:gsub("^%s*(.-)%s*$", "%1")))
                    end
                else
                    table.insert(lines, "  - ")
                end

                -- Common frontmatter
                vim.list_extend(lines, {
                    "prev:",
                    "  - [[]]",
                    "next:",
                    "  - [[]]",
                })

                -- Add title if provided
                if title and title ~= "" then
                    table.insert(lines, "title:")
                    table.insert(lines, string.format('  - "%s"', title))
                end

                -- Document body
                vim.list_extend(lines, {
                    "---",
                    "",
                    "# " .. (title and title ~= "" and title or name),
                })

                vim.cmd.enew()
                vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
                vim.cmd.write("./general/" .. name .. ".md")
            end)
        end)
    end)
end

function M.new_personal()
    local general = vim.fn.isdirectory("./personal")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New personal note: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.normal("O# " .. name)
                vim.cmd.write("./personal/" .. name .. ".md")
                vim.cmd.normal("2o")
            else
                vim.api.nvim_err_writeln("No name given. No file created.")
            end
        end)
    end
end

function M.new_writing()
    local general = vim.fn.isdirectory("./escritos")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New markdown escrito: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.normal("O# " .. name)
                vim.cmd.write("./escritos/" .. name .. ".md")
                vim.cmd.normal("2o")
            else
                vim.api.nvim_err_writeln("No name given. No file created.")
            end
        end)
    end
end

function M.save_as()
    vim.ui.input({ prompt = "Save as: " }, function(name)
        if name then
            vim.cmd.w(name)
        else
            vim.api.nvim_err_writeln("No name given. No file created.")
        end
    end)
end

return M
