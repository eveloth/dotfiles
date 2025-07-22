local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

local function set_keymap()
  local wk = require("which-key")
  local telescope = require("telescope.builtin")
  local lsp = vim.lsp.buf

  wk.add({
    { "<leader>l",  group = "LSP" },
    { "g",          group = "Go to..." },
    { "<leader>ls", group = "Search..." },
    { "gd",         lsp.definition,           desc = "Go to definition" },
    { "gi",         lsp.implementation,       desc = "Go to implementation" },
    { "gr",         telescope.lsp_references, desc = "Go to references" },
    {
      "K",
      function()
        lsp.hover({ border = "rounded" })
      end,
      desc = "Hover",
    },
    { mode = { "n", "v" }, { "<leader>la", lsp.code_action, desc = "Code Action" } },
    { "<leader>lh",        require("eveloth.lspconfig").toggle_inlay_hints,        desc = "Hints" },
    {
      "<leader>li",
      function()
        vim.cmd("LspInfo")
      end,
      desc = "Info",
    },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",  desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",  desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",      desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", lsp.rename,                                 desc = "Rename" },
    { "<leader>ld", telescope.diagnostics,                      desc = "Diagnosics" },
    {
      "<leader>lsf",
      "<cmd>Telescope lsp_document_symbols symbols=function,method<cr>",
      desc = "Functions",
    },
    {
      "<leader>lss",
      "<cmd>Telescope lsp_document_symbols symbols=struct,class<cr>",
      desc = "Structs & classes",
    },
    { "<leader>lsv", "<cmd>Telescope lsp_document_symbols symbols=variable<cr>", desc = "Variables" },
    { "<leader>rc",  require("conform").format,                                  desc = "csharpier" },
    {
      "<leader>rf",
      function ()
      lsp.format({
        async = true,
        filter = function(client)
          return client.name ~= "typescript-tools"
        end,
      })
      end,
      desc = "Format",
    },
  })
end

M.on_attach = function(client, _)
  set_keymap()

  if client:supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true)
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }))
end

function M.config()
  -- this overrides hover and it seems to be the only way to get it work consistently

  local hover = vim.lsp.buf.hover
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.buf.hover = function()
    hover({
      border = "rounded",
    })
  end

  local icons = require("eveloth.icons")

  local servers = {
    "basedpyright",
    "lua_ls",
    "cssls",
    "html",
    "ts_ls",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "clangd",
    "gopls",
    "sqls",
    "terraformls",
    "jdtls",
    "rust_analyzer",
    "roslyn",
    "zls",
  }

  local default_diagnostic_config = {
    virtual_text = false,
    virtual_lines = false,
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
      },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" })

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    opts.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

    local require_ok, settings = pcall(require, "eveloth.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup()
    end

    vim.lsp.enable(server)
    vim.lsp.config[server] = opts

    require("ionide").setup({
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    })
  end
end

return M
