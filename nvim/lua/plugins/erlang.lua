-- O nvim-lspconfig removeu a config "erlangls", mas o extra lang.erlang do LazyVim
-- ainda a usa; sem isto o servidor falha com "cmd: expected ... got nil".
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        erlangls = {
          cmd = { "erlang_ls" },
          filetypes = { "erlang" },
          root_markers = { "rebar.config", "erlang.mk", ".git" },
        },
      },
    },
  },
}
