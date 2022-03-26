local config = {}

function config.wilder()
  vim.cmd [[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)

let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'border': 'rounded',
      \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
      \ 'highlighter': wilder#lua_fzy_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'left': [
      \   ' ',
      \   wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ',
      \   wilder#popupmenu_scrollbar(),
      \ ],
      \ }))

let s:wildmenu_renderer = wilder#wildmenu_renderer({
      \ 'highlighter': wilder#lua_fzy_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'separator': ' · ',
      \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
      \ 'right': [' ', wilder#wildmenu_index()],
      \ })

call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': s:popupmenu_renderer,
      \ '/': s:wildmenu_renderer,
      \ 'substitute': s:wildmenu_renderer,
      \ }))
]]
end

function config.null_ls()
  local null_ls = require "null-ls"
  local b = null_ls.builtins

  local sources = {
    b.formatting.stylua.with { extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" } },
    b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
  }

  null_ls.setup {
    debug = true,
    sources = sources,
    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
      end
    end,
  }
end

function config.neogit()
  local neogit = require "neogit"
  neogit.setup {
    kind = "split",
    integrations = {
      diffview = true,
    },
  }
end

return config
