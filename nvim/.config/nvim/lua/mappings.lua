local map = vim.keymap.set
map("n", "<leader>q", ":qa!<CR>", {})
-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>", {})

map("v", "kj", "<ESC>", {})
map("i", "kj", "<ESC>", {})

map({"n", "v"}, "<C-c>", [["+y]], { desc = "Copy Selection", silent = true })
map({"n", "v"}, "<leader><CR>", ":noh<CR>", { desc = "Remove highlight", silent = true })
map("v", "<C-a>", [[ggvG]], { desc = "Select whole file", silent = true })

map("n", "<C-z>", "u", { noremap = true, silent = true })
map("n", "<C-S-z>", "<C-r>", { noremap = true, silent = true })
map("i", "<C-z>", "u", { noremap = true, silent = true })
map("i", "<C-S-z>", "<C-r>", { noremap = true, silent = true })

map("n", "<C-j>", ":join<CR>", { desc= "Join lines" })
map("t", "<Esc>", [[<C-\><C-n>]])

-- Move around vim-style
map("n", "<A-j>", ":wincmd h<CR>", { desc = "switch window left" })
map("n", "<A-k>", ":wincmd l<CR>", { desc = "switch window right" })
map("n", "<A-h>", ":wincmd j<CR>", { desc = "switch window up" })
map("n", "<A-l>", ":wincmd k<CR>", { desc = "switch window down" })

map("n", "<leader>wc", ":close<CR>", { desc = "close current window" })
map("n", "<leader>wn", ":vnew<CR>", { desc = "open new window in vsplit" })

-- Buffers
map("n", "<S-k>", ":bnext<CR>", { })
map("n", "<S-j>", ":bprevious<CR>", { })
map("n", "<leader>ba", function() require("custom/buffers").BufOnly() end, { desc = "Delete all buffers except for active one" })

-- Reload configuration without restart nvim
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<cr>", { desc = "Reload configuration without restart nvim" })
map("n", "<leader>ec", ":vsplit ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true, desc = "Edit Neovim config" })
map("n", "<leader>em", ":vsplit ~/.config/nvim/lua/mappings.lua<CR>", { noremap = true, silent = true, desc = "Edit Neovim mappings" })

-- Telescope
--local builtin = require("telescope.builtin")
--map("n", "<leader>ff", builtin.find_files, { desc = "Open Telescope to find files" })
--map("n", "<leader>fg", builtin.live_grep, { desc = "Open Telescope to do live grep" })
--map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })
--map("n", "<leader>fh", builtin.help_tags, { desc = "Open Telescope to show help" })
--map("n", "<leader>fo", builtin.oldfiles, { desc = "Open Telescope to list recent files" })
--map("n", "<leader>cm", builtin.git_commits, { desc = "Open Telescope to list git commits" })

-- NvimTree
map("n", "<leader>nc", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree sidebar" })    -- open/close
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })         -- refresh
map("n", "<leader>nt", ":NvimTreeFindFile<CR>", { desc = "Search file in NvimTree" }) -- search file

-- LSP
map("n", "<leader>gm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- Comment
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })
map("v", "mm", "gc", { desc = "Toggle comment", remap = true })
