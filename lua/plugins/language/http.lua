return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      {
        "<leader>hr",
        function()
          require("kulala").run()
        end,
        desc = "kulala run",
      },
      {
        "<leader>hl",
        function()
          require("kulala").replay()
        end,
        desc = "kulala last request",
      },
      {
        "<leader>ht",
        function()
          require("kulala").toggle_view()
        end,
        desc = "kulala toggle view",
      },
    },
    config = function()
      require("kulala").setup()
    end,
  },
}
