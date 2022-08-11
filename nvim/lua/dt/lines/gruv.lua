-- my line ----------
local lualine = require('lualine')

-- gruv
local colors = {
  bgDeep       = '#1d2021',
  -- bgBright = '#665c54',
  -- bg       = '#3c3836',
  bg       = '#282828',
  -- bgBright = '#7c6f64',
  -- bgBright = '#928374',
  bgBright = '#a89984',
  fg       = '#ebdbb2',
  fg2       = '#a89984',
  red       = '#cc241d',
  redBright       = '#fb4934',
  yellow   = '#d79921',
  yellowBright   = '#fabd2f',
  blue     = '#458588',
  blueBright = '#83a598',
  green    = '#98971a',
  greenBright    = '#b8bb26',
  orange   = '#d65d0e',
  orangeBright   = '#fe8019',
  purple   = '#b16286',
  purpleBright   = '#d3869b',
  aqua   = '#689d6a',
  aquaBright   = '#8ec07c',
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
local config = {
  options = {
    -- Disable sections and component separators
    globalstatus = true,
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
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

-- NOTE: MY COLOR function
local modeColor = function()
  -- auto change color according to neovims mode
  local mode_color = {
    n = colors.fg,
    i = colors.orangeBright,
    v = colors.blueBright,
    [''] = colors.blueBright,
    V = colors.blueBright,
    c = colors.magenta,
    no = colors.blueBright,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.blueBright,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.blueBright,
    ce = colors.blueBright,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.blueBright,
    t = colors.blueBright,
  }
  return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
end


-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end


-- ins_left {
--   -- mode component
--   function()
--     return ' '
--   end,
--   color = modeColor,
--   padding = { right = 1 },
-- }

ins_left {
  'filesize',
  color = { fg = colors.fg2, bg = colors.bg, gui = '' },
  cond = conditions.buffer_not_empty,
}

ins_left {
  fmt = string.upper,
  'filetype',
  -- icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  icon_only = true,
  color = { fg = colors.bg, bg = colors.bg, gui = '' },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = modeColor,
  -- color = { fg = colors.fg , bg = colors.bg, gui = 'bold' }, -- Sets highlighting of component
  -- color = { fg = modeColor , bg = colors.bg, gui = 'bold' }, -- Sets highlighting of component
  path = 1,
}

ins_left { 
  'location',
  color = { fg = colors.fg2, bg = colors.bg, gui = '' },
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}


-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
	symbols = { added = "  ", modified = "  ", removed = "  " }, -- changes diff symbols
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right{ 'progress', color = { fg = colors.fg2, gui = 'bold' } }

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg2, gui = 'bold' },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

