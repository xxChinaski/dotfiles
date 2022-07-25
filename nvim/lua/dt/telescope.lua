local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"

require("telescope").setup({
  defaults = {

    layout_strategy = 'flex',
    layout_config = {
      flex = {
        anchor = 'CENTER',
        width = 0.7,
        height = {padding = 5},
        prompt_position = 'bottom',
        flip_columns = 120,
        flip_lines = 30,
        vertical = {
          preview_height = 0.6,
          mirror = true,
          preview_cutoff = 5,
          prompt_position = "bottom",
        },
        horizontal = {
          preview_width = 0.6,
          prompt_position = 'bottom',
          preview_cutoff = 30,
        },
      },
    },
    borderchars = {
      prompt = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
      results = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },

    -- preview = false,
    prompt_position = 'bottom',
    prompt_prefix = " Search:  ",
    selection_caret = " > ",
    path_display = { "truncate" },
    file_ignore_patterns = { "node_modules" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
    },
  },
  pickers = {
  },
  extensions = {
    media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
  },
})

