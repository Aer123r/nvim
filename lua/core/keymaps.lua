vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map('n', '<leader>e', '<CMD>:NvimTreeToggle<CR>', opt)

--telescope

map('n', '<leader>fd', '<CMD>:Telescope fd<CR>', {})
map('n', '<leader>fg', '<CMD>:Telescope live_grep<CR>', {})
map('n', '<leader>fb', '<CMD>:Telescope buffers<CR>', {})
map('n', '<leader>fh', '<CMD>:Telescope help_tags<CR>', {})

--editing
map('n', '<leader>/', 'gcc', {})
map('v', '<leader>/', 'gcc', {})

map('n', '<C-a>', 'ggVG', {})

map('i', '<C-j>', '<Down>', {})
map('i', '<C-k>', '<Up>', {})
map('i', '<C-h>', '<Left>', {})
map('i', '<C-l>', '<Right>', {})
--floatterm
vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat<CR>") -- split window vertically
vim.keymap.set("n", "<C-\\>", "<CMD>:Lspsaga term_toggle<CR>")         -- split window horizontally
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>:q<CR>")                   -- split window horizontally
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")                    -- make split windows equal width & height


--bufferline
--
map('n', '<Tab>', '<CMD>:BufferLineCycleNext<CR>', opt)
map('n', '<S-Tab>', '<CMD>:BufferLineCyclePrev<CR>', opt)
-- buffer close
map('n', '<leader>x', '<CMD>:Bdelete<CR>', opt)

-- Navigator
vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({ 'n', 't' }, '<C-p>', '<CMD>NavigatorPrevious<CR>')

-- Lspsaga
map('n', 'K', '<CMD>:Lspsaga hover_doc<CR>', {})
map('n', '<space>nr', '<CMD>:Lspsaga rename<CR>', {})
map('n', 'gp', '<CMD>:Lspsaga peek_definition<CR>', {})
map("n", "gd", "<cmd>:Lspsaga goto_definition<CR>", {})
map("n", "<space>ca", "<cmd>:Lspsaga code_action<CR>", {})
map("n", "gd", "<cmd>:Lspsaga goto_definition<CR>", {})
-- vim keymap
-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
