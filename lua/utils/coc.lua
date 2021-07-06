
local npairs = require'nvim-autopairs'
local utils = require'utils/general'
local M = {}


function M.tab()
  if vim.fn.pumvisible() == 1 then
    return utils.esc'<C-n>'
  elseif utils.check_back_space() then
    return utils.esc'<Tab>'
  elseif utils.check_back_space() then
    return utils.esc'<Tab>'
  else
    return vim.fn['coc#refresh()']()
  end
end

function M.s_tab()
  if vim.fn.pumvisible() == 1 then
    return utils.esc'<C-p>'
  else
    return utils.esc'<C-h>'
  end
end

function M.completion_confirm()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['coc#_select_confirm']()
  else
    return npairs.autopairs_cr()
  end
end


return M

