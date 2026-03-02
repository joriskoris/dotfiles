require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function()
  require("conform").format { timeout_ms = 3000, lsp_format = "always" }
end, { desc = "Format file" })
map("n", "<leader>ds", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })
