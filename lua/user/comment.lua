local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
	return
end

local status_ok, ctx_comment = pcall(require, "ts_context_commentstring.internal")
if not status_ok then
	return
end

comment.setup({
	hook = function()
		ctx_comment.update_commentstring()
	end,
})
