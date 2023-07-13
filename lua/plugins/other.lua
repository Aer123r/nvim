local status,_ = pcall(require,'notebook')
if(not status) then return end
require('notebook').setup {
    -- Whether to insert a blank line at the top of the notebook
    insert_blank_line = true,

    -- Whether to display the index number of a cell
    show_index = true,

    -- Whether to display the type of a cell
    show_cell_type = true,

    -- Style for the virtual text at the top of a cell
    virtual_text_style = { fg = "lightblue", italic = true },
}

require('nvim-ts-autotag').setup()

-- Navigator
require('Navigator').setup()

-- lazygit

-- project
require('project_nvim').setup{
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {},

  -- Show hidden files in telescope
  show_hidden = false,

  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,

  -- What scope to change the directory, valid options are
  -- * global (default)
  -- * tab
  -- * win
  scope_chdir = 'global',

  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data"),
}
require('telescope').load_extension('projects')
-- indent-blankline.nvim
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- hologram.nvium
local status_holgram,hologram = pcall(require,'hologram')
if status_holgram then
  hologram.setup{
    auto_display=true
  }
end
