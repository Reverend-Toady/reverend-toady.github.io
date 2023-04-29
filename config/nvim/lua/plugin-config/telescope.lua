require("telescope").setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
    --- other configs
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      cwd_to_path = true;
      grouped = true;
      hidded = true;
      git_stats = true;
    },
  },
}

require("telescope").load_extension "file_browser"
