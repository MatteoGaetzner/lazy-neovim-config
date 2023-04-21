-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Copy paste
local function copy(lines, _)
    require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
    name = "osc52",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
}

-- NOTE: Set this path to the path to your python3 executable!
vim.g.python3_host_prog = "~/.mambaforge/envs/neovim/bin/python3"

-- NOTE: Set this path to the path to your perl executable!
vim.g.perl_host_prog = "/usr/bin/perl"

-- Textwidth (following PEP 8)
vim.opt.textwidth = 79
