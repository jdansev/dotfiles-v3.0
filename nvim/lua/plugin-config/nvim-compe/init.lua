
local utils = require'utils/general'

require'compe'.setup {
  enabled = true;
  debug = false;
  autocomplete = true;
  min_length = 1;
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    vsnip = { priority = 1000 };
    nvim_lsp = { priority = 200 };
    spell = { priority = 100, filetypes = { 'markdown' } };
    calc = { priority = 50, ignored_filetypes = { 'html' } };
    path = { priority = 100, ignored_filetypes = { 'html' } };
    nvim_lua = false;
    -- buffer = { priority = 100, ignored_filetypes = { 'html' } };
  };
}



