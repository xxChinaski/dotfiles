local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"

require("telescope").setup({
  defaults = {
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    results_title = false,
		-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.65,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 60,
    },
    -- preview = false,
    prompt_position = 'bottom',
    prompt_prefix = " Search:  ",
    selection_caret = " > ",
    path_display = { "truncate" },
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "__pycache__/*",
    },

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

