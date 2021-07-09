
local g = vim.g
local cmd = vim.cmd


-- Plugins
cmd 'packadd packer.nvim'

require'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'windwp/nvim-autopairs'
  use 'machakann/vim-sandwich'
  use 'machakann/vim-highlightedyank'
  use 'matze/vim-move'                      -- move code blocks
  use 'norcalli/nvim-colorizer.lua'         -- color highlighter
  use 'inside/vim-search-pulse'             -- locate cursor after search
  use 'RRethy/vim-illuminate'               -- auto highlights other uses of the cursor word
  use 'glepnir/galaxyline.nvim'             -- status line

  -- filesystem and navigation
  use 'romgrk/barbar.nvim'
  use 'junegunn/fzf.vim'
  use 'jremmen/vim-ripgrep'
  use 'kyazdani42/nvim-tree.lua'

  use 'christoomey/vim-tmux-navigator'
  use 'szw/vim-maximizer'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }

  -- development
  use 'Pocco81/TrueZen.nvim'
  use 'f-person/git-blame.nvim'
  use 'tpope/vim-commentary'

  -- TODO: update with AutoSave.nvim
  use 'Pocco81/AutoSave.nvim'

  use 'AndrewRadev/splitjoin.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'mattn/emmet-vim'                       -- frontend completion
  use 'nvim-treesitter/playground'            -- :TSPlaygroundToggle, :TSHighlightCapturesUnderCursor
  use  'lukas-reineke/indent-blankline.nvim'  -- indentation guides

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    cond = function()
      return COMPLETION_ENGINE == 'coc'
    end
  }

  -- dashboard
  use 'glepnir/dashboard-nvim'

  -- color schemes
  use 'NLKNguyen/papercolor-theme'

  -- treesitter support
  use 'sainnhe/sonokai'
  use 'sainnhe/everforest'
  use 'mhartington/oceanic-next'
  use 'shaunsingh/nord.nvim'

  -- dotfile utilities
  use 'tjdevries/astronauta.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'onsails/lspkind-nvim'

  -- misc.
  -- use 'Pocco81/TrueZen.nvim'
  -- use 'folke/which-key.nvim'
  -- use 'ray-x/navigator.lua'
  -- use 'ray-x/lsp_signature.nvim'
  -- use 'djoshea/vim-autoread'
  -- use 'folke/zen-mode.nvim'
  -- use 'jabirali/tmux-tilish'

  -- TODO: install code formatter
  -- TODO: find newer commenting plugin
  -- TODO: git integrations

end)


-- TODO: move these to plugin-config

-- vim-illuminate
g['Illuminate_delay'] = 200
g['Illuminate_highlightUnderCursor'] = 0

-- indent-blankline
g['indentLine_enabled'] = false


