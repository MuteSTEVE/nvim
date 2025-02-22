local PLUG = {
	"iamcco/markdown-preview.nvim",
	ft = "md",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	keys = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" }, { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>" } },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}

function PLUG.config()
	-- set to 1, echo preview page URL in cmdline window when opening preview page
	vim.g.mkdp_echo_preview_url = 1
end

return PLUG
