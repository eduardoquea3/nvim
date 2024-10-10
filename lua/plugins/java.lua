return {
  "nvim-java/nvim-java",
  ft = { "java" },
  config = function()
    require("java").setup()
    require("lspconfig").jdtls.setup {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "U:\\Applications\\Scoop\\apps\\openjdk\\21.0.2-13",
                default = true,
              },
            },
          },
        },
      },
    }
  end,
}
