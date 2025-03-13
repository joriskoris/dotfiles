require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- trouble
map("n", "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostic (Trouble)" })
map("n", "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics (Trouble)" })
map("n", "<leader>dQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list (Trouble)" })
-- precognition
map("n", "<leader>pc", function()
  if require("precognition").toggle() then
    vim.notify "precognition on"
  else
    vim.notify "precognition off"
  end
end, { desc = "Precognition toggle " })

-- folds
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
map("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with" })
