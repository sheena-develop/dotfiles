local vim = vim or require("vim")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim を使ってプラグインを導入
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          "filename",
          {
            function()
              return os.date("%Y年%m月%d日(%a) %H:%M:%S")
            end,
            icon = "",
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}, {})
