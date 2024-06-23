require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.title = true

if vim.g.neovide then
  vim.o.guifont = "FantasqueSansM Nerd Font:h14"

  vim.g.neovide_refresh_rate = 75

  vim.g.neovide_cursor_vfx_mode = "railgun"
end

vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
