-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.wrap = true
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.lualine.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.project.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.auto_resize = true
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.terminal.size = 10

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.lang.javascript.formatters = { { exe = "prettier" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

lvim.lang.json.formatters = { { exe = 'prettier' } }

lvim.lang.python.formatters = { { exe = "black" } }
lvim.lang.python.linters = { { exe = "flake8" } }

lvim.lang.rust.formatters = { { exe = "rustfmt" } }

lvim.lang.typescript.formatters = { { exe = "eslint"}, { exe = "prettier" } }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters
lvim.lang.typescript.linters = { { exe = "eslint" } }
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters

-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {
      "folke/tokyonight.nvim",
      config = function()
        vim.g.tokyonight_style =  "night"
        vim.cmd[[colorscheme tokyonight]]
      end
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "pwntester/octo.nvim",
      event = "BufRead",
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
}

