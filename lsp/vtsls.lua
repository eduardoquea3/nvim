return {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        experimental = {
          maxInlayHintLength = 30,
          completion = {
            enableServersSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enable = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enable = true },
          functionLikeReturnTypes = { enable = true },
          parameterNames = { enable = "literals" },
          parameterTypes = { enable = true },
          propertyDeclarationTypes = { enable = true },
          variableTypes = { enable = false },
        },
      },
    },
  },
}
