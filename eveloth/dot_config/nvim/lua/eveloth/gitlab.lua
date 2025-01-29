local M = {
	'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
	event = { "BufReadPre", "BufNewFile" },
	cond = function()
		-- Only activate if token is present in environment variable.
		-- Remove this line to use the interactive workflow.
		return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
	end,
  ft = {
    'yaml',
    'toml',
  }
}

function M.config() end

return M

