local blink = require('blink.cmp')

vim.lsp.config('*', {
  capabilities = blink.get_lsp_capabilities(),
})

vim.keymap.set('n', '<space>fmt', vim.lsp.buf.format)

