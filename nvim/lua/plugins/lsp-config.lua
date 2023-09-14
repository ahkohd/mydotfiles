-- luacheck: globals vim

return {
	"neovim/nvim-lspconfig",
	name = "lspconfig",
	event = "VeryLazy",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "simrat39/rust-tools.nvim" },
	config = function()
		local nvim_lsp = require("lspconfig")
		local protocol = require("vim.lsp.protocol")

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			--Enable completion triggered by <c-x><c-o>
			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

			-- mappings
			local opts = { noremap = true, silent = true }
			buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

			-- formatting
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_command([[augroup Format]])
				vim.api.nvim_command([[autocmd! * <buffer>]])
				vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
				vim.api.nvim_command([[augroup END]])
			end

			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint(bufnr, true)
			end

			protocol.CompletionItemKind = {
				"", -- Text
				"", -- Method
				"", -- Function
				"", -- Constructor
				"", -- Field
				"", -- Variable
				"", -- Class
				"ﰮ", -- Interface
				"", -- Module
				"", -- Property
				"", -- Unit
				"", -- Value
				"", -- Enum
				"", -- Keyword
				"﬌", -- Snippet
				"", -- Color
				"", -- File
				"", -- Reference
				"", -- Folder
				"", -- EnumMember
				"", -- Constant
				"", -- Struct
				"", -- Event
				"ﬦ", -- Operator
				"", -- TypeParameter
			}
		end

		-- Set up completion using nvim_cmp with LSP source
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local rt = require("rust-tools")

		-- debugger lldb for Rust
		local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/bin/lldb"

		-- Setup rust tools
		-- Note: don't use lsp-installer's rust-analyzer, use: $ brew install rust-analyzer
		local rustopts = {
			tools = {
				runnables = {
					use_telescope = true,
				},
				inlay_hints = {
					auto = false,
				},
				hover_actions = {
					auto_focus = true,
				},
			},
			-- https://rust-analyzer.github.io/manual.html#features
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
					["rust-analyzer"] = {
						diagnostics = {
							disabled = { "unresolved-proc-macro" },
						},
						inlayHints = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
							allFeatures = true,
							overrideCommand = {
								"cargo",
								"clippy",
								"--workspace",
								"--message-format=json",
								"--all-targets",
								"--all-features",
							},
						},
					},
				},
			},
			-- debugging stuff
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		}

		rt.setup(rustopts)

		nvim_lsp.vimls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.ocamllsp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					hint = {
						enable = true,
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Note: don't use lspinstall cssls, instead use npm i -g vscode-langservers-extracted
		nvim_lsp.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.cssmodules_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		})

		-- icon
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			-- This sets the spacing and the prefix, obviously.
			virtual_text = {
				spacing = 4,
				prefix = "",
			},
		})
	end,
}
