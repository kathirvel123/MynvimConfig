-- Basic settings
vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Leader key
vim.g.mapleader = " "

-- Save and reload keymap
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")


-- Plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup("plugins")

vim.cmd("colorscheme carbonfox")




local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- vim.keymap for the neo-tree

vim.keymap.set('n','<leader>vv',':Neotree filesystem reveal right<CR>',{desc ='Open Neotree'})
vim.keymap.set('n','<leader>cc',':Neotree close<CR>',{desc = 'Close NeoTree'})

-- Keymaps for bufferline
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Normal mode
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })       -- Undo
vim.keymap.set("n", "<C-y>", "<C-r>", { noremap = true, silent = true })   -- Redo

-- Insert mode
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })       -- Undo
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { noremap = true, silent = true })   -- Redo




