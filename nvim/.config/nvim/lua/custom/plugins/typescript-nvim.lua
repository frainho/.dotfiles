local on_attach = require('custom.lsp').on_attach
local capabilities = require('custom.lsp').capabilities

return {
  'jose-elias-alvarez/typescript.nvim',
  config = function()
    require('typescript').setup {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
}
