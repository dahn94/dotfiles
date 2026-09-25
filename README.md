# dotfiles
My personal dotfiles

## Neovim

Config baseada no [LazyVim](https://www.lazyvim.org), com os extras de Elixir,
Erlang, Python, SQL, Terraform, TOML, YAML, Git e Claude Code (`nvim/lazyvim.json`).

```sh
git clone https://github.com/dahn94/dotfiles ~/dotfiles
~/dotfiles/install.sh            # dependências + link ~/.config/nvim -> ~/dotfiles/nvim
~/dotfiles/install.sh --config   # só o link
```

Funciona em FreeBSD (`pkg`), macOS (`brew`) e Debian/Ubuntu (`apt`).
No FreeBSD, as ferramentas nativas (lua-language-server, stylua, shfmt, ruff,
tflint, terraform-ls, sqlfluff) vêm do `pkg`, porque o Mason não tem binários
para essa plataforma — veja `nvim/lua/plugins/freebsd.lua`.

## Scripts (`bin/`)

No macOS o `install.sh` linka cada script de `bin/` em `~/bin`.

- `fbsd`: cria e gerencia VMs FreeBSD arm64 com QEMU + HVF em Macs Apple Silicon.
  A VM compartilha `/Users/Shared/NOME` do Mac em `~/shared`. Veja `fbsd help`.

## Atalhos

Atalhos extras além dos padrões do LazyVim:

| Tecla | Ação |
|-------|------|
| `F4`  | Remove espaços no fim das linhas |

O `vimrc` antigo (vim-plug, NERDTree, coc.nvim) continua no histórico do git.
