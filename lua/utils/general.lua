
local api = vim.api
local fn = vim.fn
local M = {}


function M.esc(cmd)
  return api.nvim_replace_termcodes(cmd, true, true, true)
end

function M.check_back_space()
  local col = fn.col('.') - 1
  return col <= 0 or fn.getline('.'):sub(col, col):match('%s')
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


return M

