local gruvy = {
  -- bg = "#11111b",
  -- bg = "#050505",
  -- bg = "#080808",
  -- bg = "#171717",
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
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
		GitSignsAdd = { fg = gruvy.green, bg = gruvy.bg }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = gruvy.yellow, bg = gruvy.bg }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = gruvy.red, bg = gruvy.bg }, -- diff mode: Deleted line |diff.txt|
  --   -- BASE --
    CursorLine = { bg = gruvy.bg2}, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if forecrust (ctermfg OR guifg) is not secp.
		-- CursorLineNr = { fg = gruvy.yellow, bg = cp.base2},
		-- FloatBorder = { fg = gruvy.base2 },
		ColorColumn = { bg = gruvy.bg2 }, -- used for the columns set with 'colorcolumn'
		-- Pmenu = { bg = gruvy.base, fg = cp.overlay2}, -- Popup menu: normal item.
  --
  --   -- TELESCOPE --
		-- TelescopeBorder = { fg = gruvy.red, bg = gruvy.yellow},
		-- TelescopeSelection = { fg = gruvy.bg, bg = gruvy.maroon},
		-- TelescopeMatching = { fg = gruvy.overlay1 },
		-- TelescopeSelectionCaret = { fg = gruvy.bg, bg =  gruvy.maroon},
  --
  --   -- BARBAR --
		BufferCurrent = { bg = gruvy.bg, fg = gruvy.text},
		BufferCurrentIndex = { bg = gruvy.bg, fg = gruvy.blue },
		BufferCurrentMod = { bg = gruvy.bg, fg = gruvy.yellow },
		BufferCurrentSign = { bg = gruvy.bg, fg = gruvy.blue },
		BufferVisible = { bg = gruvy.bg, fg = gruvy.blue},
		BufferVisibleIndex = { bg = gruvy.bg, fg = gruvy.blue },
		BufferVisibleMod = { bg = gruvy.bg, fg = gruvy.yellow },
		BufferVisibleSign = { bg = gruvy.bg, fg = gruvy.blue },
		BufferVisibleTarget = { bg = gruvy.bg, fg = gruvy.red },
		BufferInactive = { bg = gruvy.bg, fg = gruvy.bg3 },
		BufferInactiveIndex = { bg = gruvy.bg, fg = gruvy.bg3 },
		BufferInactiveMod = { bg = gruvy.bg, fg = gruvy.yellow },
		BufferInactiveSign = { bg = gruvy.bg, fg = gruvy.blue },
		BufferInactiveTarget = { bg = gruvy.bg, fg = gruvy.red },
		BufferTabpages = { bg = gruvy.bg, fg = gruvy.none },
		BufferTabpage = { bg = gruvy.bg, fg = gruvy.blue },
		BufferTabpageFill = { bg = gruvy.bg, fg = gruvy.blue },

  },
})
vim.cmd [[colorscheme gruvbox]]
-- DONT DELETE THIS MOTHERFUCKER ----------------------------------------------
-- tranperancy ----------------------------------------------------------------
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi LineNr guibg=NONE ctermbg=NONE]]
vim.cmd [[hi SignColumn guibg=NONE ctermbg=NONE]]
vim.cmd [[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
