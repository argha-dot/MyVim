local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local stat_ok, Rule = pcall(require, "nvim-autopairs.rule")
if not stat_ok then return end

local ok_cond, cond = pcall(require, "nvim-autopairs.conds")
if not ok_cond then return end

npairs.setup {}

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  }
)

npairs.add_rules({
  Rule("$$", "$$", { "tex", "latex" })
    :with_pair(function(opts)
      print(vim.inspect(opts))
      if opts.line=="aa $$" then
        -- don't add pair on that line
        return false
      end
    end)
})
