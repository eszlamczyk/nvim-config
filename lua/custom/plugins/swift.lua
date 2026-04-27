---@module 'lazy'
---@type LazySpec
return {
  {
    -- Build, run, test, device picker for Xcode projects.
    -- Requires (run once per machine):
    --   brew install xcode-build-server xcbeautify
    -- Requires (run once per project):
    --   xcode-build-server config -scheme <Scheme> -workspace <App>.xcworkspace
    'wojciech-kulik/xcodebuild.nvim',
    cond = vim.fn.has 'mac' == 1,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('xcodebuild').setup {
        logs = { auto_open_on_build_output = true },
      }

      local xb = require 'xcodebuild.actions'
      vim.keymap.set('n', '<leader>mxl', xb.toggle_logs,   { desc = '[X]code [L]ogs' })
      vim.keymap.set('n', '<leader>mxb', xb.build,         { desc = '[X]code [B]uild' })
      vim.keymap.set('n', '<leader>mxr', xb.run,           { desc = '[X]code [R]un' })
      vim.keymap.set('n', '<leader>mxt', xb.run_tests,     { desc = '[X]code [T]ests' })
      vim.keymap.set('n', '<leader>mxd', xb.select_device, { desc = '[X]code [D]evice' })
      vim.keymap.set('n', '<leader>mxs', xb.select_scheme, { desc = '[X]code [S]cheme' })
    end,
  },
}
