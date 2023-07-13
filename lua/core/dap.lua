local status, dap = pcall(require, 'dap')
if not status then
  return
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/Users/wugaoyuan/anaconda3/bin/python'
    end,
  },
}

