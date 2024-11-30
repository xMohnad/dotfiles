local telescope = require('telescope')

telescope.setup{
  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.6,
        prompt_position = "top",
      },
      vertical = {
        preview_height = 0.5,
      },
      preview_cutoff = 120,
    },
    layout_strategy = "vertical", -- "horizontal",
  }
}

