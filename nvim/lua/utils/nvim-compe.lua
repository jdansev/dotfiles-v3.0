
local utils = require'utils/general'
local npairs = require'nvim-autopairs'
local M = {}


function M.tab()
  if vim.fn.pumvisible() == 1 then
    return utils.esc'<C-n>'
  elseif vim.fn.call('vsnip#available', {1}) == 1 then
    vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
    return ''
  elseif utils.check_back_space() then
    return utils.esc'<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

function M.s_tab()
  if vim.fn.pumvisible() == 1 then
    return utils.esc'<C-p>'
  elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
    vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
    return ''
  else
    return utils.esc'<S-Tab>'
  end
end

function M.completion_confirm()
  if vim.fn.pumvisible() ~= 0 then
    return vim.fn['compe#confirm']('<CR>')
  else
    return npairs.autopairs_cr()
  end
end


return M

