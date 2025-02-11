local M = {}

local h = require("config.helpers")

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
    -- Check if we are in the notes directory
    if vim.fn.isdirectory("./general") == 0 then
        return print("Not in notes directory")
    end

    -- Prompt for the note name
    local name = h.prompt_input("New markdown note name: ", "")
    if name == "" then
        return vim.api.nvim_err_writeln("Operation canceled: No name given")
    end

    -- Check if the file already exists
    local filepath = "./general/" .. name .. ".md"
    if h.file_exists(filepath) then
        if not h.confirm("File already exists. Overwrite?") then
            return vim.api.nvim_err_writeln("Operation canceled: User chose not to overwrite")
        end
    end

    -- Prompt for the note title (optional)
    local title = h.prompt_input("Note title (optional): ", name)
    if title == "" then
        title = name
    end

    -- Prompt for tags (optional)
    local tags = h.prompt_input("Tags (space-separated, optional): ", "")

    -- Confirm adding prev and next sections (optional)
    local add_prev = h.confirm("Add 'prev' section? (Y/n)")
    local add_next = h.confirm("Add 'next' section? (Y/n)")

    -- Create the markdown content
    local lines = h.create_markdown_content(title, tags, add_prev, add_next)

    -- Write the content to a new buffer
    vim.cmd.enew()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

    -- Save the file
    vim.cmd.write(filepath)
    print("Note created successfully: " .. filepath)
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
