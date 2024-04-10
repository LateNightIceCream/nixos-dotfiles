local options = {
	undofile = true,
	ignorecase = true,
	smartcase = true,
	showmode = false,
	showtabline = 2,
	smartindent = true,
	autoindent = true,
	swapfile = false,
	hidden = true,
	expandtab = true,
	cmdheight = 1,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	cursorcolumn = false,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	scrolloff = 8,
	updatetime = 100,
	foldenable = false,
	foldlevel = 99,
  termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


-- should find a way to outsource this to themes module
--local colorscheme = "rose-pine"
local colorscheme = "rosebones"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "light" -- or "light" for light mode
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-- require('configs.colorscheme')

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.latex_to_unicode_auto = 1
vim.g.tex_conceal = ""
vim.g.vimtex_syntax_conceal = {
  styles = 0,
  math_bounds = 0,
  math_delimiters = 0,
  math_fracs = 0,
  math_super_sub = 0,
  math_symbols = 0,
}
