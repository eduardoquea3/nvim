return {
  "nvim-tree/nvim-web-devicons",
  event = "User FileOpened",
  config = function()
    require("nvim-web-devicons").setup {
      override_by_extension = {
        ["http"] = {
          icon = "󰖟",
          color = "#4d80ff",
          name = "http",
        },
      },
      override_by_filename = {
        [".luacheckrc"] = {
          icon = "",
          color = "#69a6ff",
          name = ".luacheckrc",
        },
      },
    }
  end,
}
