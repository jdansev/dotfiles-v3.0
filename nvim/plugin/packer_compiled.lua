-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jdansev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jdansev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jdansev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jdansev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jdansev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/AutoSave.nvim"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coc.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/opt/coc.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  everforest = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  playground = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope-emoji.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/telescope-emoji.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-search-pulse"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-search-pulse"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/jdansev/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Conditional loads
time("Condition for { 'coc.nvim' }", true)
if
try_loadstring("\27LJ\2\n9\0\0\1\0\2\0\a6\0\0\0\6\0\1\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\bcoc\22COMPLETION_ENGINE\0", "condition", '{ "coc.nvim" }')
then
time("Condition for { 'coc.nvim' }", false)
time([[packadd for coc.nvim]], true)
		vim.cmd [[packadd coc.nvim]]
	time([[packadd for coc.nvim]], false)
else
time("Condition for { 'coc.nvim' }", false)
end
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
