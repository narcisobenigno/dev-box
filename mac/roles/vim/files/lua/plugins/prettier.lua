return {
  {
    "prettier/vim-prettier",
    ft = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown" }, -- File types to enable prettier
    build = "pnpm install", -- Install Prettier locally if not already installed
    config = function()
      -- Configure vim-prettier
      vim.g["prettier#autoformat"] = 1 -- Enable auto-formatting on save
      vim.g["prettier#quickfix_enabled"] = 1 -- Disable quickfix window
    end,
  },
}

