local M = {}

function M.load_defaults()
  local definitions = {
    {
      "FileType",
      {
        pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "norg" },
        group = "_specific_settings",
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end,
      },
    },
    {
      "BufWritePre",
      {
        group = "_space_end",
        callback = function()
          vim.cmd [[%s/\s\+$//e]]
        end,
      },
    },
    {
      "FileType",
      {
        group = "_database",
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
        callback = function()
          vim.cmd "lua require('cmp').setup.buffer({sources={{name='vim-dadbod-completion'},{ name = 'buffer' },}})"
          vim.opt.wrap = true
        end,
      },
    },
    {
      "FileType",
      {
        group = "_buffer_mappings",
        pattern = {
          "qf",
          "help",
          "man",
          "floaterm",
          "lspinfo",
          "dbout",
          "lir",
          "lsp-installer",
          "null-ls-info",
          "tsplayground",
          "DressingSelect",
          "Jaq",
          "PlenaryTestPopus",
          "notify",
          "spectre_panel",
          "startuptime",
          "neotest-output",
          "checkhealth",
          "neotest-summary",
          "neotest-output-panel",
        },
        callback = function()
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
          vim.opt_local.buflisted = false
        end,
      },
    },
    {
      "VimResized",
      {
        group = "_auto_resize",
        pattern = "*",
        command = "tabdo wincmd =",
      },
    },
    {
      { "BufRead", "BufWinEnter", "BufNewFile" },
      {
        group = "_file_opened",
        nested = true,
        callback = function(args)
          local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
          if not (vim.fn.expand "%" == "" or buftype == "nofile") then
            vim.api.nvim_del_augroup_by_name "_file_opened"
            vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
          end
          --require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
        end,
      },
    },
    -- {
    --   { "BufEnter" },
    --   {
    --     group = "_neotree_start",
    --     callback = function()
    --       if package.loaded["neo-tree"] then
    --         return true
    --       else
    --         local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0))
    --         if stats and stats.type == "directory" then
    --           require("lazy").load { plugins = { "neo-tree.nvim" } }
    --           return true
    --         end
    --       end
    --     end,
    --   },
    -- },
    {
      { "FileType" },
      {
        group = "_alpha_tabline",
        pattern = "alpha",
        command = "set showtabline=0 laststatus=0 noruler",
      },
    },
    {
      { "FileType" },
      {
        group = "_alpha_tabline",
        pattern = "alpha",
        callback = function()
          vim.wo.statuscolumn = ""
        end,
      },
    },
    -- {
    --   { "BufWritePre" },
    --   {
    --     pattern = "*",
    --     callback = function(args)
    --       require("conform").format { bufnr = args.buf }
    --     end,
    --   },
    -- },
    {
      { "LspAttach" },
      {
        group = "kickstart-lsp-attach",
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          -- map("gr", require("telescope.builtin").lsp_references, "Goto References")
          -- map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          -- map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
          -- map("<leader>p", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
          -- map("<leader>P", require("telescope.builtin").lsp_workspace_symbols, "Workspace Symbols")
          -- map("<leader>Ps", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

          map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
          map("K", "<cmd>Lspsaga hover_doc<cr>", "Hover Documentation")
          map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("<M-.>", function()
            require("fastaction").code_action()
          end, "Code action")
          vim.keymap.set("v", "<leader>ca", function()
            require("fastaction").range_code_action()
          end, { noremap = true, silent = true, buffer = event.buf, desc = "LSP: Code Action" })
          map("<leader>r", "<cmd>Lspsaga rename<cr>", "Rename")

          map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

          map("<a-s>", function()
            require("conform").format { async = true }
            vim.notify "Formateado"
          end, "Formatear archivo")
        end,
      },
    },
  }

  M.define_autocmds(definitions)
end

function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
