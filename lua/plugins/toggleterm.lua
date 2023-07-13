local status, toggleterm = pcall(require, 'toggleterm')

if (not status) then
  return
end

toggleterm.setup({
  size = 10,
--  open_mapping = [[<C-a>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction='float',
  close_on_exit = true,
  shell = vim.o.shell,
  
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
 lazygit:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
  python:toggle()
end


