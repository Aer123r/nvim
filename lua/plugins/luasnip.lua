local status, ls = pcall(require, 'luasnip')
if (not status) then
  return
end

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local date = function() return { ('hello world') } end

ls.add_snippets(nil, {
  java = {
    snip({
      trig = "date1",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
  },
})


ls.add_snippets(nil, {
  java = {
    snip({
      trig = "mysnip",
      namr = "aaa",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(function()
        return { ('mysnip') }
      end, {}),
    }),
  },
})
