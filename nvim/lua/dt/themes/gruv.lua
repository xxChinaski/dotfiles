local gruvy = {
  -- bg = "#11111b",
  -- bg = "#050505",
  -- bg = "#080808",
  -- bg = "#171717",
  bgHard = "#1d2021",
  bg = "#070707",
  bg2 = "#282828",
  bg3 = "#665c54",
  red = "#cc241d",
  green = "#98971a",
  yellow = "#d79921",
}
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
		GitSignsAdd = { fg = gruvy.green, bg = "#1d2021" },
		GitSignsChange = { fg = gruvy.yellow, bg = "#1d2021" }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = gruvy.red, bg = "#1d2021" }, -- diff mode: Deleted line |diff.txt|
  --   -- BASE --
    CursorLine = { bg = gruvy.bg2}, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if forecrust (ctermfg OR guifg) is not secp.
		-- CursorLineNr = { fg = gruvy.yellow, bg = cp.base2},
		-- FloatBorder = { fg = gruvy.base2 },
    SignColumn = {bg = gruvy.bgHard},
		ColorColumn = { bg = gruvy.bg2 }, -- used for the columns set with 'colorcolumn'
		-- Pmenu = { bg = gruvy.base, fg = cp.overlay2}, -- Popup menu: normal item.
  --
  --   -- TELESCOPE --
		-- TelescopeBorder = { fg = gruvy.red, bg = gruvy.yellow},
		-- TelescopeSelection = { fg = gruvy.bg, bg = gruvy.blue},
		-- TelescopeMatching = { fg = gruvy.yellow },
		-- TelescopeSelectionCaret = { fg = gruvy.bg, bg =  gruvy.blue},
  --
  --   -- BARBAR --
		BufferCurrent = { bg = gruvy.bgHard, fg = gruvy.text},
		BufferCurrentIndex = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferCurrentMod = { bg = gruvy.bgHard, fg = gruvy.yellow },
		BufferCurrentSign = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferVisible = { bg = gruvy.bgHard, fg = gruvy.blue},
		BufferVisibleIndex = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferVisibleMod = { bg = gruvy.bgHard, fg = gruvy.yellow },
		BufferVisibleSign = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferVisibleTarget = { bg = gruvy.bgHard, fg = gruvy.red },
		BufferInactive = { bg = gruvy.bgHard, fg = gruvy.bg3 },
		BufferInactiveIndex = { bg = gruvy.bgHard, fg = gruvy.bg3 },
		BufferInactiveMod = { bg = gruvy.bgHard, fg = gruvy.yellow },
		BufferInactiveSign = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferInactiveTarget = { bg = gruvy.bgHard, fg = gruvy.red },
		BufferTabpages = { bg = gruvy.bgHard, fg = gruvy.none },
		BufferTabpage = { bg = gruvy.bgHard, fg = gruvy.blue },
		BufferTabpageFill = { bg = gruvy.bgHard, fg = gruvy.blue },

  },
})
vim.cmd [[colorscheme gruvbox]]
-- DONT DELETE THIS MOTHERFUCKER ----------------------------------------------
-- tranperancy ----------------------------------------------------------------
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi LineNr guibg=NONE ctermbg=NONE]]
vim.cmd [[hi SignColumn guibg=NONE ctermbg=NONE]]
vim.cmd [[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
