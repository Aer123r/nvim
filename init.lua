local vim = vim
if vim.g.vscode then
  -- VSCode extension
else
  require("core.lazy")
  require('plugins.init')
  require("core.options")
  require('core.linter')
  require("core.keymaps")

  -- ordinary Neovim
end

require("core.cmd")
require("core.colors")
