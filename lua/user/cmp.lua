lvim.builtin.cmp.enabled = false
lvim.builtin.cmp.formatting = {
  fields = { "kind", "abbr", "menu" },
  max_width = 0,
  kind_icons = lvim.icons.kind,
  source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    vsnip = "(Snippet)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
    tmux = "(TMUX)",
    treesitter = "(TreeSitter)",
    codeium = "(Codeium)",
  },
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  },
  duplicates_default = 0,
  format = function(entry, vim_item)
    local max_width = lvim.builtin.cmp.formatting.max_width
    if max_width ~= 0 and #vim_item.abbr > max_width then
      vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
    end
    if lvim.use_icons then
      vim_item.kind = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]
      if entry.source.name == "cmp-dbee" then
        vim_item.kind = lvim.icons.git.Diff
        vim_item.kind_hl_group = "CmpItemKindCmpDbee"
      end
      if entry.source.name == "codeium" then
        vim_item.kind = lvim.icons.misc.Robot
        vim_item.kind_hl_group = "CmpItemKindCodieum"
      end

      if entry.source.name == "crates" then
        vim_item.kind = lvim.icons.misc.Package
        vim_item.kind_hl_group = "CmpItemKindCrate"
      end

      if entry.source.name == "lab.quick_data" then
        vim_item.kind = lvim.icons.misc.CircuitBoard
        vim_item.kind_hl_group = "CmpItemKindConstant"
      end

      if entry.source.name == "emoji" then
        vim_item.kind = lvim.icons.misc.Smiley
        vim_item.kind_hl_group = "CmpItemKindEmoji"
      end
    end
    vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
    vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
        or lvim.builtin.cmp.formatting.duplicates_default
    return vim_item
  end,
}

lvim.builtin.cmp.sources = {
  {
    name = "nvim_lsp",
    entry_filter = function(entry, ctx)
      local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
      if kind == "Snippet" and ctx.prev_context.filetype == "java" then
        return false
      end
      return true
    end,
  },
  { name = "path" },
  { name = "luasnip" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "calc" },
  { name = "emoji" },
  { name = "treesitter" },
  { name = "crates" },
  { name = "tmux" },
  { name = "cmp-dbee" },
  { name = "codeium" },
}
