return {
  "mistweaverco/kulala.nvim",
  -- ft = { "http" },
  keys = {
    {
      "<leader>hr",
      ":lua require('kulala').run()<cr>",
      desc = "kulala",
    },
  },
  config = function()
    require("kulala").setup()
  end,
}
