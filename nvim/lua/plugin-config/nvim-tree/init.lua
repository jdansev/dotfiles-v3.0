
vim.g.nvim_tree_bindings = {
  { key = 'E', cb = ':lua require\'utils/nvim-tree\'.nvim_tree_windows_open()<cr>' },
  { key = 'O', cb = ':lua require\'utils/nvim-tree\'.recursive_open_nvim_tree()<cr>' },
  { key = 'X', cb = ':lua require\'utils/nvim-tree\'.collapse_nvim_tree()<cr>' }
}

vim.g.nvim_tree_icons = {
  git = {
    unstaged = '×'
  },
  folder = {
    arrow_open = '▿',
    arrow_closed = '▸'
  }
}

vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_ignore = {
  '.git',
  'node_modules',
  '.cache',
}


