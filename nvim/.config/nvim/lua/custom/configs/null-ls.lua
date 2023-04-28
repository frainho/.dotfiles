local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.prettierd.with({
		filetypes = {
			"html",
			"markdown",
			"css",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
	}), -- so prettier works only on these filetypes

	-- b.diagnostics.eslint_d.with({
	-- 	filetypes = {
	-- 		"typescriptreact",
	-- 		"typescript",
	-- 		"javascriptreact",
	-- 		"javascript",
	-- 	},
	-- }),

	-- Lua
	b.formatting.stylua,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
