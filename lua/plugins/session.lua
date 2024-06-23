local plugins = {
  {
    "rmagatti/auto-session",
    cmd = { "SessionRestore", "SessionDelete" },
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_use_git_branch = true,
      }
    end,
  },
}

return plugins
