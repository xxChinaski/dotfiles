local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    -- mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      -- guifg = '#073642',
      -- guibg = '#073642',
      -- guibg = '#002b36',
    },
    separator_selected = {
      -- guifg = '#073642',
      -- guibg = '#002b36',
    },
    separator_visible = {
      -- guifg = '#073642',
      -- guibg = '#002b36',
      -- guibg = '#073642',
    },
    background = {
      -- guifg = '#657b83',
      -- guifg = '#002b36',
      -- guibg = '#002b36'
      -- guibg = '#073642',
    },
    buffer_selected = {
      -- guifg = '#fdf6e3',
      -- guifg = '#2075c7',
      -- gui = "bold",
    },
    buffer_visible = {
      -- guifg = '#2075c7',
      -- guifg = '#657b83',
      -- guibg = '#002b36',
      -- guibg = '#073642',
      -- gui = "bold",
    },
    fill = {
      -- guibg = '#073642'
    }
  },
})

vim.keymap.set('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', {})

vim.keymap.set('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
vim.keymap.set('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
vim.keymap.set('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', {})
vim.keymap.set('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', {})
vim.keymap.set('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', {})
vim.keymap.set('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', {})

vim.keymap.set('n', '<A-c>', '<Cmd>bd<CR>', {})
