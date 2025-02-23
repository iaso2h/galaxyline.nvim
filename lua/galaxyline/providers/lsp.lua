local get_lsp_client = function(msg)
  msg = msg or "No Active Lsp"
  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return msg
  end

  local client_names = ""
  for _, client in pairs(clients) do
    if string.len(client_names) < 1 then
      client_names = client_names .. client.name
    else
      client_names = client_names .. ", " .. client.name
    end
  end
  return string.len(client_names) > 0 and client_names or msg
end

return {
  get_lsp_client = get_lsp_client,
}
