local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"html",
		"css",
		"javascript",
		"ruby",
		"tsx",
		"typescript",
		"rust",
		"prisma",
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"typescript-language-server",
		"eslint-lsp",
		"tailwindcss-language-server",
		"solargraph",
		"prisma-language-server",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
		ignore = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
		full_name = true,
	},
}

M.cmp = {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

return M
