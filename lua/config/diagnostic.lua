vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  update_in_insert = true,
  underline = true,
})
local signs = { Error = "", Warn = "", Hint = "", Info = "󰋽" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
