return {
  "seblyng/roslyn.nvim",
  opts = {
    choose_target = function(target)
      return vim.iter(target):find(function(item)
        if string.match(item, "ecommerce.sln") then
          return item
        end
      end)
    end,
  },
}
