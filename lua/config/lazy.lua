-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    {
        -- Theme
        { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ...},

        -- Treesitter
        {"nvim-treesitter/nvim-treesitter"},

        -- Telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            -- 'dependencies' = { 'nvim-lua/plenary.nvim' }
        },

        -- Comment
        { 'numToStr/Comment.nvim' },

        -- Harpoon
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
        },

        -- LSP
        {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},

        -- Mason
        {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

    }
  },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})
