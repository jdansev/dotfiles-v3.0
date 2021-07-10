
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
    live_grep = {
      vimgrep_arguments = {
        'rg',
        '--column',
        '--line-number'
      },
      path_display = {
        'tail'
      },
      layout_strategy = 'vertical',
      layout_config = { width = 0.5 },
      prompt_prefix = 'Find> ',
      prompt_title = false,
      mappings = {
        i = {
          ['<C-w>'] = actions.close,
        },
        n = {
          ['<C-w>'] = actions.close,
        }
      }
    },
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

    -- TODO: Refine this approach

    -- current_buffer_fuzzy_find = {
    --   prompt_title = false,
    --   previewer = false,
    --   mappings = {
    --     i = {
    --       ['<C-w>'] = actions.close,
    --     },
    --     n = {
    --       ['<C-w>'] = actions.close,
    --     }
    --   }
    -- },

    colorscheme = {
      layout_config = {
        width = 0.2
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
    }
  }
}

-- extensions
require'telescope'.load_extension'emoji'


