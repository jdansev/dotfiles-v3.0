

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


---- KEY MAPPINGS ----

-- jk is escape
map('i', 'jk', '<ESC>')

-- move vertically by visual line
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- view scrolling
map('', '<S-d>', '<C-d>')
map('', '<S-u>', '<C-u>')
map('', '<S-e>', '<C-e>')
map('', '<S-y>', '<C-y>')

-- filesystem navigation
map('n', '<C-M-p>', '<CMD>lua require(\'telescope.builtin\').find_files()<CR>')
map('n', '<C-M-f>', '<CMD>lua require(\'telescope.builtin\').live_grep()<CR>')
map('n', '<C-M-b>', '<CMD>lua require(\'telescope.builtin\').file_browser()<CR>')
map('n', '<C-M-e>', '<CMD>NERDTreeTabsToggle<CR>', { silent = true })

-- tabs and splits
map('n', '<C-S-Left', 'gT')
map('n', '<C-S-Right', 'gt')

-- TODO: mappings for code formatting
map('n', '<C-i>', ':set list!<CR>', { silent = true })


-- CoC
CocFns = require'utils/coc'

map('i', '<TAB>', 'v:lua.CocFns.tab_completion()', { expr = true })
map('i', '<S-TAB>', 'v:lua.CocFns.shift_tab_completion()', { expr = true })
map('i', '<CR>', 'v:lua.CocFns.autoselect_first_completion()', { expr = true })
map('n', 'K', ':lua CocFns.show_documentation()<CR>', { silent = true })


