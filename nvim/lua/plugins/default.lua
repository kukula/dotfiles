-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
--
return {
	{ "akinsho/bufferline.nvim", enabled = false },
	{ "rcarriga/nvim-notify", enabled = false },
	{ "ggandor/flit.nvim", enabled = false },
	{ "ggandor/leap.nvim", enabled = false },
	{ "lewis6991/gitsigns.nvim", enabled = false },

	{ "TimUntersberger/neogit" },
	{
		"dinhhuy258/git.nvim",
		opts = {
			default_mappings = true,
		},
	},

	{
		"folke/which-key.nvim",
		opts = {
			defaults = {
				["<leader>t"] = { name = "+test" },
				["<leader>d"] = { name = "+debug" },
				["<leader>da"] = { name = "+adapters" },
			},
		},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			direction = "vertical",
			close_on_exit = false,
			open_mapping = [[<c-\>]],
			shade_terminals = false,
		},
	},

	{
		"stevearc/overseer.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		opts = {
			strategy = {
				"toggleterm",
				-- load your default shell before starting the task
				use_shell = false,
				-- overwrite the default toggleterm "direction" parameter
				direction = nil,
				-- overwrite the default toggleterm "highlights" parameter
				highlights = nil,
				-- overwrite the default toggleterm "auto_scroll" parameter
				auto_scroll = nil,
				-- have the toggleterm window close and delete the terminal buffer
				-- automatically after the task exits
				close_on_exit = false,
				-- have the toggleterm window close without deleting the terminal buffer
				-- automatically after the task exits
				-- can be "never, "success", or "always". "success" will close the window
				-- only if the exit code is 0.
				quit_on_exit = "never",
				-- open the toggleterm window when a task starts
				open_on_start = true,
				-- mirrors the toggleterm "hidden" parameter, and keeps the task from
				-- being rendered in the toggleable window
				hidden = false,
				-- command to run when the terminal is created. Combine with `use_shell`
				-- to run a terminal command before starting the task
				on_create = nil,
			},
		},
	},

	{ "olimorris/neotest-rspec" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"olimorris/neotest-rspec",
			"stevearc/overseer.nvim",
		},
		opts = {
			consumers = {
				overseer = require("neotest.consumers.overseer"),
			},
			adapters = {
				["neotest-rspec"] = {
					rspec_cmd = function()
						return vim.tbl_flatten({
							"bundle",
							"exec",
							"rspec",
						})
					end,
				},
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"suketa/nvim-dap-ruby",
			config = function()
				require("dap-ruby").setup()
			end,
		},
	},
	{
		"suketa/nvim-dap-ruby",
		config = function()
			require("dap-ruby").setup()
		end,
	},

	{
		"folke/tokyonight.nvim",
		opts = {
			-- transparent = true,
			style = "night",
			-- styles = {
			-- 	sidebars = "transparent",
			-- 	floats = "transparent",
			-- },
		},
	},

	-- change trouble config
	-- {
	-- 	"folke/trouble.nvim",
	-- 	-- opts will be merged with the parent spec
	-- 	opts = { use_diagnostic_signs = true },
	-- },

	-- disable trouble
	-- { "folke/trouble.nvim", enabled = false },

	-- change some telescope options and a keymap to browse plugin files
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	keys = {
	--      -- add a keymap to browse plugin files
	--      -- stylua: ignore
	--      {
	--        "<leader>fp",
	--        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
	--        desc = "Find Plugin File",
	--      },
	-- 	},
	-- 	-- change some options
	-- 	opts = {
	-- 		defaults = {
	-- 			layout_strategy = "horizontal",
	-- 			layout_config = { prompt_position = "top" },
	-- 			sorting_strategy = "ascending",
	-- 			winblend = 0,
	-- 		},
	-- 	},
	-- },

	-- add telescope-fzf-native
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},

	-- add pyright to lspconfig
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	---@class PluginLspOpts
	-- 	opts = {
	-- 		---@type lspconfig.options
	-- 		servers = {
	-- 			-- pyright will be automatically installed with mason and loaded with lspconfig
	-- 			pyright = {},
	-- 		},
	-- 	},
	-- },
	--
	-- add tsserver and setup with typescript.nvim instead of lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
			init = function()
				require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
					vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
				end)
			end,
		},
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- tsserver will be automatically installed with mason and loaded with lspconfig
				tsserver = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require("typescript").setup({ server = opts })
					return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
	},

	-- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
	-- treesitter, mason and typescript.nvim. So instead of the above, you can use:
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"elixir",
				"heex",
				"ruby",
			},
		},
	},

	-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
	-- would overwrite `ensure_installed` with the new value.
	-- If you'd rather extend the default config, use the code below instead:
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = function(_, opts)
	-- 		-- add tsx and treesitter
	-- 		vim.list_extend(opts.ensure_installed, {
	-- 			"tsx",
	-- 			"typescript",
	-- 		})
	-- 	end,
	-- },

	-- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
	{ import = "lazyvim.plugins.extras.lang.json" },

	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	-- Use <tab> for completion and snippets (supertab)
	-- first: disable default <tab> and <s-tab> behavior in LuaSnip
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	-- then: setup supertab in cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = "", bg = "" } },
					inactive = { c = { fg = "", bg = "" } },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "overseer" },
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				},
				lualine_x = { "branch" },
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 1 } },
				},
				lualine_z = {
					{ "location", padding = { left = 1, right = 0 } },
				},
			},
			extensions = {},
		},
	},
}
