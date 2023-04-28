local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local utils = require("core.utils")

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "solargraph", "prismals", "jsonls", "pyright" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true

			utils.load_mappings("lspconfig", { buffer = bufnr })

			if client.server_capabilities.signatureHelpProvider then
				require("nvchad_ui.signature").setup(client)
			end
		end,
		capabilities = capabilities,
	})
end

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		utils.load_mappings("lspconfig", { buffer = bufnr })

		if client.server_capabilities.signatureHelpProvider then
			require("nvchad_ui.signature").setup(client)
		end
	end,
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentRangeFormattingProvider = true

		utils.load_mappings("lspconfig", { buffer = bufnr })

		if client.server_capabilities.signatureHelpProvider then
			require("nvchad_ui.signature").setup(client)
		end
	end,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		utils.load_mappings("lspconfig", { buffer = bufnr })

		if client.server_capabilities.signatureHelpProvider then
			require("nvchad_ui.signature").setup(client)
		end
	end,
	capabilities = capabilities,
	filetypes = { "typescriptreact", "tsx" },
})

require("rust-tools").setup({
	server = {
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true

			utils.load_mappings("lspconfig", { buffer = bufnr })

			if client.server_capabilities.signatureHelpProvider then
				require("nvchad_ui.signature").setup(client)
			end
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
