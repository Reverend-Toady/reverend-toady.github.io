-- make keymap function
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- NATIVE

-- Set leader key 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set modes 
local n = "n"
local i = "i"
local v = "v"
local x = "x"

-- Remove keymaps
map(n, "Q", "<Nop>")
map(n, "J", "<Nop>")
map(n, "K", "<Nop>")

-- Newlines in normal mode 
map(n, "<Enter>", "o<Esc>")
map(n, "<S-Enter>", "O<Esc>")
map(n, "<BS>", "i<BS><Esc>")
map(n, "<Del>", "i<Del><Esc>")

-- navigation
map(n, "H", "^")
map(n, "L", "$")

map(i, "HH", "^")
map(i, "LL", "$")

-- Normal mode 
map(i, "jj", "<Esc>")
map(i, "kk", "<Esc>")

-- indentation
map(n, ">>", "<Nop>")
map(n, ">>", "<Nop>")
map(v, "<<", "<Nop>")
map(v, "<<", "<Nop>")

map(n, "<Tab>", ">>")
map(n, "<S-Tab>", "<<")
map(v, "<Tab>", ">><Esc>gv")
map(v, "<S-Tab>", "<<<Esc>gv")

-- system copy paste
map(x, "<leader>p", [["_dP]])

map(n, "<leader>y", [["+y]])
map(v, "<leader>y", [["+y]])

map(n, "<leader>d", [["_d]])
map(v, "<leader>d", [["_d]])

-- move text lines
map(v, "J", "<Esc>:m '>+1<CR>gv=gv")
map(v, "K", "<Esc>:m '<-2<CR>gv=gv")

map(x, "J", "<Esc>:m '>+1<CR>gv=gv")
map(x, "K", "<Esc>:m '<-2<CR>gv=gv")

-- resize buffers
map(n, "<C-Up>", ":resize -2<CR>")
map(n, "<C-Down>", ":resize +2<CR>")
map(n, "<C-Right>", ":vertical resize -2<CR>")
map(n, "<C-Left>", ":vertical resize +2<CR>")

-- switch buffers
map(n, "<leader>w", "<C-w>w")

-- quickfix
map(n, "<C-k>", "<cmd>cnext<CR>zz")
map(n, "<C-j>", "<cmd>cprev<CR>zz")
map(n, "<leader>k", "<cmd>lnext<CR>zz")
map(n, "<leader>j", "<cmd>lprev<CR>zz")

-- replace all
map(n, "<C-h>", [[yiw:%s/\<<C-r>"\>//g<left><left>]])

-- save and quit
map(n, "<C-s>", ":w<CR>")
map(n, "<C-w>", ":wq<CR>")

-- PLUGINS

-- Telescope 
local builtin = require('telescope.builtin')

map(n, "<leader>ff", builtin.find_files)
map(n, "<C-f>", builtin.git_files)
map(n, "<leader>hs", ":Telescope harpoon marks<CR>")

map(n, "<leader>fs", function ()
   builtin.grep_string({ search = vim.fn.input("search > ")}) 
end)

map("n", "<leader>t", ":Telescope file_browser<CR>")
map("n", "<leader>sc", ":Telescope spellcheck<CR>")

-- Harpoon 
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map(n, "<leader>a", mark.add_file)
map(n, "<C-e>", ui.toggle_quick_menu)

map(n, "<A-1>", function () ui.nav_file(1) end)
map(n, "<A-2>", function () ui.nav_file(2) end)
map(n, "<A-3>", function () ui.nav_file(3) end)
map(n, "<A-4>", function () ui.nav_file(4) end)
map(n, "<A-5>", function () ui.nav_file(5) end)

map(n, "<M-=>", function () ui.nav_next() end)
map(n, "<M-->", function () ui.nav_prev() end)

-- Undo Tree 
map(n, "<leader>u", vim.cmd.UndotreeToggle)

-- Packer
map(n, "<leader>ps", ":PackerSync<CR>")

