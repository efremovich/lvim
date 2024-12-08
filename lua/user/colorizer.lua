local ok, colorizer = pcall(require, "colorizer")
if not ok then
  return
end

colorizer.setup {
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "css",
    "html",
    "astro",
    "lua",
    "conf",
  },
  user_default_options = {
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    hsl_fn   = true, -- CSS hsl() and hsla() functions
    css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true,
    rgb_fn   = true,
    tailwind = "both",
  },
  buftypes = {
    -- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
    -- Not sure if the window has a `buftype` at all
  },
}
