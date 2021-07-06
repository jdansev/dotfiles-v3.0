
local map = require'utils/general'.map

-- lsp (lspsaga and nvim-compe)
map('n', 'gh', '<cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>', { silent = true, noremap = true })
map('n', 'ca', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', { noremap = true })
map('v', 'ca', '<cmd>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', { noremap = true })
map('n', 'K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', { silent = true, noremap = true })
map('n', 'gs', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', { silent = true, noremap = true })
map('n', 'gr', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', { silent = true, noremap = true })
map('n', 'gd', '<cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>', { silent = true, noremap = true })


