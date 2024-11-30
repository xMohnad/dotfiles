require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-f>", ":Telescope live_grep<CR>", { desc = "Search in files" })

map("i", "jk", "<ESC>")

-- LineShift
map({ "n", "v" }, "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up (insert mode)" })
map({ "n", "v" }, "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down (insert mode)" })

map({ "n", "v" }, "<C-A-Up>", ":t .-1<CR>", { desc = "Copy line up" })
map("i", "<C-A-Up>", "<Esc>:t .-1<CR>gi", { desc = "Copy line up (insert mode)" })
map({ "n", "v" }, "<C-A-Down>", ":t .+1<CR>", { desc = "Copy line down" })
map("i", "<C-A-Down>", "<Esc>:t .+1<CR>gi", { desc = "Copy line down (insert mode)" })


-- telescope
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP References" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP References", buffer = 0 })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Blankline Jump to current context" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

