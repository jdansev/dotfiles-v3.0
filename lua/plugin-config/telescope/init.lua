
local actions = require'telescope.actions'

require'telescope'.setup{
  defaults = {
    color_devicons = true,
    file_ignore_patterns = {
      'node_modules/.*',
      '.git/.*'
    }
  },
  pickers = {
    find_files = {
      layout_config = {
        width = 0.3
      },
      sort_lastused = true,
      previewer = false,
      prompt_title = false,
      theme = 'dropdown',
      mappings = {
        i = {
          ['<C-w>'] = actions.close,
        },
        n = {
          ['<C-w>'] = actions.close,
          ['<S-t>'] = actions.file_tab
        }
      }
    },
    oldfiles = {
      layout_config = {
        width = 0.3
      },
      sort_lastused = true,
      previewer = false,
      prompt_title = false,
      theme = 'dropdown',
      mappings = {
        i = {
          ['<C-w>'] = actions.close,
          ['<C-o>'] = actions.move_selection_next
        },
        n = {
          ['<C-w>'] = actions.close,
        }
      }
    },
    current_buffer_fuzzy_find = {
      prompt_title = false,
      previewer = false,
      mappings = {
        i = {
          ['<C-w>'] = actions.close,
        },
        n = {
          ['<C-w>'] = actions.close,
        }
      }
    }
  }
}


