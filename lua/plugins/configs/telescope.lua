local present, telescope = pcall(require, "telescope")

if not present then
    return
end

local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },
    pickers = {
        lsp_references = {
            show_line = false
        },
        lsp_definitions = {
            show_line = false
        },
        lsp_type_definitions = {
            show_line = false
        },
        lsp_implementations = {
            show_line = false
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- override default mappings
            -- default_mappings = {},
            mappings = { -- extend mappings
                i = {
                    ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                }
            }
        }
    },
    extensions_list = { "fzf", "live_grep_args", "dap" },
}

telescope.setup(options)

-- load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)
