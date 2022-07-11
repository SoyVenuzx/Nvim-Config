vim.o.background = "dark" -- to load onedark
local onedarkpro = require("onedarkpro")

onedarkpro.setup({
  -- dark_theme = "onedark_dark",
  options = {
    italic = true,
    transparency = true,
    terminal_colors = true
  }
})
require("onedarkpro").load()
