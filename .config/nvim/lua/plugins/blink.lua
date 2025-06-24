return {
  'saghen/blink.cmp',
  version = '1.*',
  event = 'InsertEnter',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },
  },
  opts_extend = { 'sources.default' },
}
