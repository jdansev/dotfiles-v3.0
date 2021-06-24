
local g = vim.g
local cmd = vim.cmd


-- Plugins
cmd 'packadd packer.nvim'              -- load the package manager

require'packer'.startup(function()
  use 'wbthomason/packer.nvim'

  use 'machakann/vim-sandwich'
  use 'jiangmiao/auto-pairs'
  use 'norcalli/nvim-colorizer.lua'    -- color highlighter
  use 'matze/vim-move'                 -- move code blocks
  use 'vim-airline/vim-airline'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'tpope/vim-commentary'           -- commenting. TODO: find a newer plugin
  use 'sbdchd/neoformat'               -- code formatting
  use 'inside/vim-search-pulse'        -- locate cursor after search
  use 'RRethy/vim-illuminate'          -- auto highlights other uses of the cursor word
  use 'glepnir/galaxyline.nvim'
  use {                                -- indentation guides
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua' 
  }

  -- filesystem and navigation
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'christoomey/vim-tmux-navigator'
  use 'junegunn/fzf.vim'
  use 'jremmen/vim-ripgrep'
  use 'jistr/vim-nerdtree-tabs'
  use 'szw/vim-maximizer'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }


  -- development
  use '907th/vim-auto-save'
  use 'AndrewRadev/splitjoin.vim' 
  use 'lewis6991/gitsigns.nvim' 
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'    -- :TSPlaygroundToggle, :TSHighlightCapturesUnderCursor
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- color schemes
  use 'NLKNguyen/papercolor-theme'

  -- color schemes (with treesitter support)
  use 'sainnhe/sonokai'
  use 'sainnhe/everforest'
  use 'mhartington/oceanic-next'

  -- other
  use 'tjdevries/astronauta.nvim'
  -- use 'ray-x/navigator.lua'
  -- use 'hrsh7th/nvim-compe'
  -- use 'sheerun/vim-polyglot'        -- language pack
end)



-- telescope
-- TODO: smaller file search window
require'telescope'.setup({
  defaults = {
    color_devicns = true,
    file_ignore_patterns = {
      'node_modules/.*',
      '.git/.*'
    }
  }
})

-- gitsigns
require'gitsigns'.setup()

-- colorizer.lua
require'colorizer'.setup()

-- git blame
g['gitblame_enabled'] = 0
g['gitblame_message_template'] = '    <author> • <date> • <summary>'
g['gitblame_date_format'] = '%r'

-- vim-illuminate
g['Illuminate_delay'] = 200
g['Illuminate_highlightUnderCursor'] = 0

-- indent-blankline
g['indentLine_enabled'] = false


