local default_font = "DankMono Nerd Font"
local default_size = 10

vim.g.neovide_scale_factor = 1.3
vim.g.neovide_transparency = 0.9
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 60
vim.g.neovide_confirm_quit = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "ripple"

local function set_font(font, size)
  font = font or default_font
  size = size or default_size
  vim.o.guifont = string.format("%s:h%d", font, size)
end

set_font()

local maps = {
  f0 = 8,
  f1 = 10,
  f2 = 12,
  f3 = 14,
  f4 = 16,
  f5 = 18,
}

for key, value in pairs(maps) do
  vim.keymap.set("n", "<leader>" .. key, function()
    set_font(nil, value)
  end, { desc = "Font size " .. value })
end
