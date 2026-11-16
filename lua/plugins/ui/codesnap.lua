return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.0-beta.17",
  config = function()
    require("codesnap").setup {
      background = "#00000000",
      watermark = {
        content = "EduardoQuea3",
        font_family = "Pacifico",
        color = "#000000",
      },
    }
  end,
  keys = {
    {
      "<c-p>",
      function()
        local filename = vim.fn.expand "%:t:r"
        local timestamp = os.date "%Y%m%d_%H%M%S"
        local dir = vim.fn.expand "~/Pictures/codesnap"
        vim.fn.mkdir(dir, "p")
        local path = string.format("%s/%s_%s.png", dir, filename, timestamp)
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes(":CodeSnapSave " .. path .. "<cr>", true, false, true),
          "n",
          false
        )
      end,
      mode = "x",
      desc = "Save code snapshot",
    },
    {
      "<leader>s",
      function()
        vim.cmd 'normal! "vy'
        local selected_text = vim.fn.getreg "v"
        vim.notify(selected_text, vim.log.levels.INFO)
      end,
      mode = "v",
      desc = "Show selected text",
    },
  },
}
