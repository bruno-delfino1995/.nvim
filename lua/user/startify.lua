vim.g.startify_session_dir="~/wksp"
vim.g.startify_session_autoload=1
vim.g.startify_session_number=5
vim.g.startify_session_persistence=1
vim.g.startify_session_sort=1
vim.g.startify_change_to_vcs_root=1
vim.g.startify_custom_header="startify#pad(startify#fortune#boxed())"
vim.g.startify_lists={
	{ type = "bookmarks", header = { "   Bookmarks"    } },
	{ type = "sessions",  header = { "   Sessions"     } },
	{ type = "files",     header = { "   Recent Files" } },
}
vim.g.startify_bookmarks = {
	{ c = "~/proj/machine" }
}
