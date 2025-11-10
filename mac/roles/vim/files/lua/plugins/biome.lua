return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "biome" },
          javascriptreact = { "biome" },
          typescript = { "biome" },
          typescriptreact = { "biome" },
          json = { "biome" },
          jsonc = { "biome" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end
  },
  {
    "biomejs/biome",
    build = function()
      if vim.fn.executable("biome") == 0 then
        vim.fn.system({ "npm", "install", "-g", "@biomejs/biome" })
      end
    end,
  }
}
