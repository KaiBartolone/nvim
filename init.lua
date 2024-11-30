vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

require("config.lazy")
require("remap")
require("set")
require("cmd")
require("plugins")
