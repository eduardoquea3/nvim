local autocmd = require "config.autocmd"
autocmd.load_defaults()
require "config.option"
require "config.lazy"
require "config.diagnostic"
-- if vim.g.neovide then
require "config.neovide"
-- end
