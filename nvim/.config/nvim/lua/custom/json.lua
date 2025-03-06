local M = { }

function M.Format(mode)
  if mode == "n" then
    vim.cmd("%!python3 -m json.tool")
  elseif mode == "v" then
    vim.cmd("'<,'>!python3 -m json.tool")
  end

  vim.cmd("set syntax=json")
end

return M
