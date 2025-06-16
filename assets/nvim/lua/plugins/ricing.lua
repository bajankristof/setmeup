return {
  {
    'sphamba/smear-cursor.nvim',
    event = 'VeryLazy',
    config = function()
      local smear_cursor = require('smear_cursor')
      smear_cursor.setup({
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        distance_stop_animating = 0.5,
      })
    end,
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    config = function()
      local neoscroll = require('neoscroll')
      neoscroll.setup({
        duration_multiplier = 0.2,
        easing = 'cubic',
      })
    end,
  },
}
