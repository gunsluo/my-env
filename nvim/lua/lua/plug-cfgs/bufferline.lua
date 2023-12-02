local function setup()
  vim.api.nvim_set_keymap('n', '<C-]>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', '<C-[>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-g>', '<Cmd>BufferLinePick<CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '<leader>1', [[<Cmd>lua require('bufferline').go_to_buffer(1, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>2', [[<Cmd>lua require('bufferline').go_to_buffer(2, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>3', [[<Cmd>lua require('bufferline').go_to_buffer(3, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>4', [[<Cmd>lua require('bufferline').go_to_buffer(4, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>5', [[<Cmd>lua require('bufferline').go_to_buffer(5, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>6', [[<Cmd>lua require('bufferline').go_to_buffer(6, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>7', [[<Cmd>lua require('bufferline').go_to_buffer(7, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>8', [[<Cmd>lua require('bufferline').go_to_buffer(8, true)<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>9', [[<Cmd>lua require('bufferline').go_to_buffer(9, true)<CR>]], { noremap = true, silent = true })
end

local function config()
  vim.opt.termguicolors = true
  require("bufferline").setup({
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = "buffer_id", --"none" | "ordinal" | "buffer_id" | "both"
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = false, -- | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then 
          return true 
        end 
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then 
          return true 
        end 
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then 
          return true 
        end 
        if buf_numbers[1] ~= buf_number then 
          return true 
        end 
      end,
      offsets = {{filetype = "NvimTree", text = "File Explorer", text_align="center"}}, -- | function , text_align = "left" | "center" | "right"}},
      color_icons = true, -- whether or not to add the filetype icon highlights 
      show_buffer_icons = true, -- disable filetype icons for buffers 
      show_buffer_close_icons = true, 
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = 'directory',
    }
  })
end

return {
  setup = setup,
  config = config,
}
