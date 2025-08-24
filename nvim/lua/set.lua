vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Move current line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Page down/up and center
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.o.statuscolumn = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.number = true
vim.wo.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.confirm = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>nh", vim.cmd.split, { desc = "[N]ew [H]orizontal split" })
vim.keymap.set("n", "<leader>nv", vim.cmd.vsplit, { desc = "[N]ew [V]ertical split" })
vim.keymap.set("n", "<leader>nt", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end, { desc = "[N]ew [T]erminal" })

vim.keymap.set("n", "<leader>o", vim.cmd.only, { desc = "Leave [O]nly the current window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Ctrl + direction to move between windows in a tab
vim.keymap.set("n", "<S-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<S-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<S-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<S-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Alt + {i/a} to jump to de beginning/end of the line in Insert mode
vim.keymap.set("i", "<M-a>", "<Esc>A")
vim.keymap.set("i", "<M-i>", "<Esc>I")

vim.keymap.set("n", "<M-o>", "o<Esc>")
vim.keymap.set("n", "<M-O>", "O<Esc>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Toggle colorschemes
vim.keymap.set("n", "<leader>cs", function()
	if vim.g.colors_name == "rose-pine" then
		vim.cmd.colorscheme("tokyonight-night")
	else
		vim.cmd.colorscheme("rose-pine")
	end
end, { desc = "Toggle [C]olor[S]chemes" })

vim.keymap.set("n", "<leader>rn", function()
	if vim.wo.relativenumber == true then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end, { desc = "Toggle [R]elative [N]umbers" })

vim.keymap.set("n", "<leader>k", function()
	vim.lsp.buf.hover()
end, { desc = "Show info" })

vim.api.nvim_create_user_command("Lu", "Lazy update", {})

vim.keymap.set("n", "·", "^")
