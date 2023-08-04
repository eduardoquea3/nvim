return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require 'transparent'.setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type',
          'Underlined', 'Todo', 'String', 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr',
          'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'CocFloating', 'NormalFloat',
          'FloatBorder', 'Pmenu'
        },
        extra_groups = {},
        exclude_groups = {},
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    config = function()
      require'bufferline'.setup()
    end
  }
}
