-- Global fallback mobile keymaps.
-- These work for standard (non-monorepo) projects.
-- Project-local .nvim.lua files may override these for specific repos.
-- Xcode keymaps (<leader>mx*) are defined in custom/plugins/swift.lua via xcodebuild.nvim.

-- [A]ndroid [S]etup: boot the emulator
vim.keymap.set("n", "<leader>mas", function()
  local avds = vim.fn.systemlist("emulator -list-avds")
  if not avds or #avds == 0 then
    vim.notify("No AVDs found. Create one in Android Studio.", vim.log.levels.ERROR)
    return
  end
  vim.ui.select(avds, { prompt = "Select AVD to boot:" }, function(choice)
    if not choice then return end
    os.execute("nohup emulator -avd " .. choice .. " > /dev/null 2>&1 &")
    vim.notify("Booting Android Emulator: " .. choice)
  end)
end, { desc = "[A]ndroid [S]etup Emulator" })

-- [A]ndroid [R]un: build & install via Gradle
vim.keymap.set("n", "<leader>mar", function()
  vim.cmd("botright 15split | term ./gradlew installDebug")
  vim.cmd("startinsert")
end, { desc = "[A]ndroid [R]un Gradle" })
