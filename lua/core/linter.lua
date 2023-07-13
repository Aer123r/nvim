local status, null_ls = pcall(require, 'null-ls')

if not status then
  return
end
print('null_ls setup')
-- null_ls.setup({
--   null_ls.builtins.formatting.black.with({extra_args = {'--line-length=120'}}),
--   null_ls.builtins.formatting.isort, -- python
--   null_ls.builtins.formatting.stylua,
--   null_ls.builtins.diagnostics.eslint,
--   null_ls.builtins.completion.spell,
-- })

local sources = {
  -- python 
  null_ls.builtins.formatting.black.with({
    extra_args = { "--line-length=120" }
  }),
  null_ls.builtins.formatting.isort,
  -- eslint
  null_ls.builtins.diagnostics.eslint,
}

null_ls.setup({sources=sources})
