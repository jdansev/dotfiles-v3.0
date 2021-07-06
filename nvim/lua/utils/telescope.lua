
local M = {}


function M.search_dotfiles()
  require'telescope.builtin'.find_files{
    prompt_title = 'Search dotfiles',
    cwd = vim.fn.stdpath('config')
  }
end


return M

