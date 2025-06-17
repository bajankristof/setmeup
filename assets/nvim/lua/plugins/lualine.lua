return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local lualine = require('lualine')

    lualine.setup()
  end
}
