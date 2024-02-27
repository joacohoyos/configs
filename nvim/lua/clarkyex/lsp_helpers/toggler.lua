local M = {}

M.get_lsp_num = function(lsp_name)
	local clients = vim.lsp.get_active_clients({ bufnr = 0 })

	local out = nil

	for _, v in pairs(clients) do
		if v.name == lsp_name then
			out = v
		end
	end

	if out == nil then
		return 0
	else
		return out.id
	end
end

-- M.start_server = function(lsp_name)
M.start_server = function(lsp_id)
	vim.lsp.buf_attach_client(0, lsp_id)
	-- vim.cmd(":LspStart " .. lsp_name)
end

M.stop_server = function(lsp_id)
	vim.lsp.buf_detach_client(0, lsp_id)
	-- vim.cmd(":LspStop " .. lsp_id)
end

return M
