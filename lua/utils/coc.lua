local M = {}
local utils = require('utils/general')
local fn = vim.fn
local bo = vim.bo


function M.tab_completion()
  if fn.pumvisible() > 0 then
    return utils.esc('<C-n>')
  else
    if M.check_back_space() then
      return utils.esc('<TAB>')
    else
      fn['coc#refresh']()
    end
  end
end

function M.shift_tab_completion()
  if fn.pumvisible() > 0 then
    return utils.esc('<C-p>')
  else
    return utils.esc('<C-h>')
  end
end

function M.autoselect_first_completion()
  if fn.pumvisible() > 0 then
    return fn['coc#_select_confirm']()
  else
    return utils.esc('<CR>')
  end
end

function M.check_back_space()
  local col = fn.col('.') - 1
  return col <= 0 or fn.getline('.'):sub(col, col):match('%s')
end

function M.show_documentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim'  or filetype == 'help' then
    vim.api.nvim_command('h ' .. filetype)
  elseif vim.call('coc#rpc#ready') then
    fn.CocActionAsync('doHover')
  end
end


return M

