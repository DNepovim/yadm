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
      },
    },
  },
}
