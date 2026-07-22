return {
  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      preset = "helix",
      debug = vim.uv.cwd():find("which%-key"),
      win = {},
      spec = {},
    },
  },

  -- Better copy/pasting.
  {
    "gbprod/yanky.nvim",
    opts = {
      ring = { history_length = 20 },
      highlight = { timer = 250 },
    },
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "=p", "<Plug>(YankyPutAfterLinewise)", desc = "Put yanked text in line below" },
      { "=P", "<Plug>(YankyPutBeforeLinewise)", desc = "Put yanked text in line above" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yanky yank" },
    },
  },
  -- Find and replace.
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      {
        "<leader>cg",
        function()
          local grug = require("grug-far")
          grug.open({ transient = true })
        end,
        desc = "GrugFar",
        mode = { "n", "v" },
      },
    },
    opts = {
      -- Disable folding.
      folding = { enabled = false },
      -- Don't numerate the result list.
      resultLocation = { showNumberLabel = false },
    },
  },

  -- Autoclosing braces.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local conds = require("nvim-autopairs.conds")

      npairs.setup()

      -- Autoclosing angle-brackets.
      npairs.add_rule(Rule("<", ">", {
        -- Avoid conflicts with nvim-ts-autotag.
        "-html",
        "-javascriptreact",
        "-typescriptreact",
      }):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
        return opts.char == ">"
      end))
    end,
  },

  -- Surround selections, add quotes, etc.
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    init = function()
      -- Disable the default keymaps.
      vim.g.nvim_surround_no_mappings = true
    end,
    config = function()
      require("nvim-surround").setup()

      vim.keymap.set("n", "yz", "<Plug>(nvim-surround-normal)", {
        desc = "Add a surrounding pair around a motion (normal mode)",
      })
      vim.keymap.set("n", "yzz", "<Plug>(nvim-surround-normal-cur)", {
        desc = "Add a surrounding pair around the current line (normal mode)",
      })
      vim.keymap.set("x", "Z", "<Plug>(nvim-surround-visual)", {
        desc = "Add a surrounding pair around a visual selection",
      })
      vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
        desc = "Delete a surrounding pair",
      })
      vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
        desc = "Change a surrounding pair",
      })
    end,
  },

  -- Autoclosing tags for HTML and JSX.
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  -- Split/join blocks of code.
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "folke/ts-comments.nvim",
    opts = {
      langs = {
        dts = "// %s",
      },
    },
  },

  {
    "pwntester/octo.nvim",
    opts = {
      picker = "snacks",
      use_local_fs = true,
    },
  },

  -- Markdown stuff
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter", "nvim-web-devicons" },
    ft = { "markdown" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { lsp = { enabled = true } },
    },
  },
  {
    "brianhuster/live-preview.nvim",
    dependencies = { "snacks.nvim" },
  },
}
