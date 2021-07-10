
local map = require'utils/general'.map

-- save current buffer
map('n', '<C-s>', '<cmd>w | echo "Buffer saved."<CR>', { silent = true })

-- dotfiles search
map('n', '<leader>d', '<cmd>lua require\'utils/telescope\'.search_dotfiles()<CR>', { silent = true })

-- choose colorscheme via Telescope
map('n', '<leader>t', '<cmd>lua require\'telescope.builtin\'.colorscheme()<CR>', { silent = true })

-- TODO: reload neovim
-- map('n', '<leader><leader>', '<cmd>wa | so $MYVIMRC | echo "Reloaded" $MYVIMRC<CR>', { silent = true })

-- remap normal mode escape
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('i', 'jj', '<ESC>')

-- move vertically by visual line
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- view scrolling
map('', '<S-d>', '<C-d>', { silent = true })
map('', '<S-u>', '<C-u>', { silent = true })
map('', '<S-e>', '<C-e>', { silent = true })
map('', '<S-y>', '<C-y>', { silent = true })

-- resize splits with arrows
map('n', '<C-Up>', ':resize +2<CR>', { silent = true })
map('n', '<C-Down>', ':resize -2<CR>', { silent = true })
map('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

-- better indenting
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- toggle invisibles
map('n', '<C-i>', ':set list!<cr>', { silent = true, noremap = true })

-- Telescope
map('n', '<C-f>', '<cmd>lua require(\'telescope.builtin\').current_buffer_fuzzy_find()<CR>')
map('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
map('n', '<C-o>', '<cmd>lua require(\'telescope.builtin\').oldfiles()<CR>')
map('n', '<C-M-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')
map('n', '<C-M-b>', '<cmd>lua require(\'telescope.builtin\').file_browser()<CR>')

-- Telescope extensions
map('n', '<leader>e', ':Telescope emoji search<CR>', { silent = true })

-- barbar
map('n', '<C-w>', '<cmd>BufferClose<CR>', { silent = true })
map('n', '<C-S-Left>', '<cmd>BufferPrevious<CR>', { silent = true })
map('n', '<C-S-Right>', '<cmd>BufferNext<CR>', { silent = true })

-- nvim-tree
map('n', '<C-e>', '<cmd>NvimTreeToggle<CR>', { silent = true })

-- barbar
map('n', '<Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })
map('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })

-- completion (nvim-compe/coc.nvim with nvim-autopairs)
map('i', '<Tab>', 'v:lua.tab()', { expr = true, noremap = true })
map('i', '<S-Tab>', 'v:lua.s_tab()', { expr = true, noremap = true })
map('i' , '<CR>','v:lua.completion_confirm()', { expr = true , noremap = true })

-- TODO: mappings for jump and show diagnosticTs
-- TODO: mappings for float terminal
-- TODO: mappings for code formatting


