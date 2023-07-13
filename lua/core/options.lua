local opt = vim.opt

--行号
opt.relativenumber = true
opt.number = true

--缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--防止包裹
opt.wrap = true

--光标行
opt.cursorline = true

--启动鼠标
opt.mouse:append("a")

--系统剪贴板
opt.clipboard:append("unnamedplus")

--搜索
opt.ignorecase = true
opt.smartcase = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 禁用自动注释
vim.cmd('autocmd FileType * setlocal formatoptions-=cro')

