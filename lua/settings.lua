-- Alias API
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

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
