local function config()
  require('nvim_comment').setup({
    comment_empty = false,
    line_mapping = '<leader>//',
    operator_mapping = '<leader>/'
  })
end

return {
  config = config,
}
