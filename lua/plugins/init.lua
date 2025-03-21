local plugins = {
  { "andweeb/presence.nvim", opts = {} },
  {
    "sphamba/smear-cursor.nvim",
    event = "BufEnter",
    opts = {
      stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.5, -- 0.3      [0, 1]
      distance_stop_animating = 0.8, -- 0.1      > 0
    },
  },
}

return plugins
