
local npairs = require'nvim-autopairs'

npairs.setup{
  disable_filetype = {
    'TelescopePrompt'
  }
}


-- rules

local Rule = require'nvim-autopairs.rule'

npairs.add_rules({
  Rule(' ', ' '):with_pair(function (opts)
    local pair = opts.line:sub(opts.col, opts.col+2)
    return vim.tbl_contains({'()', '[]', '{}'}, pair)
  end)
})


