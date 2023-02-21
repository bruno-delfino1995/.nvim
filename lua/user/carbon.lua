local status_ok, carbon = pcall(require, "carbon")
if not status_ok then
	return
end

carbon.setup({
	auto_open = false
})
