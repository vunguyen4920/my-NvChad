-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

math.randomseed(os.time())
local random_header = {
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠤⠖⠒⠂⠉⠋⠉⠐⠲⠶⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⢀⠤⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠳⢄⠀⠀⠀⠀⠀",
    "⠀⠀⠀⢀⠜⠁⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣀⣀⠀⠀⠀⠛⢄⠀⠀⠀",
    "⠀⠀⣰⠃⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠉⠀⠀⠀⠈⢧⠀⠀",
    "⢀⡰⠁⠀⢀⠖⠉⠉⠑⢆⠀⠀⠀⠀⠀⠀⠀⠀⡔⠉⠀⠉⠳⡀⠀⠀⠀⠀⠷⠄",
    "⢏⠂⠀⠀⢸⠀⠀⠂⠀⢸⠀⠀⢀⠄⠀⠀⠀⠐⡁⠀⠐⠀⠀⡇⠀⠀⠀⠀⣉⠜",
    "⠀⠙⡄⠀⠈⠶⣒⣒⡲⠊⠀⠀⠪⠀⠀⠀⠀⠀⠱⢖⣒⣒⠖⠁⠀⠀⠀⡰⠁⠀",
    "⠀⠀⠘⢄⠀⠀⠀⠀⠀⠀⣀⠀⠦⢶⣤⡀⠀⣀⡀⠀⠀⠀⠀⠀⠀⢀⠜⠁⠀⠀",
    "⠀⠀⠀⠀⠑⢤⡀⠀⠀⡞⠙⣷⠰⠚⠻⠟⢺⠟⢿⠀⠀⠀⠀⣠⠔⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠈⠓⡶⠓⢤⣿⣀⠀⠀⠀⢸⠤⠼⣧⡤⠔⠊⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⢰⠁⢠⣿⣿⠛⠛⠛⢻⣿⢆⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠙⡟⡟⢻⣀⣀⣀⡿⢻⡄⢻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⢸⣶⣷⣾⣿⣿⣿⣷⣾⣷⣼⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀",
  },
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⣪⣿⡿⠋⠉⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⡇⠀⠀⠀⠀⢀⣼⣿⠟⠉⠉⠙⢰⣇⠀⠀⠀⢻⡆⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⣷⡀⢀⢤⣤⣾⣿⣿⣤⣤⠄⠀⠘⣿⣆⠀⠀⠀⢧⠀⠈⢷⡄⠀⠀⠀⠀⠀⠀⠀",
    "⠙⠿⠇⠀⢻⣿⣿⡿⠋⠀⠀⠀⢸⣿⠏⠂⠀⠀⠀⠀⠀⠀⠃⠐⠀⠀⠀⠀⠀⠀",
    "⠀⠰⠀⠀⠀⠙⠉⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⢀⠀⠁⠀⠀⠀⠀⠀",
    "⠀⠀⠣⢤⣀⠀⠀⠀⣀⣠⣴⡦⡶⠚⠥⠆⠀⠀⠀⠀⠀⢰⡄⠀⡄⠀⠀⠀⠀⠀",
    "⠀⠀⠀⢸⢹⣭⣭⣭⣵⣦⠜⠁⠈⣦⡀⠀⠀⠀⠀⡆⠀⠘⠀⠀⣿⡄⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠙⠿⢿⡿⠿⣯⣤⣴⣾⣿⣧⠀⠀⠀⢠⠁⠀⢸⠀⠀⡟⣿⣦⣀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⡉⠀⠀⢙⢉⣝⣉⠙⠀⠀⠀⣆⣀⣀⣠⣀⣼⡷⠤⠽⠛⠛⠃",
    "⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠊⠈⠉⠉⠿⢷⣿⠾⠿⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀",
  },
  {
    "⣏⢳⡭⢳⣹⡿⠁⠀⠈⢿⣆⠀⠀⠀⠀⠈⠉⠻⢿⣜⡣⢟⡼⣙⠮⣝⠮⡽⣙⢮⣝⣣⢏⡳⣭⠳⣽⣇⠀⠀⣀⣠⡴⠶⠚⠋⠉⠀⠀⠀",
    "⣎⡳⣜⢧⣿⣇⠀⡩⣀⠈⠿⣁⠀⠀⠀⠀⠀⠀⠀⡙⠿⣯⣶⣩⠳⣎⠽⡲⡝⢮⠶⣙⡮⣵⣎⣽⣲⣿⡷⠾⠋⠁⠒⠀⠀⠀⠀⠀⠀⠀",
    "⢮⠵⣎⣿⡟⢤⡹⠴⣹⠲⡸⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠈⠓⠛⠛⠙⠛⠛⠛⠛⠙⠉⠙⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴ ",
    "⡏⡞⣽⣿⠙⣦⡝⢣⡕⢣⠓⡎⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⡅",
    "⡝⢶⣿⡟⣹⠲⣝⢮⡵⢫⡞⣵⣫⡞⣿⣦⣐⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢀⣔⣾⡟⣟⢫⡑",
    "⡝⣾⣿⣟⢶⣛⡮⢷⣹⢳⣟⣷⣯⣿⡶⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣶⣿⡟⡳⢉⢆⢣⠜",
    "⣝⣿⡿⣎⢷⣫⠽⣧⢏⡷⣾⣿⣿⣿⣹⣿⢃⠁⠀⢠⡤⣴⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⠜⢦⣤⡀⠀⠀⠀⠐⠈⢿⡣⢅⠣⣈⠂⡉",
    "⣾⣿⣵⣫⣾⣽⣿⣾⣝⡞⣭⢫⡕⢡⣿⡏⡅⠀⠐⢿⣦⣾⣿⠃⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⣾⣿⡏⠂⠀⠀⠀⢑⠘⣿⠀⢤⣤⣐⣀",
    "⣿⡟⣾⣿⣿⣿⣿⣿⣿⣟⢦⠓⠌⣱⣿⠑⠌⠀⠀⠀⠉⠛⠉⠀⠀⣤⣤⣠⣀⠀⠀⠀⠀⠀⠈⠙⠋⠁⠀⠀⠀⠀⠀⠀⢻⡆⣻⣿⣿⣷",
    "⡟⡼⢻⡿⣿⡿⣿⢿⡿⠏⡂⠡⡜⣿⣷⣶⣶⣤⠀⠀⠀⠀⠀⠀⠀⠈⠉⠋⠃⠀⠀⠀⠀⠀⠀⠀⠀⢠⢤⡰⢤⣄⠀⠀⢸⣧⢸⣿⣿⣿",
    "⡧⢍⡳⣜⠢⡅⣤⢢⠀⠐⠠⢁⢼⣿⣇⠶⣌⢯⡁⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣈⣀⠀⠀⠀⠀⠀⠈⢸⢆⡛⢦⣝⠣⠀⢀⢻⡆⢹⣿⣿",
    "⠻⡜⢣⡜⢧⠻⣄⠟⣧⡘⡤⣀⣼⣿⢻⣧⣜⡟⠀⠀⠀⠀⠀⠀⠘⣿⡿⠛⠀⠛⢿⠄⠀⠀⠀⠀⠀⠛⡜⡻⢤⢸⠇⠀⠀⠸⣧⡸⣿⣿",
    "⡰⢍⡳⣜⢣⠟⣬⢛⡴⣙⠶⣙⢾⣿⡀⢁⠉⠀⠀⠀⠀⠀⠀⠀⠄⣿⡎⠀⠀⠀⣸⡃⠀⠀⠀⠀⠀⠀⠉⠈⠁⠉⠀⠀⠀⠂⢸⣷⠀⠡",
    "⡰⣌⠐⠈⠃⠛⠀⠃⠈⠉⠉⠛⠈⢻⣷⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠹⠲⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢸⣷⠀⠡",
    "⡳⣇⢎⢤⣁⢂⡁⢌⣤⣷⣎⠰⠦⢾⡝⢧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣿⡎⡀",
  },
  {
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⣀⠀⠀⠀⢠⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣎⡀⢧⠑⣧⠀⢀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣷⡷⠻⠟⣿⢆⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡨⢿⣤⣧⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⣿⣿⡿⠿⠿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⣐⠄⠑⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⡉⣸⠁⣄⠔⡄⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠊⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⣩⣾⠗⢀⣿⡄⠽⣾⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⢴⣮⣣⣵⣿⣏⣤⠾⣿⣿⣬⣿⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠙⠿⣿⣿⠟⣁⣠⣶⣿⣿⣿⠿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠰⠿⡷⠀⠀⠀⠀⠀⠄        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⣀⣼⣶⣤⡄⠀⠀⠀⠀⠈⠐⠢⡀⡜⣿⡟⢛⡻⣟⣿⣿⡁⠘⣽⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⡀⠀⢀⠀⠀⠘        ",
    "     ⠀⠀⠀⠀⠀⠀⣔⣏⢜⣽⣿⣿⢀⠀⡀⡀⠀⠀⠀⢈⢃⣿⡯⢊⣵⡶⠚⢛⣷⡄⣷⣿⡈⠂⡄⠀⠀⠀⠀⠀⡗⢹⢧⢀⠂⠀⠀⡀        ",
    "     ⡀⠀⠀⠀⠀⢀⣯⢧⢗⡟⢼⣞⠛⣿⣿⣧⡄⠀⢀⡼⣿⣿⠞⣱⠏⠀⠀⠀⠹⣷⣏⣿⠀⠀⠠⠀⠀⠀⣰⡐⣳⢾⢽⠀⠀⠀⠀⠀        ",
    "     ⣷⣄⡀⠀⠀⣼⠛⢻⣰⣺⣣⠃⢪⡾⠘⣻⡅⠀⢰⣧⣿⣇⠜⣱⣧⡀⠄⢐⣚⣾⣿⡋⠀⠀⠀⠙⠀⠀⠀⠇⡌⣿⡫⠁⠀⠀⠀⠀        ",
    "     ⢻⡟⠃⠀⠀⠀⠀⠀⢻⡛⣢⡾⠺⢅⢂⠿⣷⠀⢸⣿⠻⠈⢰⣿⣿⡿⣼⣯⣾⣿⣿⡇⠀⠀⠀⠀⠀⠀⠈⣰⢛⢏⣉⡪⢆⠀⠀⠀        ",
    "     ⣤⢹⣄⠀⠀⠀⠀⠁⢰⡼⠋⠀⠀⠷⠁⠀⢧⣧⣿⠃⠇⠀⣬⢿⡏⠻⣄⣿⠻⣿⡏⠀⠀⠀⠀⠀⠀⠀⠎⠉⠿⠿⢤⡤⢎⠀⠀⠀        ",
    "     ⣷⣌⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠸⣶⣲⣧⣿⡷⠀⠀⠹⡚⣿⡃⠀⠀⠀⠀⠀⠀⠀⢀⡠⣍⠀⠀⠉⠞⠄⠀⠀        ",
    "     ⠘⢿⣿⣿⠗⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡏⠀⠀⠉⠛⣿⣿⡇⠀⠀⠀⢡⢸⡇⠀⠀⠀⢄⠳⠂⡐⡱⠇⠪⠀⠉⠈⠀⠀⠀⠀        ",
    "     ⠀⠀⢪⠙⣶⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀⠄⠠⣿⢹⡇⠀⠀⠀⢸⢟⣷⣶⡄⠀⠐⠖⠐⠃⠚⠟⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⢀⠑⠀⡎⡺⢽⣯⡀⠀⠀⠀⠀⣸⡿⠁⠀⠀⠀⠀⠀⡿⣾⠃⠀⠀⠀⣈⠾⠛⣻⣯⠺⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⣰⢰⠊⠀⡕⣿⡟⣂⡄⠀⠐⠿⠃⠀⠀⠀⠀⠀⠀⢷⣿⠀⠀⢀⠎⠑⣒⣒⣻⣿⣷⣧⢵⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⢈⠀⠀⠊⠬⢀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣾⣿⣀⡠⠁⣴⣽⠿⠷⣿⠿⢿⣿⡿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
    "     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢵⠀⠀⠀⠀⠄⠊⠉⠉⠉⠀⠀⠀⠀⢐⠒⠚⠓⠊⠑⠊⠁⠤⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀        ",
  },
  {
    "⠀⠀⢀⠉⠯⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠃⠄⠈⠙⢷⣄⠀⠀⠀⢀⠐⠁⠆⠈⠈⠲⡄⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀",
    "⠀⠀⠀⠀⠀⠈⠀⠀⠙⢾⣦⣄⡎⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠐⢄⠀⠀⢩⣿⡇⠘⠀⠀⠀⡠⢊⣿⣥⠀⠀⠈⠄⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠄⡀⠀⠀⠙⢳⠙⠿⠖⢺⡾⢟⣗⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⣀⠀⠀⠀⠀⠔⠀⠀⠀⣠⠙⠣⡀⢐⣖⣠⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀",
    "⠀⠀⠘⣿⣷⣄⠀⠁⠀⢤⠃⠀⠀⠈⠛⣗⢋⣿⣿⠩⠛⣷⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⢃⣿⣿⣿⣷⣦⠤⠀⢀⠀⢠⠆⠁⣠⣿⣿⣯⠎⠘⠛⢶⣄⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠘⢛⣻⣿⣿⣿⣷⡜⠊⠀⣏⠤⠞⡽⣷⣿⣇⣤⣶⣶⣤⣙⢳⣦⣀⡀⠀⠀",
    "⠀⣶⣿⣿⣿⣿⡿⠿⣿⡇⠀⢀⣶⣥⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⢿⣿⣦⣄",
    "⠀⣿⣿⡿⠋⠁⢀⢾⡝⠀⠨⠾⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠈⡻⣿",
    "⠜⠋⠁⢁⢄⣚⣋⣁⡀⠀⠰⡖⠋⣁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀",
    "⠀⠀⠀⣨⣿⣿⣿⣿⠁⠀⣼⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⡟⠃⠀⠀⠀⠀",
    "⠀⠀⢀⣿⣿⣿⣿⣟⠀⢰⠟⣿⣿⣿⣿⣿⠀⠀⠀⣽⣿⣿⡟⠋⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠘⢿⣿⣿⣿⡅⠁⠌⢆⠻⣿⣿⣿⡿⠤⠀⣀⢻⣿⣿⣤⠤⢤⠤⠤⠤⠤⠀",
  },
  {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣟⣯⣟⡿⣿⣻⢿⣻⣿⣿⡿⣿⢿⣿⣿⣻⣟⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣐⢀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠹⣾⡽⣻⣷⢿⣯⢿⣿⣳⠻⣔⢫⡾⣿⣷⣻⢾",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⡅⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⢠⣤⣤⣤⣤⠀⠀⠀⣿⣽⣷⣿⢻⣽⣿⣿⣧⣴⣬⣷⣼⢳⣯⡟⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢮⣽⠆⠡⠀⣐⣤⣶⣦⣤⣴⡴⠀⠐⢶⣿⣿⣿⣿⣿⣿⣶⣇⢻⣿⣷⡿⣿⣟⣿⣿⣿⣿⣽⣿⣿⣿⣿⣽⣞",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣾⣿⣿⣿⣿⣿⣿⠛⠀⠄⠀⠀⠉⠋⠩⢉⡉⡟⠛⠀⠸⠿⣿⣽⣿⣯⣿⣿⣿⣿⣿⠿⠻⠛⠿⢻⣾",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⢿⠻⢿⢿⣛⠡⠁⠀⢀⡀⠄⠀⠀⢱⠠⠀⠀⠀⠀⠀⠀⠰⠰⣿⣿⣿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠹",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⡁⠊⢠⠈⠀⠀⠀⠀⢐⠊⢁⡀⠀⠀⠀⢄⠰⢦⡀⠀⠀⠀⠸⡀⣹⣿⣿⣿⣿⣿⣿⣿⣯⢶⣤⠀⠴⠒⠨",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣟⢧⠃⠀⠀⠀⠀⠔⠁⠀⠀⠘⠀⠀⠁⠀⠈⠀⢢⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡂⠉⡀⠀⠀⢰",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⢽⢻⡿⣾⡶⡄⠀⠀⢀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠠⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣢⢧⡄⡠⢼",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡸⢿⣿⠻⡈⢲⠁⠀⢀⡀⡀⣠⣴⣶⣶⣶⣶⣿⣿⣯⠀⠀⠀⠀⠂⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣯⣰⣼⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣕⣾⣿⣷⣖⡆⠃⠀⠀⠱⣿⣿⢻⡻⠟⣛⣈⠤⠖⢿⡗⠀⠀⡀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡹⣀⠄⠀⠀⢙⣭⢩⣀⣄⠦⠴⢜⣒⡽⠏⠀⠀⢰⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣵⣷⣂⡠⡀⢺⡋⠷⡩⠖⠩⠂⠲⠠⠊⠀⠀⣼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⠘⠠⠀⠛⠃⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣶⣄⡀⡀⠀⠀⠀⠀⣠⣴⣾⣾⣿⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⢷⣿⣻⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⠡⢸⣿⣿⣿⣿⣿⣿⢿⣻⣟⣟⢿⣻⣿⣿⣿⣿⣿",
  },
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣽⡴⡀⢠⡄⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣅⠈⠍⠒⠽⡌⣀⣉⡘⠛⠳⣢⡀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⡔⣿⣿⠟⣿⠿⡆⠀⠀⡠⠜⣻⣿⣻⢳⡆⣿⡙⢧⠀⠀⠀⠀⠀⠀⢡⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⣿⣿⠁⠀⢸⣿⢱⢀⢮⡧⣠⢁⣿⠗⣭⣜⡫⡎⢲⠇⠀⠀⠀⠀⠀⠿⣿⣿⠯⡓⠆⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⢟⠻⣷⣶⣿⠞⢸⢸⠁⠩⢃⣖⡁⠤⠄⡽⣚⡔⠋⠋⠁⠀⠀⠀⠀⠀⠑⠐⡢⠝⠁⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠑⠻⢿⡟⢹⣾⣿⣵⡪⣙⠀⠊⠴⠉⠁⠉⠉⠁⠀⢒⣄⣀⡀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⢀⠠⠀⠤⠄⠉⠈⢳⠟⢣⡷⢕⠤⡀⠀⠀⠔⠢⣒⠉⢠⣀⠈⢹⠇⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠈⠀⠀⢀⡴⠒⠊⠀⢺⣧⣧⠈⠳⣄⠑⠦⡀⣉⠃⠀⢠⠚⢻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠱⣧⠀⠀⠈⠉⠓⠒⢒⠒⠒⠁⠀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡭⠭⣽⣉⢛⣺⠣⣄⠠⠊⠀⠀⠀⠀⠀⠀⢠⠁⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣰⠿⠁⠀⠀⢁⠀⣁⠂⢌⢳⡀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠟⠛⠃⠤⠃⠀⢀⠀⠹⠫⠀⠌⠀⠙⣄⠀⠀⠀⠀⢀⠎⢠⡢⢀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⢀⠀⠀⠀⠀⡞⠉⠁⠀⠀⠀⠀⠀⠀⠁⢀⡡⣤⣤⣄⡘⠀⠀⣏⠀⠀⠀⡀⠂⣰⣁⣉⡲⠫⢲⢄⣀⠀⠀",
    "⠀⠀⠀⠋⡀⠀⢀⠀⢻⠀⠀⠀⠀⠀⠀⠀⡀⡢⢗⢬⣞⣿⣿⠂⠀⠀⠘⢆⠔⢋⠀⠠⣧⠈⢰⣭⣽⢂⡙⠺⢗⣄",
    "⠀⠀⠀⠰⠑⡔⢀⣴⣿⡿⢭⠝⢲⣆⣲⡮⢾⠟⢬⠟⠟⣿⠏⠀⠀⠀⠀⠈⠫⣤⢀⣼⣿⡷⢤⢹⣅⠉⠁⠈⠉⠝",
    "⠀⠀⠀⠠⡄⡀⣾⢿⣿⡶⢾⡖⣉⣿⠟⠋⣾⣾⢯⣠⣈⠛⠀⠀⠀⠀⠀⢀⣴⣿⠿⣿⣿⠁⠀⡎⠏⠀⠎⠄⠀⠀",
    "⠀⠀⠄⠐⠐⢺⠍⠀⢣⣕⠶⠛⠉⢀⢀⣴⢿⣷⣷⣝⣨⣆⠀⠀⠀⢀⡤⠿⠯⣞⢿⣿⠁⠀⠠⠀⠀⠀⠁⠀⠀⠀",
    "⠀⠀⠀⠀⡀⠀⠉⢁⣠⡀⢶⠀⠀⢣⠆⣾⠀⣷⡿⣟⢾⡿⠢⡀⣰⡋⠀⠠⠀⠈⢻⠃⠀⠀⠀⠆⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠐⡶⡩⡟⣡⣟⣇⠀⣀⣀⣼⠀⣿⣏⣷⣳⣿⡿⠃⠰⡜⠘⠆⡀⠀⠀⢀⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⢠⢣⣏⠿⣯⢫⣿⢂⢳⢺⢹⡄⠙⠺⠯⠟⠋⠁⡄⠁⠂⠀⠀⠨⠂⠀⠊⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⢀⠆⢠⣿⠀⢿⡄⣩⣇⢹⣬⡶⣶⠀⠀⠀⠀⠸⠨⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  },
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢒⣈⣥⣶⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠈⡉⢉⣉⠉⠉⠉⠉⠂⢹⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠄⠀",
    "⣆⠙⡇⠸⣿⣦⣾⠀⠀⢠⣀⢸⠟⡋⠈⠣⣄⣀⠀⠀⠀⠀⡇⠀⠀⠀⢀⠨⠋⠓⣤⢀⡀⠀⠀⠀⠰⣿⣿⡖⠉⢄",
    "⠃⢀⢀⣀⣿⣿⡁⠀⠘⠳⠓⡞⠰⠈⡼⡿⡗⠂⠹⠤⠒⢚⢏⠠⢠⢒⠩⣷⡆⠊⡐⠃⠐⠓⠋⢀⡔⠻⣻⠟⡤⠢",
    "⠉⠉⣏⣢⡙⣠⣜⣯⣭⣍⡉⠃⢀⠆⠂⣰⢰⠀⠀⠀⠀⠉⡏⠈⠉⠀⠀⡉⠰⢠⡇⠀⢒⣶⠿⡿⢟⠧⠖⠊⢲⠀",
    "⠀⠀⣀⢸⠈⢋⠯⣽⣭⣗⡆⠀⠘⠀⢀⡀⠹⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠋⠉⠁⢃⠀⠻⠿⢻⠗⢉⡄⠀⠠⣞⡓",
    "⡐⢟⡝⠡⠤⠼⠀⠈⠉⠉⠀⣀⡇⢀⠉⠂⡀⠁⠀⠀⠀⠀⠀⠀⠀⢠⠁⡠⠋⡄⠈⠀⠀⠀⢸⢰⡲⠁⠉⠁⠘⠀",
    "⠀⠃⠃⢀⣄⠀⠡⣀⣀⣀⠀⡷⢱⠯⠭⠤⢼⠸⠀⠄⠀⠀⠀⠀⠀⢎⡈⠀⠀⠐⡄⢆⠀⠀⣸⣰⠁⣠⢎⡦⠀⠃",
    "⠀⠘⢀⢮⢏⢳⢤⣶⣦⠀⠀⡇⡌⠀⠀⠀⠀⠇⠇⠁⠀⠀⠀⠀⠀⢠⠁⠀⠀⠀⠡⠩⠀⠀⡯⣷⡟⣌⠢⠇⠳⠘",
    "⠹⡥⠇⠤⠮⠂⣸⣷⡽⠁⣰⣸⠀⠀⠀⠀⠀⠀⠐⠙⢀⣾⣻⡢⠬⠚⠀⠀⠀⠀⠀⡇⢆⠀⢝⠃⠁⢯⠥⠀⡀⢇",
    "⡲⠔⠀⠀⢒⡫⢠⠐⠫⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡷⠿⢇⠀⠀⠀⠠⣤⣆⡀⣈⡵⠕⣡⠠⡇⢱⣞⡀⠀⠀",
    "⠘⠀⠀⣼⢻⠣⠼⠁⠂⠨⡙⣲⣶⡿⠟⠁⠀⠀⠀⣔⠕⠊⠉⢍⠪⣆⠀⠀⠙⠛⠛⠓⠒⠁⢣⠀⠉⢀⣍⣧⠀⠀",
    "⠀⠀⠀⠳⢿⠀⠀⢀⠃⠀⠀⠀⠀⠀⠈⣏⣶⣴⣞⠡⠖⠨⠤⠼⢶⠌⣳⣶⠽⠁⠀⠀⠀⠀⢀⠷⠛⠛⠏⠁⠀⠀",
    "⠀⠀⠀⠀⡜⠀⠀⠉⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣀⡀⠀⡈⠀⠀⠀⠀⠀⠀⠀⠀⠠⠃⠀⢀⠀⡀⠀⠀⠀",
    "⠀⠀⠀⠀⠡⠈⢢⢀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠉⠁⠈⠑⡀⠀⠀⠀⠀⠀⠀⡐⠁⠠⠊⡇⠰⠁⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠁⢸⠀⠑⢄⢱⠀⠀⠀⠀⠀⠀⠀⠠⠂⠀⡰⠒⠢⡀⠈⠄⠀⠀⠀⠀⠀⢇⢎⠀⠀⠟⣥⠀⠀⠀⠀",
    "⠀⠀⠀⠀⢰⡍⡈⠀⠀⠆⢾⠀⠀⠀⠀⠀⠀⢠⠁⡤⠂⠀⠀⠀⠈⢢⢈⡄⠀⠀⠀⠀⠯⡬⠀⠀⠰⢚⡇⠀⠀⠀",
    "⠀⠀⠀⠀⠘⣳⣁⠀⠈⣴⡏⠀⠀⠀⠀⠀⠀⢸⠥⢧⠀⠀⠀⠀⠀⣼⣺⠁⠀⠀⠀⢀⣸⣹⠀⠀⠶⣾⡀⠀⠀⠀",
    "⠀⠀⠀⠀⠘⠜⠉⠀⠀⣿⣷⣤⡄⠀⠀⠀⠀⠀⢣⠯⠀⠀⠀⠀⠀⡿⣆⠀⠀⠀⠈⠛⠒⠋⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣻⡀⠀⠀⠀⢀⣷⣋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  },

  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡰⠺⡿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⢀⢹⣿⢦⣬⣽⠿⣿⣷⣄⠀⣀⠀⡀⠀⠀⠀⠀⢀⣨⡗⠂⠛⢛⣤⡀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠰⠞⢛⣛⣌⠁⢿⠗⡿⠙⠀⡴⢯⣶⠃⠀⢀⣤⣔⡞⠃⠀⠀⠀⠀⠁⠈⢃⠀",
    "⠀⠀⠀⠀⠀⠀⠀⢴⣵⠏⣁⡉⠉⠑⠒⠛⢭⠿⣽⢿⡤⠃⠀⡜⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠆",
    "⠀⠀⠀⠀⠀⠀⣴⣉⢬⣯⣭⣽⣿⣻⣶⠶⣿⣴⢽⣸⠁⠀⠘⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄",
    "⠀⠀⣀⣤⣴⢶⠉⠈⢰⣿⣼⣯⡧⠀⢀⠇⠀⠹⢯⣘⡄⠀⠀⠐⠒⢐⡂⡀⠀⠀⠀⠀⠀⠀⡘⠀",
    "⠀⣾⠙⢎⣨⡈⣠⠔⠊⠉⢈⡏⢡⣀⣸⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠘⢃⡀⠀⢀⣰⣷⠘⠀⠀",
    "⢰⣩⣠⣄⡟⠉⠀⠀⠀⠀⠈⠹⣇⣥⣬⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠃⠒⠋⠉⠀⠀⠀⠀",
    "⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣼⣦⢸⣿⣺⣤⠀⠀",
    "⠀⠀⢰⣿⣟⠀⠀⠀⠀⣀⣶⣄⠀⠀⢀⡀⠀⠀⠀⠀⠀⢰⣄⠀⠀⠀⠀⠘⢿⣿⠸⠏⣽⢷⣿⡄",
    "⠀⢀⢸⣿⡇⠀⠀⠀⠀⠙⢿⣿⣶⣰⣿⡇⠀⠠⣤⣴⣶⣼⣿⣷⣀⠀⠀⢨⣾⣿⣿⣿⢇⣼⣿⠁",
    "⠀⢾⣿⣿⣷⡾⠃⠀⠀⠀⠀⣽⣿⣿⣿⡄⠀⠐⠛⠛⠛⢻⣿⠿⠁⠀⠀⠸⣿⣿⣷⣶⣿⣿⣿⠀",
    "⠀⠀⠙⢿⠛⠀⠀⠀⠀⠀⠟⠛⠛⠛⠻⠁⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠛⠛⠛⠛⠟⠻⠋⠀",
  },
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠪⣿⡯⡒⣀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡲⣖⡠⣀⠀⠀⠀⠀⠀⠀⣀⢀⢰⠼⡿⠘⠈⠓",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣿⠟⡟⣵⠀⠀⠀⢀⣠⠧⢴⡛⣷⢣⢱⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠒⡾⣤⡟⣗⣹⡞⠃⠀⢰⡻⢋⣿⣾⣧⡟⣡⣼⠏⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢀⠞⣏⢻⣡⡾⢪⣼⣿⢡⠀⠀⠀⠑⣉⣿⡿⣽⢿⡿⠉⢠⠇",
    "⠀⠀⠀⠀⠀⣀⡀⢀⣀⠀⠀⠀⠀⠀⢠⠂⠹⡹⠶⢤⣽⡀⠤⢄⡀⠀⠀⠘⠤⢾⢞⣯⣶⡿⠟⠁⣼⠀⠀⠐⠛⠉⡟⢶⣿⣯⠔⠛⠋⠀",
    "⠀⠀⠀⠺⣁⡯⠋⣣⣴⠗⠀⠀⠀⠀⠀⠁⣳⣃⣤⡛⣽⢦⡆⣱⢸⡄⠀⠴⠖⢻⢩⣿⣟⢠⠔⠞⠁⠀⠀⠀⠀⠀⢱⡞⡇⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⡼⣧⣴⠋⢖⠓⠢⣤⠀⠀⠀⠀⠣⡬⢻⢿⠙⠚⡟⡆⡏⡷⠀⠀⠀⠸⡩⢹⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⠤⠇⠀⠀⠀⠀⠀",
    "⡀⣀⣀⣀⣑⣾⣛⢳⡾⠇⣄⣾⡇⠀⣀⣤⣊⣻⡾⢴⠃⠀⡣⡼⡸⠃⠀⠀⠀⠀⡷⣺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠙⠳⠌⣀⣘⠚⣺⣉⣈⡪⠞⠁⠀⠀⠧⢴⣗⠙⠋⣙⣨⣤⣴⠟⠁⠀⠀⠀⠀⠀⠓⡚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  },
  {
    "⠀⠀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⢠⣾⢿⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⣴⣷⣶⣴⣿⡿⢻⢶⣾⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⣞⠛⣭⣹⡷⣦⡀⠀⠀⠀⠀",
    "⠸⣿⣿⣟⡙⠿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⣿⣷⣉⠏⡻⣿⣿⡛⢳⡆⠀",
    "⠀⠹⣿⡿⣷⣤⣹⡟⣩⣿⣿⣁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣀⣹⣿⣟⣰⠁⠸⠧⠇⢘⣿⠀",
    "⠀⠀⢘⣿⣿⡿⣿⣿⣿⡧⠼⠿⠿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡟⢠⣿⠜⣿⣿⣽⣿⣷⣦⣤⣼⠟⠀",
    "⠀⠀⢸⣿⠙⠻⣿⣿⣷⣶⣶⣆⣀⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠷⣾⣯⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀",
    "⠀⠀⢸⣿⡀⠀⢨⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠛⠛⣿⣿⣿⠀⠙⣷⠀⠀",
    "⠀⠀⠈⣿⠙⠃⢰⣿⣋⣹⡏⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣃⣠⣤⣿⣿⣿⣂⣀⣹⣇⠀",
    "⠀⠀⢠⣿⠀⠀⢸⡟⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⢻⣿⣿⡟⠁⣿⢿⣿⣻⡿⠀",
    "⠀⠀⠈⣿⣿⣷⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠻⣾⣿⡿⠃⠀⠘⣿⡶⠶⣿⣇⠀",
    "⠀⠀⠀⢿⡍⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣤⠤⣤⣿⠀⠀⠀⠀⠸⣦⣄⣈⣟⣷",
    "⠀⠀⠀⠘⠷⠶⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⢠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  },
}

M.ui = {
  theme = "tokyodark",

  nvdash = {
    header = random_header[math.random(1, #random_header)],
    load_on_startup = true,
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  telescope = {
    style = "bordered",
  },

  lsp_semantic_tokens = true,

  tabufline = {
    show_numbers = true,
    lazyload = true,
  },
}

-- clipboard
local in_wsl = os.getenv "WSL_DISTRO_NAME" ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = "wsl clipboard",
    copy = {
      ["+"] = "win32yank.exe -i",
      ["*"] = "win32yank.exe -i",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
  }
end

return M
