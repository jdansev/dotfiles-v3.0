
-- TELESCOPE CONFIG
require('telescope').setup({
  defaults = {
    color_devicns = true,
    file_ignore_patterns = {
      'node_modules/.*',
      '.git/.*'
    }
  }
})

-- GITSIGNS CONFIG
require('gitsigns').setup()

-- GIT BLAME CONFIG
vim.g['gitblame_enabled'] = 0
vim.g['gitblame_message_template'] = '    <author> • <date> • <summary>'
vim.g['gitblame_date_format'] = '%r'

-- VIM ILLUMINATE CONFIG
vim.g['Illuminate_delay'] = 200
vim.g['Illuminate_highlightUnderCursor'] = 0

-- COLORIZER.LUA CONFIG
require('colorizer').setup()

-- INDENT BLANKLINE CONFIG
vim.g['indentLine_enabled'] = false

-- TODO: COC CONFIG

