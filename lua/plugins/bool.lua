return {
  "rmagatti/alternate-toggler",
  keys = { { "<leader>i", "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", desc = "Toggle Boolean" } },
  config = function()
    require("alternate-toggler").setup {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["==="] = "!==",
        ["=="] = "!=",
      },
    }
  end,
  lazy = true,
}
