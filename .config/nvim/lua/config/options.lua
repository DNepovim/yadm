-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- restore last session and open Neotree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("Persistence", { clear = true }),
  callback = function()
    require("persistence").load()
    vim.cmd("Neotree show")
  end,
  nested = true,
})

-- local persistenceGroup = vim.api.nvim_create_augroup("Persistence", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   group = persistenceGroup,
--   callback = function()
--     if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
--       require("persistence").load()
--       require("nvim-tree.api").tree.toggle(false, true)
--     else
--       require("persistence").stop()
--     end
--   end,
--   nested = true,
-- })
