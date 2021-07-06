
local M = {}


function M.nvim_tree_windows_open()
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  print('Opening in explorer: ' .. node.absolute_path)
  if node then
    vim.fn.jobstart('explorer.exe $(wslpath -w ' .. node.absolute_path .. ') &', {
      detach = true,
    })
  end
end

function M.collapse_nvim_tree()
  local lib = require'nvim-tree.lib'
  for _, node in pairs(lib.Tree.entries) do
    if node.open then
      node.open = false
    end
  end
  lib.refresh_tree()
end

function M.recursive_open_nvim_tree()
  local lib = require'nvim-tree.lib'
  for _, node in pairs(lib.Tree.entries) do
    if not node.open then
      node.open = true
    end
  end
  lib.refresh_tree()
end


return M

