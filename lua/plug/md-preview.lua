return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" }, { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>"}},
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
