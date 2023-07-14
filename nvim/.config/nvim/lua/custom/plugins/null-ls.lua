return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd.with {
          filetypes = {
            'typescript',
            'javascript',
            'javascriptreact',
            'typescriptreact',
          },
        },
        -- null_ls.builtins.diagnostics.eslint_d.with {
        --   filetypes = {
        --     'typescript',
        --     'javascript',
        --     'javascriptreact',
        --     'typescriptreact',
        --   },
        -- }
      },
    }
  end,
}
