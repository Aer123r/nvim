local status, lspsaga = pcall(require, 'lspsaga')

if (not status) then
  return
end

lspsaga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,

})



