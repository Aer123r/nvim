vim.api.nvim_create_user_command("Build", function()
  ---@diagnostic disable-next-line: missing-parameter
  local cur_dir = vim.fn.getcwd()
  print(cur_dir)
  if vim.fn.isdirectory(cur_dir .. '/cmake-build-debug') == 1 then
    vim.api.nvim_command(':!cd cmake-build-debug/ && cmake .. && make')
    print(cur_dir .. '/cmake-build-debug')
  else
    print('cmake-build-debug is not existed')
  end
end, { desc = "Build cmake project" })

vim.api.nvim_create_user_command("Flash", function()
  ---@diagnostic disable-next-line: missing-parameter
  local cfg_file = vim.fn.glob("*.cfg", false, true)[1]
  local elf_file = vim.fn.glob("./cmake-build-debug/*.elf", false, true)[1]
  print(elf_file)
  if cfg_file and elf_file then
    vim.api.nvim_command(':!openocd -f ' .. cfg_file .. ' -c \"program ' .. elf_file .. ' verify reset exit\"')
  else
    print("Error: Can't find .elf or .cfg file!!")
  end
end, { desc = "Falsh xxx.elf" })



vim.api.nvim_create_user_command("BuildAndFlash", function()
  ---@diagnostic disable-next-line: missing-parameter

  local cfg_file = vim.fn.glob("*.cfg", false, true)[1]
  local elf_file = vim.fn.glob("./cmake-build-debug/*.elf", false, true)[1]
  print(elf_file)
  if cfg_file and elf_file then
    vim.api.nvim_command(':!cd cmake-build-debug/ && cmake .. && make && cd .. && openocd -f ' ..
      cfg_file .. ' -c \"program ' .. elf_file .. ' verify reset exit\"')
  else
    print("Error: Can't find .elf or .cfg file!!")
  end
end, { desc = "Falsh xxx.elf" })

local chips = {
  "STM32F1xx",
  "STM32F4xx",
}

local adapters = {
  "cmsis-dap",
  "jlink",
  "stlink"
}


vim.api.nvim_create_user_command('ConfigOpenocd', function()
  ---@diagnostic disable-next-line: missing-parameter
  vim.ui.select(chips, {
    prompt = "Chips: ",
    telescope = require("telescope.themes").get_cursor(),
  }, function(chip)
    vim.ui.select(adapters, {
      prompt = "Adapters: ",
      telescope = require("telescope.themes").get_cursor(),
    }, function(adapter)
          print(chip,adapter)
    end)
  end)
end, { desc = "Config Openocd" })

-- 创建用户命令
vim.api.nvim_create_user_command('RunCode', function()
  local file_extension = vim.fn.expand('%:e')
  local current_file = vim.fn.expand('%p')
  local command = ''
  if file_extension == 'java' then
    command = 'java ' .. current_file
  elseif file_extension == 'c' then
    command = 'gcc ' .. current_file .. ' && ./a.out'
  elseif file_extension == 'cpp' then
    command = 'g++ ' .. current_file .. ' && ./a.out'
  elseif file_extension == 'py' then
    command = 'python3 ' .. current_file
  end
  vim.api.nvim_command(':!' .. command)
end, { desc = 'RUN CODE' })



-- 自动命令 
-- 在cmakelists.txt文件保存时实行
local function setup_autocmd()
  vim.cmd([[
    augroup cmake_autocmds
    autocmd!
    autocmd BufWritePost CMakeLists.txt :lua run_cmake_command()
    augroup END
  ]])
end

-- 执行cmake命令的函数
function run_cmake_command()
  vim.fn.jobstart('cd cmake-build-debug && cmake ..  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cp ./compile_command.json ../ ', {
    cwd = vim.fn.expand('%:p:h'), -- 设置工作目录为当前文件所在的目录
  })
end

-- 调用自动命令函数设置自动命令
setup_autocmd()

-------------------
