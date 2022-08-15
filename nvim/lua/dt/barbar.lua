-- BARBAR ----------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--[[]]
--[[]]
--[[]]
--[[ -- Move to previous/next ]]
--[[ map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts) ]]
--[[ map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts) ]]
--[[ -- -- Re-order to previous/next ]]
--[[ -- map('n', '<S-C-h', '<Cmd>BufferMovePrevious<CR>', opts) ]]
--[[ -- map('n', '<S-C-l', '<Cmd>BufferMoveNext<CR>', opts) ]]
--[[ -- Goto buffer in position... ]]
--[[ map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts) ]]
--[[ map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts) ]]
--[[ map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts) ]]
--[[ map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts) ]]
--[[ map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts) ]]
--[[ map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts) ]]
--[[ map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts) ]]
--[[ map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts) ]]
--[[ map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts) ]]
--[[ map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts) ]]
--[[ -- Pin/unpin buffer ]]
--[[ -- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts) ]]
--[[ -- Close buffer ]]
--[[ map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts) ]]
--[[ -- Wipeout buffer ]]
--[[ --                 :BufferWipeout ]]
--[[ -- Close commands ]]
--[[ --                 :BufferCloseAllButCurrent ]]
--[[ --                 :BufferCloseAllButPinned ]]
--[[ --                 :BufferCloseAllButCurrentOrPinned ]]
--[[ --                 :BufferCloseBuffersLeft ]]
--[[ --                 :BufferCloseBuffersRight ]]
--[[ -- Magic buffer-picking mode ]]
--[[ -- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts) ]]
--[[ -- Sort automatically by... ]]
--[[ -- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts) ]]
--[[ -- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts) ]]
--[[ -- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts) ]]
--[[ -- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts) ]]
--[[ require'bufferline'.setup { ]]
--[[   -- auto_hide = true, ]]
--[[   icon_separator_active = '', ]]
--[[   icon_separator_inactive = '', ]]
--[[   icon_close_tab = '', ]]
--[[   icon_close_tab_modified = '<', ]]
--[[]]
--[[   icon_pinned = '', ]]
--[[ } ]]



-- TABLINE ----------
require'tabline'.setup {
  -- Defaults configuration options
  enable = true,
  options = {
  -- If lualine is installed tabline will use separators configured in lualine by default.
  -- These options can be used to override those settings.
    section_separators = {'', ''},
    component_separators = {'', ''},
    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = true, -- shows base filename only instead of relative path in filename
    modified_icon = "* ", -- change the default modified icon
    modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
    show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  }
}
vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

map('n', '<A-1>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(1)<CR>', opts)
map('n', '<A-2>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(2)<CR>', opts)
map('n', '<A-3>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(3)<CR>', opts)
map('n', '<A-4>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(4)<CR>', opts)
map('n', '<A-5>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(5)<CR>', opts)
map('n', '<A-6>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(6)<CR>', opts)
map('n', '<A-7>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(7)<CR>', opts)
map('n', '<A-8>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(8)<CR>', opts)
map('n', '<A-9>', '<Cmd>lua require("nvim-smartbufs").goto_buffer(9)<CR>', opts)
map('n', '<A-h>', '<Cmd>lua require("nvim-smartbufs").goto_prev_buffer()<CR>', opts)
map('n', '<A-l>', '<Cmd>lua require("nvim-smartbufs").goto_next_buffer()<CR>', opts)
map('n', '<A-c>', '<Cmd>lua require("nvim-smartbufs").close_current_buffer()<CR>', opts)



-- BUFFERLINE ----
--[[ local signs = require("config.lsp.diagnostics").signs ]]
--[[]]
--[[ signs = { ]]
--[[   error = signs.Error, ]]
--[[   warning = signs.Warn, ]]
--[[   info = signs.Info, ]]
--[[   hint = signs.Hint, ]]
--[[ } ]]
--[[]]
--[[ local severities = { ]]
--[[   "error", ]]
--[[   "warning", ]]
--[[   -- "info", ]]
--[[   -- "hint", ]]
--[[ } ]]

--[[ require("bufferline").setup({ ]]
--[[   options = { ]]
--[[     show_buffer_close_icons = false, ]]
--[[     show_close_icon = false, ]]
--[[     indicator_icon = '', ]]
--[[     color_icons = false, -- whether or not to add the filetype icon highlights ]]
--[[     show_tab_indicators = false, ]]
--[[     diagnostics = "nvim_lsp", ]]
--[[     always_show_bufferline = true, ]]
--[[     separator_style = {'',''}, ]]
--[[     offsets = { ]]
--[[       { ]]
--[[         filetype = "NvimTree", ]]
--[[         text = "NvimTree", ]]
--[[         highlight = "Directory", ]]
--[[         text_align = "left", ]]
--[[       }, ]]
--[[     }, ]]
--[[   }, ]]
--[[   highlights = { ]]
--[[     separator = { ]]
--[[       fg = '#2075c7', ]]
--[[       bg = '#002b36', ]]
--[[     }, ]]
--[[     separator_visible = { ]]
--[[       fg = '#586e75', ]]
--[[       bg = '#002b36', ]]
--[[     }, ]]
--[[     modified = { ]]
--[[       fg = "#b58900", ]]
--[[       bg = '#002b36', ]]
--[[     }, ]]
--[[     modified_visible = { ]]
--[[       fg = "#b58900", ]]
--[[       bg = '#586e75', ]]
--[[     }, ]]
--[[     modified_selected = { ]]
--[[       fg = "#b58900", ]]
--[[       bg = '#2075c7', ]]
--[[     }, ]]
--[[     buffer_visible = { ]]
--[[         fg = "#eee8d5", ]]
--[[         bg = '#586e75', ]]
--[[     }, ]]
--[[     buffer_selected = { ]]
--[[       fg = '#eee8d5', ]]
--[[       bg = '#2075c7', ]]
--[[       italic = false, ]]
--[[       bold = false, ]]
--[[     }, ]]
--[[     background = { ]]
--[[       fg = '#839496', ]]
--[[       bg = '#002b36', ]]
--[[     }, ]]
--[[     fill = { ]]
--[[       fg = '#ff0000', ]]
--[[       bg = '#002b36', ]]
--[[     }, ]]
--[[   }, ]]
--[[ }) ]]
--[[ map('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', opts) ]]
--[[ map('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', opts) ]]
--[[]]
--[[ map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts) ]]
--[[ map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts) ]]
--[[ map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts) ]]
--[[ map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts) ]]
--[[ map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts) ]]
--[[ map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts) ]]
--[[ map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts) ]]
--[[ map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts) ]]
--[[ map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts) ]]
