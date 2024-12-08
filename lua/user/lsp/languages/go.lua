local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { command = "gofmt", filetypes = { "go" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "golangci-lint", filetypes = { "go" } },
}

local actions = require "lvim.lsp.null-ls.code_actions"
actions.setup {
  { command = "impl",         filetypes = { "go" } },
  { command = "gomodifytags", filetypes = { "go" } },
  -- { command = "refactoring", filetypes = { "go" } },
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })
local lsp_manager = require "lvim.lsp.manager"


lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
      },
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}

------------------------
-- Language Key Mappings
------------------------

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

------------------------
-- hierarchy-tree-go
------------------------
local tree_ok, tree = pcall(require, "hierarchy-tree-go")
if not tree_ok then
  return
end

tree.setup()
