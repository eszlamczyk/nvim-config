---@module 'lazy'
---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<leader>t]],
    direction = 'horizontal',
    size = 15,
  },
  keys = (function()
    local keys = { { '<leader>t', desc = 'Toggle [T]erminal' } }
    for i = 1, 9 do
      table.insert(keys, {
        '<leader>t' .. i,
        function() require('toggleterm').toggle(i) end,
        desc = 'Toggle Terminal ' .. i,
      })
    end
    return keys
  end)(),
}
