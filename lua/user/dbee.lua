local status_ok, db = pcall(require, "dbee")
if not status_ok then
  return
end

db.setup {
  ui = {
    syntax_highlight = true, -- включить поддержку подсветки синтаксиса
  },
}
