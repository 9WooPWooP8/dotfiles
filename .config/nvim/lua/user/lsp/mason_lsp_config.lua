local mason_lspconfig = require("mason-lspconfig")

vim.lsp.enable({
	"omnisharp",
	"pylsp",
	"rust_analyzer",
})

-- TODO: this does not work, need to install pylsp-mypy plugin manually
local function extra_args()
	local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
	return { "--python-executable", virtual .. "/bin/python3", true }
end

vim.lsp.config('pylsp', {
	settings = {
		["pylsp"] = {
			enabled = true,
			plugins = {
				pycodestyle = {
					ignore = { "E501", "E231", "W503" },
					maxLineLength = 100,
				},
				pyls_isort = { enabled = true },
				pylsp_mypy = {
					enabled = true,
					-- this will make mypy to use the virtual environment
					-- if not activated then it will use the system python(more specifically /usr/bin/python3)
					overrides = extra_args(),
					report_progress = true,
					live_mode = true,
				},
			},
		}
	}
})

vim.lsp.config('rust_analyzer', {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
			},
		},
	}
})

mason_lspconfig.setup()
