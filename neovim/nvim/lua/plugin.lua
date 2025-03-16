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

require("lazy").setup({
  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = require("plugin-options/tokyonight"),
  },
  -- https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = require("plugin-options/nvim-web-devicons"),
  },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    opts = require("plugin-options/lualine"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require("plugin-configs/treesitter"),
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    opts = require("plugin-options/nvim-treesitter-context"),
  },
  -- https://github.com/romgrk/barbar.nvim
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = require("plugin-options/barbar"),
    version = "^1.0.0",
  },
  -- https://github.com/hadronized/hop.nvim
  {
    "phaazon/hop.nvim",
    branch = "v2",
    opts = require("plugin-options/hop"),
  },
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = require("plugin-configs/indent-blankline"),
  },
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require("plugin-configs/neo-tree"),
  },
  -- https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
        config = require("plugin-configs/nui"),
      },
      "rcarriga/nvim-notify",
    },
    opts = require("plugin-options/noice"),
  },
  -- https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = require("plugin-options/toggleterm"),
  },
  -- https://github.com/voldikss/vim-translator
  {
    "voldikss/vim-translator",
    cmd = { "TranslateW", "TranslateW --target_lang=en" },
    keys = {
      -- Popup
      { "<Leader>t", "", desc = "Translate" },
      { "<Leader>tj", "<Cmd>TranslateW<CR>", mode = "n", desc = "Translate words into Japanese" },
      { "<Leader>tj", ":'<,'>TranslateW<CR>", mode = "v", desc = "Translate lines into Japanese" },
      { "<Leader>te", "<cmd>TranslateW --target_lang=en<CR>", mode = "n", desc = "Translate words into English" },
      { "<Leader>te", ":'<,'>TranslateW --target_lang=en<CR>", mode = "v", desc = "Translate lines into English" },
      -- Replace
      { "<Leader>tr", "", desc = "Translate Replace" },
      -- Replace to Japanese
      { "<Leader>trj", ":'<,'>TranslateR<CR>", mode = "v", desc = "Replace to Japanese" },
      {
        "<Leader>trj",
        function()
          vim.api.nvim_feedkeys("^vg_", "n", false)
          -- Execute the conversion command after a short delay.
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("<Cmd>TranslateR\n", "n", false)
          end, 100) -- 100ms delay
        end,
        mode = "n",
        desc = "Replace to Japanese",
      },
      -- Replace to English
      { "<Leader>tre", ":'<,'>TranslateR --target_lang=en<CR>", mode = "v", desc = "Replace to English" },
      {
        "<Leader>tre",
        function()
          vim.api.nvim_feedkeys("^vg_", "n", false)
          -- Run translator command after a short delay
          vim.defer_fn(function()
            vim.api.nvim_feedkeys(":TranslateR --target_lang=en\n", "n", false)
          end, 100) -- 100ms delay
        end,
        mode = "n",
        desc = "Replace to English",
      },
    },
    config = require("plugin-configs/vim-translator"),
  },
  -- https://github.com/potamides/pantran.nvim
  {
    "potamides/pantran.nvim",
    keys = {
      { "<Leader>tw", "<Cmd>Pantran<CR>", mode = { "n", "v" }, desc = "Show Translate Window" },
    },
    config = require("plugin-configs/pantran"),
  },
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    opts = require("plugin-options/gitsigns"),
  },
  -- https://github.com/kdheepak/lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<Leader>lg", "<Cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },
  -- https://github.com/crnvl96/lazydocker.nvim
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = require("plugin-options/lazydocker"),
    keys = {
      { "<Leader>ld", "<Cmd>LazyDocker<CR>", desc = "LazyDocker" },
    },
  },
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = require("plugin-options/mason"),
  },
  -- https://github.com/williamboman/mason-lspconfig.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = require("plugin-options/mason-lspconfig"),
  },
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = require("plugin-configs/lspconfig"),
  },
  -- https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",         -- LSP連携
      "hrsh7th/cmp-buffer",           -- バッファ内の補完
      "hrsh7th/cmp-path",             -- パスの補完
      "hrsh7th/cmp-cmdline",          -- コマンドラインの補完
      "L3MON4D3/LuaSnip",             -- スニペットエンジン
      "saadparwaiz1/cmp_luasnip",     -- LuaSnip連携
      "rafamadriz/friendly-snippets", -- スニペット集
    },
    config = require("plugin-configs/nvim-cmp"),
  },
}, {})
