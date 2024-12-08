-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "phpcs", filetypes = { "php" } },
-- }
local formater = require "lvim.lsp.null-ls.formatters"
formater.setup {
  { command = "phpcbf", filetypes = { "php" } },
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })
local lsp_manager = require "lvim.lsp.manager"

-- lsp_manager.setup("phpactor", {
--   filetypes = { "php" },
--   on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--   end,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

lsp_manager.setup("intelephense", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  cmd = { 'intelephense', '--stdio' },
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000,
        associations = { "**/*.php", "**/classes/**/*.php" },
      },
      environment = {
        includePaths = {
          '/home/efremov/Dev/web/betauto/system/classes/',
          '/home/efremov/Dev/web/betauto/modules/*/classes',
          '/home/efremov/Dev/web/betauto/application/classes/',
        }
      }
    },
  },
})

local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  return
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "/home/efremov/Dev/web/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9000,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
  {
    name = "Launch currently open script",
    type = "php",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    port = 9000,
  },
  {
    name = "Launch Built-in web server",
    type = "php",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
    port = 9000,
    runtimeArgs = {
      "-dxdebug.start_with_request=yes",
      "-S", "localhost:0"
    },
    env = {
      XDEBUG_MODE = "debug,develop",
      XDEBUG_CONFIG = "client_port=${port}"
    },
  }
}

dap.setup()
