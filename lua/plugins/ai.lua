local plugins = {
  {
    "Exafunction/codeium.vim",
    cmd = "Codeium",
    version = "1.8.37",
    event = "BufEnter",
    build = ":Codeium Auth",
  },
}

return plugins
