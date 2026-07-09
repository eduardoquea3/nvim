local M = {}

local function find_root(fname, markers)
  local dir = vim.fn.fnamemodify(fname, ":h")
  local found = vim.fs.find(markers, { path = dir, upward = true, limit = 1 })

  if #found == 0 then
    return nil
  end

  return vim.fs.dirname(found[1])
end

function M.detect(fname)
  if fname == nil or fname == "" then
    return "biome", vim.fn.getcwd()
  end

  local biome_root = find_root(fname, { "biome.json" })
  if biome_root then
    return "biome", biome_root
  end

  local oxc_root = find_root(fname, {
    "oxlint.config.ts",
    "oxlint.config.js",
    ".oxlintrc.json",
    ".oxlintrc.jsonc",
    "oxfmt.config.ts",
    "oxfmt.config.js",
    ".oxfmtrc.json",
    ".oxfmtrc.jsonc",
  })
  if oxc_root then
    return "oxc", oxc_root
  end

  return "biome", vim.fn.fnamemodify(fname, ":h")
end

function M.js_like(filetype)
  return filetype == "javascript"
    or filetype == "javascriptreact"
    or filetype == "typescript"
    or filetype == "typescriptreact"
    or filetype == "json"
    or filetype == "jsonc"
end

return M
