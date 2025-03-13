require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Set filetype for Tiltfile
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Tiltfile",
  callback = function()
    vim.bo.filetype = "tiltfile"
  end,
})
