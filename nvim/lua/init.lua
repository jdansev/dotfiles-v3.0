
require'globals'
require'options'
require'plugins'

-- plugin configurations
require'plugin-config/colorizer'
require'plugin-config/git-blame'
require'plugin-config/telescope'
require'plugin-config/nvim-autopairs'
require'plugin-config/nvim-tree'
require'plugin-config/vim-vsnip'
require'plugin-config/AutoSave'
require'plugin-config/TrueZen'


if COMPLETION_ENGINE == 'coc' then
  require'plugin-config/coc'

  local coc_utils = require'utils/coc'
  _G.tab = coc_utils.tab
  _G.s_tab = coc_utils.s_tab
  _G.completion_confirm = coc_utils.completion_confirm

elseif COMPLETION_ENGINE == 'nvim-lsp' then
  require'plugin-config/nvim-compe'
  require'plugin-config/lspsaga'
  require'plugin-config/nvim-lightbulb'
  require'plugin-config/lspkind-nvim'
  require'plugin-config/emmet-ls'

  local compe_utils = require'utils/nvim-compe'
  _G.tab = compe_utils.tab
  _G.s_tab = compe_utils.s_tab
  _G.completion_confirm = compe_utils.completion_confirm

  require'lsp/mappings'
end


require'mappings'
require'statusline'
require'colorscheme'


-- lsp
require'lspinstall'.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = require'lspinstall'.installed_servers()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- emmet-ls
-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig/configs'

-- if not lspconfig.emmet_ls then
--   configs.emmet_ls = {
--     default_config = {
--       cmd = {'emmet-ls', '--stdio'};
--       filetypes = {'html', 'css'};
--       root_dir = function()
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
-- lspconfig.emmet_ls.setup{
--   capabilities = capabilities;
-- }

for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    capabilities = capabilities
  }
end


