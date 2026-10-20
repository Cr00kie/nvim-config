-- Set leader key to space
vim.g.mapleader = " "

-- ============== OPTIONS =================
-- Line/Display options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.list = true -- show listchars below
vim.opt.listchars = {
	tab = "» ", -- char drawn in tabs
	trail = "·", -- char drawn in trailing spaces
	nbsp = "␣", -- char drawn in non-breaking spaces
}

-- Behaviour options
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoread = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400 -- time between keys in keymaps

-- Completion options
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 300 -- time to show the automcomplete menu
vim.opt.completeopt = "menu,menuone,noinsert,popup"

-- Indentation options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Netrw options
-- vim.g.netrw_banner = 0




-- ============ PLUGINS ===============
vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/windwp/nvim-autopairs",
})

-- =================== Theme ==================
vim.opt.termguicolors = true
require("tokyonight").setup({
	style = "night",
})
vim.cmd.colorscheme("tokyonight")



-- ============= UI SHIT ===============
require("lualine").setup()



-- ============ KEYMAPS ===============
-- Open netrw explorer with space e
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- FZF keymaps
local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>fr", fzf.files, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fb", fzf.files, { desc = "Buffers" })

-- Autopairs
require("nvim-autopairs").setup()




-- ============= LSP ================
require("mason").setup()

-- this is so that LSPs work on file outside project directories
vim.lsp.config('*', {
    workspace_required = false,
})

-- enabled languages
vim.lsp.enable({
    'bashls',            -- bash-language-server
    'clangd',            -- clangd
    'glsl_analyzer',     -- glsl_analyzer
    'jsonls',            -- json-lsp
    'lua_ls',            -- lua-language-server
    'luau_lsp',          -- luau-lsp
    'markdown_oxide',    -- markdown-oxide
    'neocmake',          -- neocmakelsp
    'rust_analyzer',     -- rust-analyzer
    'wgsl_analyzer',     -- wgsl-analyzer
    'yamlls',            -- yaml-language-server
})

-- LSP diagnostics config
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	underline = true,
	update_in_insert = false,
})
