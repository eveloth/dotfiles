-- Highlight groups for '.use'
vim.api.nvim_set_hl(0, "@comparison", { link = "@number" })
vim.api.nvim_set_hl(0, "@package", { link = "@variable" })
vim.api.nvim_set_hl(0, "@metadata", { link = "@comment" })
vim.api.nvim_set_hl(0, "@set", { link = "@string" })
vim.api.nvim_set_hl(0, "@unset", { link = "DiagnosticSignError" })
