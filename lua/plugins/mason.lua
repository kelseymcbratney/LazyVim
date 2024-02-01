return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "pyright",
      "mypy",
      "ruff",
      "black",
      "debugpy",
      "cpplint",
      "cpptools",
      "clangd",
      "java-test",
      "java-debug-adapter",
    },
  },
}
