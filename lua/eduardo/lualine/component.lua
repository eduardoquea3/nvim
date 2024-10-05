---@diagnostic disable: lowercase-global
local icon = require "eduardo.icons"
-- local color = require("eduardo.lualine.colors").colors
-- local mode_color = require("eduardo.lualine.mode_color").mode_color
-- local back = color.bg_tokyo
-- local back = color.bg_one
-- local back = color.bg_ayu

function hide()
  return vim.o.columns > 80
end

-- function tinte()
-- return { fg = mode_color[vim.fn.mode()], bg = back }
-- end

return {
  lsp = {
    function()
      local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local formatters = require "eduardo.lualine.null_ls"
      local supported_formatters = formatters.list_formater(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      local linters = require "eduardo.lualine.null_ls"
      local supported_linters = linters.list_linter(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)

      local language_servers = "" .. table.concat(unique_client_names, ", ") .. ""

      return language_servers
    end,
    color = { gui = "bold" },
    cond = hide,
  },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return icon.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
  },
  macro = {
    function()
      local use = vim.fn.reg_recording()
      if use ~= "" then
        return icon.ui.Telescope .. " " .. use
      end
      return ""
    end,
    -- cond = vim.fn.reg_recording() ~= "",
  },
}
