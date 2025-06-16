return {
  'rebelot/kanagawa.nvim',
  build = ':KanagawaCompile',
  config = function()
    local kanagawa = require('kanagawa')

    kanagawa.setup {
      compile = true,
      transparent = true,
      theme = 'wave',
    }

    vim.cmd('colorscheme kanagawa')
  end
}
