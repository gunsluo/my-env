require("basic")

for f in vim.fn.glob('~/.config/nvim/lua/*.*'):gmatch('%.') do
  vim.cmd("source " .. f)
end
