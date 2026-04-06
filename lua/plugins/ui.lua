return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- do not set background color
    },
    config = function()
      -- Set my colorscheme.
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        truncate_names = false,
        indicator = { style = "slant" },
        close_command = function(bufnr)
          Snacks.bufdelete(bufnr)
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = require("icons").diagnostics
          local indicator = (diag.error and icons.ERROR .. " " or "") .. (diag.warning and icons.WARN or "")
          return vim.trim(indicator)
        end,
      },
    },
    keys = {
      -- Buffer navigation.
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer to open" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()
              return reg ~= "" and "@" .. reg or ""
            end,
            color = { fg = "#0db9d7", gui = "bold" },
            refresh = { events = { "RecordingEnter", "RecordingLeave" } },
          },
          "filetype",
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
      },
      lsp = {
        hover = {
          enabled = false,
          silent = true,
        },
      },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  -- Highlight URLs.
  {
    "itchyny/vim-highlighturl",
    event = "VeryLazy",
    config = function()
      -- Disable the plugin in some places where the default highlighting
      -- is preferred.
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Disable URL highlights",
        pattern = { "fzf", "lazyterm" },
        command = "call highlighturl#disable_local()",
      })
    end,
  },
}
