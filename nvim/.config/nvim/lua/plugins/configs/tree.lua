return {
    filters = {
        dotfiles = false
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      update_root = true,
      ignore_list = {}
    },
    view = {
        adaptive_size = true,
        side = "left",
        width = 100,
        preserve_window_proportions = false
    },
    git = {
        enable = false,
        ignore = true
    },
    filesystem_watchers = {
        enable = false
    },
    actions = {
        open_file = {
            resize_window = true
        }
    },
    renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",

        indent_markers = {
            enable = false
        },

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false
            },

            glyphs = {
                default = "󰈚",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
            }
        }
    }
}
