-- Highlight groups
vim.cmd [[
  highlight WinBar guifg=#888888 guibg=NONE
  highlight WinBarFocused guifg=#ffffff guibg=NONE
]]

-- Focus check
local function is_focused()
  return vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin) and '%#WinBarFocused#' or '%#WinBar#'
end

-- Git status (requires gitsigns.nvim)
local function git_status()
  local gitsigns = vim.b.gitsigns_status_dict
  if not gitsigns then
    return ''
  end

  local parts = {}
  if gitsigns.added and gitsigns.added > 0 then
    table.insert(parts, ' ' .. gitsigns.added)
  end
  if gitsigns.changed and gitsigns.changed > 0 then
    table.insert(parts, ' ' .. gitsigns.changed)
  end
  if gitsigns.removed and gitsigns.removed > 0 then
    table.insert(parts, ' ' .. gitsigns.removed)
  end

  return table.concat(parts, ' ')
end

-- Get relative file path from project root or full path fallback
local function file_path()
  local filepath = vim.fn.expand '%:p'
  local cwd = vim.fn.getcwd()
  if filepath:find(cwd, 1, true) == 1 then
    return filepath:sub(#cwd + 2)
  else
    return vim.fn.expand '%:p:.'
  end
end

-- Final Winbar string
function _G.Winbar()
  if vim.bo.filetype == 'help' or vim.bo.buftype ~= '' then
    return ''
  end
  local path = file_path()
  local git = git_status()
  return is_focused() .. ' ' .. path .. ' ' .. git
end

-- Set the winbar globally
vim.o.winbar = '%{%v:lua.Winbar()%}'

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function()
    vim.g.actual_curwin = vim.api.nvim_get_current_win()
  end,
})
