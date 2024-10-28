vim.opt.termguicolors = true

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-from-window)')

require("config.lazy")

require("which-key")

require'nvim-web-devicons'.setup {}

require('lazy').setup()

require('render-markdown').setup({
	file_types = { 'markdown', 'quarto' },
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = function(colors)
	    return {
    		AlphaHeader = { fg = colors.pink},
		AlphaFooter = { fg = colors.blue},
		AlphaButtons = { fg = colors.yellow}
	}
	end,
    default_integrations = true,
    integrations = {
	alpha = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
	barbar = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
	colorful_winsep = {
    		enabled = true,
    		color = "pink",
	},
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

local wk = require("which-key")
wk.add({
	{ "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text", nowait = true, remap = false },
    		{ "<leader>P", "<cmd>lua require'telescope'.extensions.project.project{}<cr>", desc = "Projects", nowait = true, remap = false },
    		{ "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", nowait = true, remap = false },
    		{ "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
    		{ "<leader>e", "<cmd>Neotree<cr>", desc = "Explorer", nowait = true, remap = false },
    		{ "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, hidden = true})<cr>", desc = "Find files", nowait = true, remap = false },
    		{ "<leader>g", group = "Git", nowait = true, remap = false },
    		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    		{ "<leader>gg", "<cmd>FloatermNew lazygit<CR>", desc = "Lazygit", nowait = true, remap = false },
    		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    		{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
    		{ "<leader>l", group = "LSP", nowait = true, remap = false },
    		{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    		{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    		{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
    		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
    		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    		{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
    		{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    		{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
    		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    		{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
		{ "<leader>q", "<cmd>q!<CR>", desc = "Quit Nvim", nowait = true, remap = false },
    		{ "<leader>s", group = "Search", nowait = true, remap = false },
    		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    		{ "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    		{ "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    		{ "<leader>t", group = "Terminal", nowait = true, remap = false },
    		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
    		{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
    		{ "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", nowait = true, remap = false },
    		{ "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", nowait = true, remap = false },
    		{ "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", nowait = true, remap = false },
    		{ "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU", nowait = true, remap = false },
    		{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
    		{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	})

vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre *",
	group = "alpha_on_empty",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local name = vim.api.nvim_buf_get_name(bufnr)

		if name == "" then
      vim.cmd([[:Alpha | bd#]])
		end
	end,
})
