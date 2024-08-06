vim.diagnostic.config {
  virtual_text = false,
  -- underline = true,
  -- update_in_insert = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  severity_sort = true,
}
local icon = require "eduardo.icons"
local signos = {
  Error = icon.diagnostics.Error,
  Warn = icon.diagnostics.Warning,
  Hint = icon.diagnostics.Hint,
  Info = icon.diagnostics.Information,
}

-- local signs = {
-- Error = "E",
-- Warn = "W",
-- Hint = "H",
-- Info = "I",
-- }
for type, img in pairs(signos) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = img, texthl = hl, numhl = "" })
end

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require "vim.lsp.log"
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command "copen"
        api.nvim_command "wincmd p"
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition "split"

-- local config = {
--   virtual_text = true,
--   signs = {
--     active = signos, -- Here I am calling the signs
--   },
--   update_in_insert = true,
--   underline = true,
--   severity_sort = true,
--   float = {
--     focusable = true,
--     style = "minimal",
--     border = "rounded",
--     source = "always",
--     header = "",
--     prefix = "",
--   },
-- }
--
-- vim.diagnostic.config(config)
