require('blink.cmp').setup({
  keymap = { preset = 'default' },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer", "codeium" },

    providers = {
      codeium = {
        name = 'codeium',
        module = 'blink.compat.source',
        score_offset = 3,
      },
    },
  },
  completion = {
    documentation = {
      auto_show = false,
    },
    menu = {
      draw = {
        columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      }
    }
  },
  signature = { enabled = false, trigger = { enabled = false }, },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
