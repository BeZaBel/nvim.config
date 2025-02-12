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
  -- Check if we're in an Obsidian vault
  if vim.fn.isdirectory(".obsidian") == 0 then
    return vim.api.nvim_err_writeln("Not in an Obsidian vault")
  end

  -- Prompt for the note name
  local name = h.prompt_input("New markdown note name: ", "")
  if name == "" then
    return vim.api.nvim_err_writeln("Operation canceled: No name given")
  end

  local filepath = "./general/" .. name .. ".md"
  local file_exists = h.file_exists(filepath)

  -- Handle existing file case
  if file_exists then
    if not h.confirm("File already exists. Overwrite?") then
      -- Open existing file instead of creating new
      vim.cmd("edit " .. vim.fn.fnameescape(filepath))
      print("Opened " .. filepath)
      return
    end
  end

  -- Create new file (empty buffer)
  vim.cmd.enew()

  -- Write with force if overwriting
  local write_cmd = file_exists and "write! " or "write "
  vim.cmd(write_cmd .. vim.fn.fnameescape(filepath))

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
