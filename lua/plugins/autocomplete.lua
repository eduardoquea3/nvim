return {
  'jiangmiao/auto-pairs',
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require 'nvim-ts-autotag'.setup({
        filetypes = {
          'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
          'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs'
        }
      })
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
          },
          update_in_insert = true,
        }
      )
    end,
  }
}
