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
    {
      { "BufEnter" },
      {
        group = "_neotree_start",
        callback = function()
          if package.loaded["neo-tree"] then
            return true
          else
            local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0))
            if stats and stats.type == "directory" then
              require("lazy").load { plugins = { "neo-tree.nvim" } }
              -- require("lazy").load { plugins = { "noice.nvim" } }
              return true
            end
          end
        end,
      },
    },
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
