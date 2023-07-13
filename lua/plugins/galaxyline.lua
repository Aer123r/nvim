-- @type Galaxyline
local status, galaxyline = pcall(require, 'galaxyline')
if not status then return end
local colors = require('galaxyline.theme').default
-- show the current and different mode has different background colors and show the name of mode such as 'NORMAL' or 'INSERT'
galaxyline.section.left[1] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      local nameOfMode = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'VISUAL',
        [''] = 'VISUAL',
        c = 'COMMAND',
        no = 'NORMAL',
        s = 'SELECT',
        S = 'SELECT',
        [''] = 'SELECT',
        ic = 'INSERT',
        R = 'REPLACE',
        Rv = 'REPLACE',
        cv = 'COMMAND',
        ce = 'COMMAND',
        r = 'REPLACE',
        rm = 'REPLACE',
        ['r?'] = 'REPLACE',
        ['!'] = 'SHELL',
        t = 'TERMINAL',

      }
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()])
      return '  ' .. nameOfMode[vim.fn.mode()] .. ' '
    end,
    highlight = { colors.bg, colors.bg },
    separator = '',
    separator_highlight = { colors.purple, colors.darkblue },


  }
}
galaxyline.section.left[3] = {
  FileName = {
    provider = 'FilePath',
    condition = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
    end,
    highlight = { colors.white, colors.darkblue },
    separator = '',
    separator_highlight = { colors.darkblue, colors.bg },
  }
}

galaxyline.section.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.bg },
  },
}


galaxyline.section.right[4] = {
  LineColumn = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = { colors.purple, colors.darkblue },
    highlight = { colors.fg, colors.darkblue },
  }
}

-- show current line percentage
galaxyline.section.right[5] = {
  LinePercent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = { colors.purple, colors.darkblue },
    highlight = { colors.fg, colors.darkblue },
  }
}
-- show lsp client in the right side
galaxyline.section.right[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = '  ',
    highlight = { colors.green, colors.bg },
    separator = '',
    separator_highlight = { colors.bg, colors.darkblue },
  }
}


