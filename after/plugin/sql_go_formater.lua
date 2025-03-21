-- ~/.config/nvim/after/plugin/sql_go_formatter.lua

local ts = vim.treesitter
local tsquery = [[
(short_var_declaration
  (expression_list
    (raw_string_literal) @sql
  )
  (#match? @sql "(select|insert|update|delete|with)")
)
]]

local formatter_command = "pg_format -f 2 -t -T"

local function format_sql_strings()
  local parser = ts.get_parser(0, "go")
  if not parser then return end

  local root = parser:parse()[1]:root()
  local query = ts.query.parse("go", tsquery)
  local bufnr = vim.api.nvim_get_current_buf()

  local changes = {}

  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    local name = query.captures[id]
    if name == "sql" then
      local range = { node:range() }
      local indentation = string.rep(" ", range[2])

      local start_row, start_col, end_row, end_col = node:range()
      local lines = vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {})
      local text = table.concat(lines, "\n")

      -- Удаляем обратные кавычки из raw string literal
      local sql = text:sub(2, -2)

      -- Вызываем Python-скрипт для форматирования
      local handle = io.popen(string.format('echo %q | %s', sql, formatter_command))
      local formatted_sql = handle:read("*a")
      handle:close()


      -- print(vim.inspect(formatted_sql))
      -- for idx, line in ipairs(formatted_sql) do
      --   formatted_sql[idx] = indentation .. line
      -- end

      -- Добавляем обратно обратные кавычки
      formatted_sql = "`" .. formatted_sql .. "`"

      -- Сохраняем изменения
      table.insert(changes, {
        start = range[1] + 1,
        final = range[3],
        text = formatted_sql,
      })
    end
  end
  -- Применяем изменения
  for _, change in ipairs(changes) do
    vim.api.nvim_buf_set_text(
      bufnr,
      change.start_row,
      change.start_col,
      change.end_row,
      change.end_col,
      { change.text }
    )
  end
end

-- Создаем команду для форматирования
vim.api.nvim_create_user_command('FormatSQLStrings', format_sql_strings, {})

-- Необязательно: создайте сочетание клавиш
vim.api.nvim_set_keymap('n', '<leader>fs', ':FormatSQLStrings<CR>', { noremap = true, silent = true })
