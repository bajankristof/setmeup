return {
  'rebelot/kanagawa.nvim',
  build = ':KanagawaCompile',
  config = function()
    local kanagawa = require('kanagawa')

    kanagawa.setup { transparent = true }

    vim.cmd('colorscheme kanagawa')
  end
}
