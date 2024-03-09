vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Break Lines
vim.keymap.set("n", "Z", "R<CR><Esc>", { desc = "Break Lines in two" })

-- I hate Esc
vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Control-C is Escape in Insert Mode" })
vim.keymap.set("v", "<C-c>", "<esc>", { desc = "Control-C is Escape in Visual Mode" })

-- Buffer resizing
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize -2<CR>", { desc = "Resize Vertically" })
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize +2<CR>", { desc = "Resize Vertically" })
vim.keymap.set("n", "<M-j>", "<cmd>resize +2<CR>", { desc = "Resize Horizontally" })
vim.keymap.set("n", "<M-k>", "<cmd>resize -2<CR>", { desc = "Resize Horizontally" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "" })
vim.keymap.set("v", ">", ">gv", { desc = "" })

vim.keymap.set("n", "<", "<<", { desc = "" })
vim.keymap.set("n", ">", ">>", { desc = "" })

-- TAB and SHIFT TAB will cycle through buffers
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { desc = "" })
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>", { desc = "" })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "" })

vim.keymap.set("i", "<space>", "<C-g>u<space>", { desc = "" })

-- Deleting and Pasting
vim.keymap.set("n", "ss", '"_dd', { desc = "" })
vim.keymap.set("n", "s", '"_d', { desc = "" })
vim.keymap.set("n", "S", '"_D', { desc = "" })
vim.keymap.set("n", "<Leader>p", '"0p', { desc = "" })
vim.keymap.set("n", "<Leader>P", '"0P', { desc = "" })
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "" })

-- Better J
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

-- Better n, N
vim.keymap.set("n", "n", "nzzzv", { desc = "" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "" })

-- Moving text up and down in visual selection
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { desc = "While in visual mode, move selected lines up" })
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { desc = "While in visual mode, move selected lines down" })

-- Start and end of line
vim.keymap.set("n", "<S-h>", "^", { desc = "Move to the start of the line" })
vim.keymap.set("n", "<S-l>", "$", { desc = "Move to the end of the line" })

vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s#\<<C-r><C-w>\>#<C-r><C-w>#gI<Left><Left><Left>]],
	{ desc = "Replace all occurance of the word cursor is on in the file" }
)
