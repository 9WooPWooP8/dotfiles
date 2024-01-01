local null_ls_status_ok, null_ls = pcall(require, "scrollbar")
if not null_ls_status_ok then
        return
end

null_ls.setup()
