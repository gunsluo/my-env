local function config()
  require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
      },
  }
end

return {
  config = config,
}
