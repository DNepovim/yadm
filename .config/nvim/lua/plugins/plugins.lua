return {

  {
    "ap/vim-css-color",
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
  },
  {
    "okuuva/auto-save.nvim",
    version = "*",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      noautocmd = true,
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    opts = {
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          hide_dotfiles = false,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
        },
      })
    end,
  },
  { "styled-components/vim-styled-components" },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    keys = {
      { "<leader><leader>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = { "filename" },
        lualine_z = {},
      },
    },
  },
  { "mrjones2014/smart-splits.nvim" },
  {
    "Goose97/timber.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("timber").setup({})
    end,
  },
}
