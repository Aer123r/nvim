local status, bufferline = pcall(require, 'bufferline')

if (not status) then
  return
end

bufferline.setup {
  options = {
    mode = 'buffer',
    style_preset = bufferline.style_preset.default,
    numbers = 'buffer_id',
    seperator_style = 'slant',
    always_show_bufferline = true,
    color_icons = true,
    diagnostics = 'nvim-lsp',
    close_command = function (bufnr)
      require('bufdelete').bufdelete(bufnr, true)
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }

    }
  },

}
