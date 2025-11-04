return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        snippets = {
          opts = {
            friendly_snippets = false,
          },
        },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<M-l"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      -- disable a keymap from the preset
      ["<C-e>"] = false, -- or {}

      -- show with a list of providers
      ["<C-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },

      -- control whether the next command will be run when using a function
      ["<C-n>"] = {
        function(cmp)
          if some_condition then
            return
          end -- runs the next command
          return true -- doesn't run the next command
        end,
        "select_next",
      },
    },
  },
}
