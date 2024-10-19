return {
  { "nvchad/volt", lazy = true },
  {
    "nvchad/minty",
    lazy = true,
    keys = {
      {
        "cp",
        function()
          require("minty.huefy").open()
        end,
        desc = "Color Picker",
      },
    },
  },
  {
    "nvchad/menu",
    event = "User FileOpened",
    -- lazy = true,
    config = function()
      vim.keymap.set("n", "<RightMouse>", function()
        vim.cmd.exec '"normal! \\<RightMouse>"'

        local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
        require("menu").open(options, { mouse = true })
      end, {})
    end,
  },
}
