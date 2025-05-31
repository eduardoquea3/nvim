---@diagnostic disable: lowercase-global
local icon = require "eduardo.icons"
-- local color = require("eduardo.lualine.colors").colors
local mode_color = require "eduardo.lualine.mode_color"

function hide()
  return vim.o.columns > 80
end

function tinte()
  return { bg = mode_color[vim.fn.mode()], fg = "#000000" }
end

return {
  mode = {
    function()
      return ""
    end,
    color = tinte,
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
  },
}
