return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "gopls", "ts_ls", "lua_ls" },
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			local caps = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, buf)
				local map = function(m, lhs, rhs) vim.keymap.set(m, lhs, rhs, { buffer = buf }) end
				map("n", "gd", vim.lsp.buf.definition)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>ca", vim.lsp.buf.code_action)
				map("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end)
			end

			for _, server in ipairs({ "pyright", "gopls", "ts_ls" }) do
				lspconfig[server].setup({ capabilities = caps, on_attach = on_attach })
			end

			lspconfig.lua_ls.setup({
				capabilities = caps, on_attach = on_attach,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
						else fallback() end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, { name = "luasnip" },
				}, {
					{ name = "buffer" }, { name = "path" },
				}),
			})
		end,
	},
}
