local ok, blink = pcall(require, "blink.cmp")

local blink_capabilities = {}

if ok then
  blink_capabilities = blink.get_lsp_capabilities()
end

return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "astro",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "html",
    "blade",
    "css",
    "scss",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.ts",
    "package.json",
    ".git",
  },
  settings = {
    tailwindCSS = {
      emmetCompletions = true,
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidConfigPath = "error",
        invalidTailwindDirective = "error",
        recommendedVariantOrder = "warning",
      },
      classAttributes = {
        "class",
        "className",
        "classList",
        "ngClass",
        ":class",
        "classContainer",
        "classLabel",
      },
      experimental = {
        classRegex = {
          "tw`([^`]*)`",
          "tw\\(([^)]*)\\)",
          "@apply\\s+([^;]*)",
          'class="([^"]*)"',
          'className="([^"]*)"',
          ':class="([^"]*)"',
          "@class\\(([^)]*)\\)",
        },
      },
    },
  },
  capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink_capabilities),
}
