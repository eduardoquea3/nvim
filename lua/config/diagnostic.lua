local icon = require "eduardo.icons"
vim.diagnostic.config {
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icon.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icon.diagnostics.Warning,
      [vim.diagnostic.severity.INFO] = icon.diagnostics.Information,
      [vim.diagnostic.severity.HINT] = icon.diagnostics.Hint,
    },
  },
  severity_sort = true,
  float = { border = "rounded", source = true },
  underline = true,
  update_in_insert = false,
}
local signos = {
  Error = icon.diagnostics.Error,
  Warn = icon.diagnostics.Warning,
  Hint = icon.diagnostics.Hint,
  Info = icon.diagnostics.Information,
}

for type, img in pairs(signos) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = img, texthl = hl, numhl = "" })
end
