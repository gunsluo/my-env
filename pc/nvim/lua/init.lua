require("basic")

for f in vim.fn.glob("~/.config/nvim/lua/*.lua", true, false):gmatch("[^\n]+") do
	vim.cmd("source " .. f)
end
