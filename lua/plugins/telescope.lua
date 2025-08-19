return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "󰍉 ",
          selection_caret = "▶ ",
          path_display = { "truncate" },
          color_devicons = true,
          file_ignore_patterns = {
            "**/*.exe",
            "**/.DS_Store",
            "**/.astro/",
            "**/.cache/**",
            "**/.git",
            "**/.git/**",
            "**/.idea/**",
            "**/.mvn",
            "**/.mypy_cache/**",
            "**/.netlify/",
            "**/.next/**",
            "**/.nuxt/**",
            "**/.pytest_cache/**",
            "**/.venv",
            "**/.venv/**",
            "**/.vscode/**",
            "**/__pycache__",
            "**/__pycache__/**",
            "**/build",
            "**/build/**",
            "**/dist/",
            "**/dist/**",
            "**/env",
            "**/env/**",
            "**/node_modules",
            "**/node_modules/**",
            "**/package-lock.json",
            "**/pnpm-lock.yaml",
            "**/target",
            "**/venv",
            "**/venv/**",
            "**/yarn.lock",
          },
          layout_config = {
            horizontal = {
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
          mappings = {
            i = {},
            n = {},
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
            prompt_title = " 󰈞 Find Files",
            results_title = "Files",
          },
          live_grep = {
            theme = "ivy",
            prompt_title = " 󰍉 Live Grep",
            results_title = "Grep Results",
          },
          grep_string = {
            prompt_title = " 󰍉 Grep String",
            results_title = "String Results",
          },
        },
      })
    end,
  },
}
