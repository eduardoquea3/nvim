vim.keymap.set("n", "<leader>ft", function()
  local filetype = vim.bo.filetype
  print("Filetype: " .. filetype)
end, { noremap = true, desc = "Show filetype" })

local function is_fastapi_file()
  local current_file = vim.fn.expand "%:p"
  local current_dir = vim.fn.fnamemodify(current_file, ":h")

  -- Buscar pyproject.toml subiendo en el árbol de directorios
  local pyproject_path = vim.fn.findfile("pyproject.toml", current_dir .. ";")

  if pyproject_path == "" then
    return false
  end

  local file = io.open(pyproject_path, "r")
  if not file then
    return false
  end

  local content = file:read "*all"
  file:close()

  -- Buscar fastapi en dependencies
  if content:match 'dependencies%s*=%s*%[.-%"fastapi' then
    return true
  end

  return false
end

local function find_endpoints_in_file(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return {}
  end

  local content = file:read "*all"
  file:close()

  local lines = vim.split(content, "\n")
  local endpoints = {}
  local http_methods = { "get", "post", "put", "patch", "delete", "options", "head" }

  for i, line in ipairs(lines) do
    for _, method in ipairs(http_methods) do
      local pattern = "@(%w+)%." .. method .. '%s*%("([^"]+)"'
      local app_name, path = line:match(pattern)
      if not app_name or not path then
        pattern = "@(%w+)%." .. method .. "%s*%('([^']+)'"
        app_name, path = line:match(pattern)
      end
      if app_name and path then
        local short_decorator = string.format("@%s.%s(%q)", app_name, method, path)
        table.insert(endpoints, {
          method = method:upper(),
          path = path,
          line = i,
          file = filepath,
          decorator = short_decorator,
        })
      end
    end
  end

  return endpoints
end

local function find_fastapi_endpoints()
  if not is_fastapi_file() then
    vim.notify("This is not a FastAPI project", vim.log.levels.WARN)
    return
  end

  -- Encontrar el directorio raíz del proyecto
  local current_file = vim.fn.expand "%:p"
  local project_root = vim.fn.fnamemodify(vim.fn.findfile("pyproject.toml", current_file .. ";"), ":h")

  if project_root == "" then
    vim.notify("Could not find project root", vim.log.levels.WARN)
    return
  end

  -- Buscar todos los archivos Python en el proyecto
  local python_files = vim.fn.globpath(project_root, "**/*.py", false, true)
  local all_endpoints = {}

  for _, filepath in ipairs(python_files) do
    local endpoints = find_endpoints_in_file(filepath)
    for _, ep in ipairs(endpoints) do
      table.insert(all_endpoints, ep)
    end
  end

  if #all_endpoints == 0 then
    vim.notify("No FastAPI endpoints found", vim.log.levels.INFO)
    return
  end

  -- Crear items para el picker
  local items = {}
  for _, ep in ipairs(all_endpoints) do
    local short_filename = vim.fn.fnamemodify(ep.file, ":t")
    table.insert(items, {
      text = string.format("%s [%s:%d]", ep.decorator, short_filename, ep.line),
      file = ep.file,
      pos = { ep.line, 1 },
      lnum = ep.line,
      method = ep.method,
      path = ep.path,
      decorator = ep.decorator,
    })
  end

  -- Función de formato personalizada para colorear según método HTTP
  local function format_endpoint(item, picker)
    local method_colors = {
      GET = "DiagnosticOk",
      POST = "DiagnosticInfo",
      PUT = "DiagnosticWarn",
      PATCH = "DiagnosticHint",
      DELETE = "DiagnosticError",
      OPTIONS = "Comment",
      HEAD = "Comment",
    }

    local color = method_colors[item.method] or "Normal"

    return {
      { item.decorator, color },
      { " [", "Comment" },
      { vim.fn.fnamemodify(item.file, ":t"), "Directory" },
      { ":", "Comment" },
      { tostring(item.lnum), "Number" },
      { "]", "Comment" },
    }
  end

  -- Abrir picker de snacks.nvim
  require("snacks").picker.pick {
    source = "fastapi_endpoints",
    items = items,
    format = format_endpoint,
    confirm = function(picker, item)
      picker:close()
      -- Abrir el archivo y ir a la línea del endpoint
      vim.schedule(function()
        vim.cmd("edit " .. item.file)
        vim.api.nvim_win_set_cursor(0, { item.lnum, 0 })
        vim.cmd "normal! zz"
      end)
    end,
    win = {
      input = {
        keys = {
          ["<c-e>"] = { "confirm", mode = { "n", "i" } },
        },
      },
      list = {
        keys = {
          ["<c-e>"] = "confirm",
        },
      },
    },
  }
end

vim.keymap.set("n", "<leader>fe", find_fastapi_endpoints, { noremap = true, desc = "Find FastAPI endpoints" })
