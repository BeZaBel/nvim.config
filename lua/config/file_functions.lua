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

function M.create_note(location)
  -- Check if we're in an Obsidian vault
  if vim.fn.isdirectory(".obsidian") == 0 then
    return vim.api.nvim_err_writeln("Not in an Obsidian vault")
  end

  if location ~= "./general/" and location ~= "./escritos/" then
    return vim.api.nvim_err_writeln("Invalid location")
  end

  -- Prompt for the note name
  local name = h.prompt_input("New markdown note name: ", "")
  if name == "" then
    return vim.api.nvim_err_writeln("Operation canceled: No name given")
  end

  local filepath = location .. name .. ".md"
  -- Ensure the ./general/ directory exists
  if vim.fn.isdirectory(location) == 0 then
    vim.fn.mkdir(location, "p")
  end

  local file_exists = h.file_exists(filepath)
  -- Handle existing file case
  if file_exists then
    if not h.confirm("File already exists. Overwrite?") then
      -- Open existing file instead of creating new
      vim.cmd("edit " .. vim.fn.fnameescape(filepath))
      print("Existing file opened: " .. filepath)
      return
    end
  end

  vim.cmd.enew()

  -- Create or overgwrite the file
  local write_cmd = file_exists and "write!" or "write"
  vim.cmd(write_cmd .. vim.fn.fnameescape(filepath))
  print("New note created: " .. filepath)
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
