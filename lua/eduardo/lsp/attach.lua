local filetype_attach = setmetatable({}, {
  __index = function()
    return function() end
  end,
})

return function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  --vim.api.nvim_create_autocmd('BufWritePre',{
  --  buffer = bufnr,
  --  callback = function ()
  --    vim.lsp.buf.format()
  --  end
  --})

  if client.server_capabilities.inlayHintPorveder then
    vim.lsp.inlay_hint(bufnr, true)
  end
  filetype_attach[filetype](client, bufnr)
end
