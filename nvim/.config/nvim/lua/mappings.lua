require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

local function create_mappings(modes, lhs, rhs_table, desc)
	for _, mode in ipairs(modes) do
		local rhs = rhs_table[mode]
		if rhs then
			map(mode, lhs, rhs, { desc = desc })
		end
	end
end

-- Replace word under cursor without confirmation
map("n", "<leader>sw", function()
	local word = vim.fn.expand("<cword>")
	local replacement = vim.fn.input("Replace '" .. word .. "' with: ")
	if replacement ~= "" then
		vim.cmd(string.format("%%s/\\<%s\\>/%s/g", vim.fn.escape(word, "/\\"), vim.fn.escape(replacement, "/\\")))
	end
end, { desc = "Substitute word under cursor" })

-- Replace word under cursor with confirmation
map("n", "<leader>sc", function()
	local word = vim.fn.expand("<cword>")
	local replacement = vim.fn.input("Replace '" .. word .. "' with: ")
	if replacement ~= "" then
		vim.cmd(string.format("%%s/\\<%s\\>/%s/gc", vim.fn.escape(word, "/\\"), vim.fn.escape(replacement, "/\\")))
	end
end, { desc = "Substitute word under cursor (confirm)" })

-- Replace visual selection without confirmation
map("v", "<leader>sv", function()
	vim.cmd('normal! "vy') -- Yank selected text into the " register
	local selection = vim.fn.getreg('"')
	local replacement = vim.fn.input("Replace '" .. selection .. "' with: ")
	if replacement ~= "" then
		vim.cmd(string.format("%%s/%s/%s/g", vim.fn.escape(selection, "/\\"), vim.fn.escape(replacement, "/\\")))
	end
end, { desc = "Substitute visual selection" })

-- Replace visual selection with confirmation
map("v", "<leader>sx", function()
	vim.cmd('normal! "vy') -- Yank selected text into the " register
	local selection = vim.fn.getreg('"')
	local replacement = vim.fn.input("Replace '" .. selection .. "' with: ")
	if replacement ~= "" then
		vim.cmd(string.format("%%s/%s/%s/gc", vim.fn.escape(selection, "/\\"), vim.fn.escape(replacement, "/\\")))
	end
end, { desc = "Substitute visual selection (confirm)" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP References" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP References", buffer = 0 })

map("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<C-g>", ":Telescope live_grep<CR>", { desc = "Search in files" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move line up
create_mappings({ "n", "i", "v" }, "<A-Up>", {
	n = ":m .-2<CR>==",
	i = "<Esc>:m .-2<CR>==gi",
	v = ":m '<-2<CR>gv=gv",
}, "Move line up")

-- Move line down
create_mappings({ "n", "i", "v" }, "<A-Down>", {
	n = ":m .+1<CR>==",
	i = "<Esc>:m .+1<CR>==gi",
	v = ":m '>+1<CR>gv=gv",
}, "Move line down")

-- Copy line up (gck)
create_mappings({ "n", "i", "v" }, "gck", {
	n = ":t .-1<CR>",
	i = "<Esc>:t .-1<CR>gi",
	v = ":t '<-1<CR>gv=gv",
}, "Copy line up")

-- Copy line down (gcj)
create_mappings({ "n", "i", "v" }, "gcj", {
	n = ":t .+1<CR>",
	i = "<Esc>:t .+1<CR>gi",
	v = ":t '>+1<CR>gv=gv",
}, "Copy line down")

-- Optional: Copy line up with Alt + Ctrl + Up
create_mappings({ "n", "i", "v" }, "<C-A-Up>", {
	n = ":t .-1<CR>",
	i = "<Esc>:t .-1<CR>gi",
	v = ":t '<-1<CR>gv=gv",
}, "Copy line up")

-- Optional: Copy line down with Alt + Ctrl + Down
create_mappings({ "n", "i", "v" }, "<C-A-Down>", {
	n = ":t .+1<CR>",
	i = "<Esc>:t .+1<CR>gi",
	v = ":t '>+1<CR>gv=gv",
}, "Copy line down")
