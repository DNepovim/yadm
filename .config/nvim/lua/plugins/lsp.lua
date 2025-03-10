return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                functionLikeReturnTypes = { enabled = false },
                variableTypes = { enabled = false },
                parameterTypes = { enabled = false },
                parameterNames = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
              },
            },
          },
        },
        -- tailwindcss = {
        --   filetypes = { "astro", "javascript", "typescript", "react" },
        --   init_options = {
        --     userLanguages = {
        --       astro = "html",
        --     },
        --   },
        -- },
      },
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
}
