return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
              inlayHints = {
                functionLikeReturnTypes = { enabled = false },
                variableTypes = { enabled = false },
                parameterTypes = { enabled = false },
                parameterNames = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                functionLikeReturnTypes = { enabled = false },
                variableTypes = { enabled = false },
                parameterTypes = { enabled = false },
                parameterNames = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
              },
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
      },
    },
  },
}
