local map = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc, noremap = true, silent = true })
end

map("<C-o>", "zo", "Abrir en el pliegue")
map("<C-c>", "zc", "Cerrar en el pliegue")
