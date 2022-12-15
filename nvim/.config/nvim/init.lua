vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "arcticicestudio/nord-vim" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "mhinz/vim-startify" }
    use { "justinmk/vim-dirvish" }
    use { "nvim-lualine/lualine.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-repeat" }
    use { "tpope/vim-unimpaired" }
end)

vim.opt.termguicolors = true
vim.g.nord_underline = true
vim.g.nord_italic = true
vim.g.nord_italic_comments = true
vim.cmd("colorscheme nord")

require("nvim-treesitter.configs").setup({
    highlight = { enable = true }
})

require("lualine").setup({
    sections = {
        lualine_b = { "branch" },
        lualine_x = {
            "encoding",
            { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } },
            "filetype"
        }
    }
})

require("nvim-autopairs").setup()

require("Comment").setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true

vim.opt.mouse = "a"

vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.wrap = false

vim.opt.clipboard:append("unnamedplus")

vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.keymap.set("", "<C-LEFT>", "<C-w>h", { noremap = true })
vim.keymap.set("", "<C-DOWN>", "<C-w>j", { noremap = true })
vim.keymap.set("", "<C-UP>", "<C-w>k", { noremap = true })
vim.keymap.set("", "<C-RIGHT>", "<C-w>l", { noremap = true })
