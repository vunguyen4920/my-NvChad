require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

local o = vim.o
o.title = true

if vim.g.neovide then
  vim.o.guifont = "FantasqueSansM Nerd Font:h14"

  vim.g.neovide_refresh_rate = 75

  vim.g.neovide_cursor_vfx_mode = "railgun"
end

vim.opt.relativenumber = true
