local api = require "nvim-tree.api"
local actions = require "nvim-tree.actions"

-- Custom mappings here
local function custom_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = custom_on_attach,
}

-- this is a custom function for opening files anywhere, not only in
_G.nvim_tree_find_file = function()
  local function starts_with(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
  end

  local cwd = vim.fn.getcwd()
  local cur_path = vim.fn.expand('%:p:h')

  api.tree.open()

  if starts_with(cur_path, cwd) then
    api.tree.find_file({ open = true, focus = true })
  else
    api.tree.reload()
    api.tree.change_root(cur_path)
    api.tree.find_file({ open = true, focus = true })
    vim.cmd('cd ' .. cwd)
  end
end

