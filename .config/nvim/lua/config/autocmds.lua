-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- hide tabline
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.opt.showtabline = 0
  end,
})

-- parentheses highlight
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function()
    vim.cmd([[highlight MatchParen guibg=#555555]])
  end,
})
