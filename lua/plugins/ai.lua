local plugins = {
  {
    "Exafunction/codeium.vim",
    cmd = "Codeium",
    event = "BufEnter",
    build = ":Codeium Auth",
  },
}

return plugins
