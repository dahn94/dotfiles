#!/bin/sh
# Instala os dotfiles: config do Neovim (LazyVim) + dependências.
#
# Uso:  ./install.sh            # instala dependências e linka a config
#       ./install.sh --config   # só linka a config, sem instalar pacotes
set -eu

DOTFILES="$(cd "$(dirname "$0")" && pwd -P)"
NVIM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

info() { printf '==> %s\n' "$*"; }

install_deps() {
  case "$(uname -s)" in
    FreeBSD)
      # O Mason não tem binários para FreeBSD: as ferramentas nativas vêm do pkg
      # (veja nvim/lua/plugins/freebsd.lua). npm, python3 e bash são usados pelo
      # Mason para pyright, yaml-language-server, erlang-ls etc.
      sudo pkg install -y \
        neovim git curl ripgrep fd-find fzf lazygit tree-sitter-cli \
        node24 npm-node24 python3 py312-pip bash \
        lua-language-server stylua shfmt hs-ShellCheck \
        ruff py312-sqlfluff tflint terraform-ls \
        elixir erlang rebar3
      ;;
    Darwin)
      command -v brew >/dev/null || { echo "instale o Homebrew primeiro" >&2; exit 1; }
      brew install neovim git ripgrep fd fzf lazygit tree-sitter-cli node python
      ;;
    Linux)
      command -v apt-get >/dev/null || { echo "só apt é suportado no Linux" >&2; exit 1; }
      sudo apt-get update
      sudo apt-get install -y neovim git curl ripgrep fd-find fzf nodejs npm python3 python3-venv build-essential unzip
      ;;
    *)
      echo "sistema não suportado: $(uname -s)" >&2; exit 1 ;;
  esac
}

link_config() {
  if [ -L "$NVIM_DIR" ] && [ "$(readlink "$NVIM_DIR")" = "$DOTFILES/nvim" ]; then
    info "$NVIM_DIR já aponta para $DOTFILES/nvim"
    return
  fi
  if [ -e "$NVIM_DIR" ] || [ -L "$NVIM_DIR" ]; then
    backup="$NVIM_DIR.bak.$(date +%Y%m%d%H%M%S)"
    info "Movendo a config atual para $backup"
    mv "$NVIM_DIR" "$backup"
  fi
  mkdir -p "$(dirname "$NVIM_DIR")"
  ln -s "$DOTFILES/nvim" "$NVIM_DIR"
  info "Linkado $NVIM_DIR -> $DOTFILES/nvim"
}

case "${1:-}" in
  "") install_deps; link_config ;;
  --config) link_config ;;
  *) echo "uso: $0 [--config]" >&2; exit 1 ;;
esac

info "Instalando plugins (lazy.nvim)"
nvim --headless "+Lazy! restore" +qa
info "Pronto. Abra o nvim; o Mason instala os servidores de linguagem na primeira vez."
