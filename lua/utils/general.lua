
local U = {}


function U.esc(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end


return u

