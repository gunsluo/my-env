local function config()
  require('nvim_comment').setup({
    comment_empty = false,
    line_mapping = '<leader>zz',
    operator_mapping = '<leader>z'
  })
end

return {
  config = config,
}
