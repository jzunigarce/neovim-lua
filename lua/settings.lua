-- Alias API
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local api = vim.api

-- UI
opt.title = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4
opt.cursorline = true
opt.mouse = "a"
opt.numberwidth = 1
opt.showcmd = true
opt.ruler = true
opt.encoding = "utf-8"
opt.showmatch = true
opt.ignorecase = true
opt.laststatus = 2
opt.showmode = false

-- Load vim sessions
api.nvim_create_augroup("AutoLoadSession", { clear = true })
api.nvim_create_autocmd("VimEnter", {
    group = "AutoLoadSession",
    callback = function()
        if fn.filereadable("session.vim") == 1 then
            cmd("source session.vim")
        end
    end,
})
