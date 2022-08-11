local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
-- ColorColumn = { bg = cp.base }, -- used for the columns set with 'colorcolumn'
Group.new('ColorColumn', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

--     -- BarBar customisation --
-- Group.new('BufferCurrent', colors.none, colors.base03, styles.reverse)
-- Group.new('BufferCurrentIndex', colors.none, colors.base03, styles.reverse)
-- Group.new('BufferCurrentMod', colors.none, colors.base03, styles.reverse)
-- Group.new('BufferCurrentSign', colors.none, colors.base03, styles.reverse)
-- Group.new('BufferTabpages', colors.none, colors.base03 )
-- Group.new('BufferTabpage', colors.none, colors.base03)
-- Group.new('BufferTabpageFill', colors.none, colors.base03 )

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

    -- BarBar integration --
local barColors = {
  bg       = '#002b36',
  bgbright = '#586e75',
  fg       = '#839496',
  fg2      =  '#eee8d5',
  yellow   = '#b58900',
  cyan     = '#2aa198',
  darkblue = '#268bd2',
  green    = '#719e07',
  orange   = '#cb4b16',
  violet   = '#6c71c4',
  magenta  = '#d33682',
  blue     = '#268bd2',
  red      = '#dc322f',
  deepdark = '#f38ba8',
  gitRed   = '#ff0000',
  none     = default,
}
Color.new('solarBg', '#002b36')
Color.new('solarBgBright', '#586e75')
Color.new('solarfg', '#839496')
Color.new('solarfg2', '#eee8d5')
Color.new('solaryellow', '#b58900')
Color.new('solarblue', '#268bd2')
Color.new('solarmagenta', '#d33682')
Color.new('solarred', '#dc322f')
-- Group.new('BufferCurrent', colors.none, colors.base03, styles.reverse)
----------------------------- fg ----------- bg ----------- style ------------
Group.new('BufferCurrent', colors.solarfg2, colors.none)
Group.new('BufferCurrentIndex', colors.solarfg2, colors.none)
Group.new('BufferCurrentMod', colors.solaryellow, colors.none)
Group.new('BufferCurrentSign', colors.cyan, colors.none)

Group.new('BufferVisible', colors.solarblue, colors.none)
Group.new('BufferVisibleIndex', colors.solarfg2, colors.none)
-- Group.new('BufferVisibleMod', colors.solarmagenta, colors.none)
Group.new('BufferVisibleMod', colors.solarred, colors.none)
Group.new('BufferVisibleSign', colors.cyan, colors.none)
-- BufferCurrent = { bg = cp.crust, fg = cp.text},
-- BufferCurrentIndex = { bg = cp.crust, fg = cp.blue },
-- BufferCurrentMod = { bg = cp.crust, fg = cp.yellow },
-- BufferCurrentSign = { bg = cp.crust, fg = cp.blue },
-- BufferVisible = { bg = cp.crust, fg = cp.blue},
-- BufferVisibleIndex = { bg = cp.crust, fg = cp.blue },
-- BufferVisibleMod = { bg = cp.crust, fg = cp.yellow },
-- BufferVisibleSign = { bg = cp.crust, fg = cp.blue },
-- BufferVisibleTarget = { bg = cp.crust, fg = cp.red },
-- BufferInactive = { bg = cp.crust, fg = cp.overlay0 },
-- BufferInactiveIndex = { bg = cp.crust, fg = cp.overlay0 },
-- BufferInactiveMod = { bg = cp.crust, fg = cp.yellow },
-- BufferInactiveSign = { bg = cp.crust, fg = cp.blue },
-- BufferInactiveTarget = { bg = cp.crust, fg = cp.red },
-- BufferTabpages = { bg = cp.crust, fg = cp.none },
-- BufferTabpage = { bg = cp.crust, fg = cp.blue },
-- BufferTabpageFill = { bg = cp.crust, fg = cp.blue },
