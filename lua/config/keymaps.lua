-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set({ "n" }, "<Leader>B", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

-- Code Runner Keybinds
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- BetterTerm Keybinds
local betterTerm = require("betterTerm")
vim.keymap.set({ "n" }, "<leader>t", function() end, { desc = "Better Term" })
-- toggle firts term
vim.keymap.set({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
-- Select term focus
vim.keymap.set({ "n" }, "<leader>tt", betterTerm.select, { desc = "Select terminal" })
-- Create new term
local current = 2
vim.keymap.set({ "n" }, "<leader>tn", function()
  betterTerm.open(current)
  current = current + 1
end, { desc = "New terminal" })

-- BetterTerm Integration with CodeRunner Keybinds
vim.keymap.set("n", "<leader>re", function()
  require("betterTerm").send(
    require("code_runner.commands").get_filetype_command(),
    1,
    { clean = true, interrupt = true }
  )
end, { desc = "Execute File" })

--Crtl C to Esc
vim.keymap.set("n", "<C-c>", "<esc>", { desc = "Esc", noremap = true, silent = false })

-- Harpoon Keybinds
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon Add Mark" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon Toggle Menu" })
vim.keymap.set("n", "<leader>h", function() end, { desc = "Harpoon" })
vim.keymap.set("n", "<leader>hh", function()
  ui.nav_file(1)
end, { desc = "harpoon file 1" })
vim.keymap.set("n", "<leader>hj", function()
  ui.nav_file(2)
end, { desc = "Harpoon File 2" })
vim.keymap.set("n", "<leader>hk", function()
  ui.nav_file(3)
end, { desc = "Harpoon File 3" })
vim.keymap.set("n", "<leader>hl", function()
  ui.nav_file(4)
end, { desc = "Harpoon File 4" })

-- Center Control D and U to Center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = true })

-- Center Search in Middle
vim.keymap.set("n", "n", "nzzzv", { remap = true })
vim.keymap.set("n", "N", "Nzzzv", { remap = true })

-- Fuzzy Find Hidden Files
vim.api.nvim_set_keymap(
  "n",
  "<Leader><space>",
  ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
  { noremap = true, silent = true }
)
