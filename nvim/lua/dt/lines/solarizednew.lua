-- my line ----------
local lualine = require('lualine')

-- solarized
local colors = {
  bg       = '#002b36',
  bgbright = '#586e75',
  -- fg       = '#93a1a1',
  fg       = '#839496',
  fg2       =  '#eee8d5',
  yellow   = '#b58900',
  cyan     = '#2aa198',
  darkblue = '#268bd2',
  green    = '#719e07',
  orange   = '#cb4b16',
  violet   = '#6c71c4',
  magenta  = '#cba6f7',
  blue     = '#2075c7',
  red      = '#dc322f',
  deepdark      = '#f38ba8',
  gitRed      = '#ff0000',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
lualine.setup {
  options = {
    -- Disable sections and component separators
    globalstatus = true,
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      -- normal = { c = { fg = colors.fg, bg = colors.bg } },
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    --[[ lualine_a = { ]]
    --[[   'filename', ]]
    --[[   cond = conditions.buffer_not_empty, ]]
    --[[   color = { fg = colors.fg2 , bg = colors.bgbright }, -- Sets highlighting of component ]]
    --[[   path = 1, ]]
    --[[ }, ]]
    lualine_a = {{'filename', file_status = true, path = 1}},
    lualine_b = {
      {
        'branch',
        icon = '',
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic'},
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      },
    },
    lualine_y = {
      'diff',
      'filetype',
    },
    lualine_z = {
      'progress',
      {
        'o:encoding', -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
      },
    },
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

