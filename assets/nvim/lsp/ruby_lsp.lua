-- gem install ruby-lsp ruby-lsp-rails ruby-lsp-rspec

return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = { formatter = 'auto' },
}

