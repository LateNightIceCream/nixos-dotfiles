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
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
