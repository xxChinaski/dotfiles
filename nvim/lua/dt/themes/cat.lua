-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- original (almost) catppuccin ----------------------------------------------
local cp = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	peach = "#FAB387",
	yellow = "#F9E2AF",
	green = "#A6E3A1",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",

	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
  overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",

	base = "#1E1E2E",
	base2 = "#2E2E3E",
	mantle = "#181825",
	crust = "#11111B",
  trans = "#00000000",
}

require("catppuccin").setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		coc_nvim = false,
		lsp_trouble = false,
		cmp = true,
		lsp_saga = true,
		gitgutter = false,
		gitsigns = true,
		leap = false,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
		dap = {
			enabled = false,
			enable_ui = false,
		},
		which_key = false,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = true,
		bufferline = false,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = true,
		notify = false,
		telekasten = false,
		symbols_outline = true,
		mini = false,
		aerial = false,
		vimwiki = false,
		beacon = true,
	},
	color_overrides = {},
	custom_highlights = {
    -- BASE --
    CursorLine = { bg = cp.base}, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if forecrust (ctermfg OR guifg) is not secp.
		CursorLineNr = { fg = cp.yellow, bg = cp.base2},
		FloatBorder = { fg = cp.base2 },
		ColorColumn = { bg = cp.base }, -- used for the columns set with 'colorcolumn'
		Pmenu = { bg = cp.base, fg = cp.overlay2}, -- Popup menu: normal item.

    -- TELESCOPE --
		TelescopeBorder = { fg = cp.base2},
		TelescopeSelection = { fg = cp.crust, bg = cp.maroon},
		TelescopeMatching = { fg = cp.overlay1 },
		TelescopeSelectionCaret = { fg = cp.crust, bg =  cp.maroon},

    -- BARBAR --
		BufferCurrent = { bg = cp.crust, fg = cp.text},
		BufferCurrentIndex = { bg = cp.crust, fg = cp.blue },
		BufferCurrentMod = { bg = cp.crust, fg = cp.yellow },
		BufferCurrentSign = { bg = cp.crust, fg = cp.blue },
		BufferVisible = { bg = cp.crust, fg = cp.blue},
		BufferVisibleIndex = { bg = cp.crust, fg = cp.blue },
		BufferVisibleMod = { bg = cp.crust, fg = cp.yellow },
		BufferVisibleSign = { bg = cp.crust, fg = cp.blue },
		BufferVisibleTarget = { bg = cp.crust, fg = cp.red },
		BufferInactive = { bg = cp.crust, fg = cp.overlay0 },
		BufferInactiveIndex = { bg = cp.crust, fg = cp.overlay0 },
		BufferInactiveMod = { bg = cp.crust, fg = cp.yellow },
		BufferInactiveSign = { bg = cp.crust, fg = cp.blue },
		BufferInactiveTarget = { bg = cp.crust, fg = cp.red },
		BufferTabpages = { bg = cp.crust, fg = cp.none },
		BufferTabpage = { bg = cp.crust, fg = cp.blue },
		BufferTabpageFill = { bg = cp.crust, fg = cp.blue },
  },
})
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
