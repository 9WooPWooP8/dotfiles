local null_ls_status_ok, breadcrumbs = pcall(require, "breadcrumbs")
if not null_ls_status_ok then
	return
end

breadcrumbs.setup()
