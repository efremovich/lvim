-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "phpcs", filetypes = { "sql" } },
-- }
local formater = require "lvim.lsp.null-ls.formatters"
formater.setup {
  { command = "pg_format", args = { "-tTf", 2 }, filetypes = { "sql" } },
}
