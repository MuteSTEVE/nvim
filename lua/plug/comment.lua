local PLUG = {
  'terrortylor/nvim-comment',
  lazy = true,
  event = { "BufReadPost", "BufNewFile" }
}

function PLUG.config()
  local comment_ok, comment = pcall(require, 'nvim_comment')
  if not comment_ok then
    return
  end

  comment.setup({
    comment_empty = false,
    line_mapping = "gc",
    operator_mapping = "gc",
    comment_chunk_text_object = "ic"
  })
end

return PLUG
