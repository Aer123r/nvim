local status,copilot = pcall(require,'copilot')

if not status then
  print('copilot not installed yet')
  return
end
copilot.setup({
  suggestion = {
    enabled = false,
    auto_trigger = true,
  },
  panel = { enable = false },
  filetypes = {
  },
  copilot_node_command = 'node'
})

