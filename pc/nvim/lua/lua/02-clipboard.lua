if vim.fn.has("clipboard") == 1 then
    vim.opt.clipboard = "unnamed" -- Copy to the system clipboard

    if vim.fn.has("unnamedplus") == 1 then -- X11 support
        vim.opt.clipboard:append("unnamedplus")
    end
end
