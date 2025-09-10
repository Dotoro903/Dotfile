local M = {}
local jobid = nil

function M.start()
  if jobid then print("Live server already running") return end
  local cmd = {
    "bash","-lc",
    'browser-sync start --server --files "**/*.{html,css,js}" --port 5500 --no-ui --no-open'
  }
  jobid = vim.fn.jobstart(cmd, { detach = true })
  vim.g.live_server_jobid = jobid
  vim.fn.jobstart({"bash","-lc","xdg-open http://localhost:5500 >/dev/null 2>&1 || true"})
  print("Live server: http://localhost:5500")
end

function M.stop()
  if jobid then
    vim.fn.jobstop(jobid)
    jobid = nil
    print("Live server stopped")
  else
    print("No live server running")
  end
end

return M

