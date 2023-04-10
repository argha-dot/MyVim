local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then return end

local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node

local date = function () return {os.date('%Y-%m-%d')} end

vim.api.nvim_set_keymap("i", "<c-j>",
  "<cmd>lua require'luasnip'.jump(1)<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("s", "<c-j>",
  "<cmd>lua require'luasnip'.jump(1)<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("i", "<c-k>",
  "<cmd>lua require'luasnip'.jump(-1)<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("s",
  "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>",
  {noremap = true, silent = true}
)

luasnip.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in YY MM DD format"
    }, {
        func(date, {})
    }),

    snip({
      trig = "latex",
      namr = "Latex Starter",
      dscr = "An Empty Latex Doc"
    }, {
        text({
          [[\documentclass[a4paper]{article}]],
          [[\usepackage[utf8]{inputenc}]],
          "",
          [[\usepackage{amsthm}]],
          [[\usepackage{amssymb,latexsym}]],
          ""}),
        text({"", [[\title{]]}), insert(1), text([[}]]),
        text({"", [[\author{]]}), insert(2, "Argha Chakrabarty"), text([[}]]),
        text({"", [[\date{]]}), insert(3), text([[}]]),
        text({
          "",
          [[\begin{document}]],
          "",
          [[\maketitle ]]
        }),
        text({"", [[\section{]]}), insert(0, "Section 1"), text([[}]]),
        text({
          "",
          [[\section{}]],
          "",
          [[\section{}]],
          [[\end{document}]]
        }),
    })
  }
})



