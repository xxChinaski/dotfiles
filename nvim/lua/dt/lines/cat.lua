-- my line ----------
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
-- gruv
-- local colors = {
--   -- bg       = '#20232800',
--   bg       = '#1d2021',
--   bgbright = '#665c54',
--   fg       = '#ebdbb2',
--   yellow   = '#458588',
--   cyan     = '#f5c2e7',
--   darkblue = '#458588',
--   green    = '#fadb2f',
--   orange   = '#FF8800',
--   violet   = '#b4befe',
--   magenta  = '#cba6f7',
--   blue     = '#928374',
--   red      = '#e5b4e2',
--   deepdark      = '#f38ba8',
--   gitRed      = '#ff0000',
-- }
-- cat
local colors = {
  bg       = '#181825',
  bgbright = '#2e2e3e',
  fg       = '#bcc0cc',
  yellow   = '#f5e0dc',
  cyan     = '#f5c2e7',
  darkblue = '#7287fd',
  green    = '#a6e3a1',
  orange   = '#FF8800',
  violet   = '#b4befe',
  magenta  = '#cba6f7',
  blue     = '#96cdfb',
  red      = '#e5b4e2',
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
local config = {
  options = {
    -- Disable sections and component separators
    globalstatus = true,
    component_separators = '',
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
    n = colors.blue,
    i = colors.green,
    v = colors.yellow,
    [''] = colors.yellow,
    V = colors.yellow,
    c = colors.magenta,
    no = colors.yellow,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.yellow,
    ce = colors.yellow,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.yellow,
    t = colors.yellow,
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

ins_left {
  function()
    return '▊'
  end,
  color = modeColor,
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ' '
  end,
  color = modeColor,
  padding = { right = 1 },
}

ins_left {
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = { fg = colors.bgbright},
  padding = 0,
}

ins_left {
  fmt = string.upper,
  'filetype',
  -- icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  icon_only = true,
  color = { fg = colors.fg, bg = colors.bgbright, gui = '' },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  -- color = modeColor,
  color = { fg = colors.fg , bg = colors.bgbright }, -- Sets highlighting of component
  path = 1,
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = { fg = colors.bgbright},
  padding = 0,
}

ins_left { 'location' }

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

-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' ',
--   color = { fg = colors.fg, gui = '' },
-- }

-- Add components to right sections

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

ins_right{ 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  function()
    return '▊'
  end,
  color = modeColor,
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

-- my line ----------

