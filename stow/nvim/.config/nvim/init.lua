-- Local directories for editor state.
local cache_dir = vim.fn.expand("~/.dotfiles/caches/nvim")
vim.opt.backupdir = cache_dir
vim.opt.directory = cache_dir
vim.opt.undodir = cache_dir

-- Visual settings.
vim.opt.colorcolumn = "79"
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "-" }
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Indentation.
vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.joinspaces = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Folding.
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 10

-- Status bar.
vim.opt.showmatch = true
vim.opt.statusline = "%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]"

-- Search and replace.
vim.opt.gdefault = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Ignore generated and vendor files.
vim.opt.wildignore:append({
  "*.jpg", "*.jpeg", "*.gif", "*.png", "*.psd", "*.o", "*.obj", "*.min.js",
  "*/bower_components/*", "*/node_modules/*", "*/.venv/*", "*/vendor/*",
  "*/.git/*", "*/.hg/*", "*/.svn/*", "*/log/*", "*/tmp/*",
})

vim.opt.clipboard = "unnamed"

-- Global shortcuts.
vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", "<leader>l", ":setlocal number!<CR>")
vim.keymap.set("n", "<leader>o", ":set paste!<CR>")
vim.keymap.set("n", "<leader>s", ":set spell!<CR>")
vim.keymap.set("n", "<leader>q", ":nohlsearch<CR>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Space>", "za")
vim.keymap.set("v", "<Space>", "zf")

-- Netrw.
vim.keymap.set("n", "<leader>k", ":Explore<CR>")
vim.g.netrw_liststyle = 3
vim.g.netrw_home = cache_dir

-- Preserve indentation while pasting from the system clipboard.
vim.keymap.set("n", "<leader>p", ":set paste<CR>:put *<CR>:set nopaste<CR>")

-- Use ripgrep for :grep when available.
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --no-heading --vimgrep"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Buffers.
vim.keymap.set("n", "<leader>T", ":enew<CR>")
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bq", ":bp <BAR> bd#<CR>")
vim.keymap.set("n", "<leader>bl", ":ls<CR>")

-- Filetype overrides.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.md",
  command = "setfiletype markdown",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.h",
  command = "setfiletype c",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.lalrpop",
  command = "setfiletype rust",
})

-- lazy.nvim and Telescope.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column",
        },
      },
    },
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      {
        "<leader>fl",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Search current buffer",
      },
    },
  },
})
