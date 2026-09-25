-- No FreeBSD o Mason não tem binários nativos ("The current platform is unsupported").
-- Essas ferramentas vêm do pkg (veja install.sh); o Mason fica só com o que é
-- npm/pip/código-fonte (pyright, yaml-language-server, elixir-ls, erlang-ls).
if vim.uv.os_uname().sysname ~= "FreeBSD" then
  return {}
end

-- ferramentas instaladas pelo pkg e que o Mason não deve tentar baixar
local from_pkg = { "stylua", "shfmt", "tflint", "sqlfluff", "lua-language-server", "ruff", "terraform-ls", "taplo" }

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return not vim.tbl_contains(from_pkg, tool)
      end, opts.ensure_installed or {})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      for _, server in ipairs({ "lua_ls", "ruff", "terraformls", "taplo" }) do
        if opts.servers[server] ~= nil and opts.servers[server] ~= false then
          local sopts = opts.servers[server] == true and {} or opts.servers[server]
          sopts.mason = false
          -- taplo não tem pacote no FreeBSD: só liga se estiver no PATH (ex.: cargo install taplo-cli)
          local cmd = (vim.lsp.config[server] or {}).cmd
          if type(cmd) == "table" and vim.fn.executable(cmd[1]) == 0 then
            sopts.enabled = false
          end
          opts.servers[server] = sopts
        end
      end
    end,
  },
}
