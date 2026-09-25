# Neovim: guia rápido

Config: LazyVim (`~/.dotfiles/nvim`). A **tecla líder é o Espaço**:
`<Space>ff` = aperte Espaço, depois `f`, depois `f`.

> **Dica principal:** aperte **Espaço e espere 1 segundo**. Aparece um menu com
> todos os atalhos. Funciona também com `g`, `]`, `[`, `<Space>c` etc.
> Lista completa: <https://www.lazyvim.org/keymaps>

## Básico do Vim

| Tecla | O que faz |
|---|---|
| `i` / `a` | Inserir antes / depois do cursor |
| `o` / `O` | Nova linha abaixo / acima, já inserindo |
| `Esc` | Volta ao modo normal |
| `v` / `V` | Selecionar por caractere / por linha |
| `u` / `Ctrl+r` | Desfazer / refazer |
| `dd` / `yy` / `p` | Recortar linha / copiar linha / colar |
| `w` / `b` | Próxima / anterior palavra |
| `gg` / `G` | Início / fim do arquivo |
| `Ctrl+s` | Salvar |
| `<Space>qq` | Sair de tudo |

## Arquivos e busca

| Tecla | O que faz |
|---|---|
| `<Space><Space>` | Procurar arquivo pelo nome |
| `<Space>/` | Procurar **texto** no projeto inteiro |
| `<Space>fr` | Arquivos recentes |
| `<Space>e` | Árvore de arquivos na lateral |
| `<Space>sr` | Buscar e substituir no projeto |
| `/texto` | Procurar no arquivo atual (`n` = próximo, `N` = anterior) |
| `s` + 2 letras | Pular para qualquer lugar visível da tela |

## Arquivos abertos e janelas

| Tecla | O que faz |
|---|---|
| `H` / `L` | Arquivo aberto anterior / próximo (as "abas" do topo) |
| `<Space>,` | Lista dos arquivos abertos |
| `<Space>bd` | Fechar o arquivo atual |
| `<Space>\|` / `<Space>-` | Dividir a tela na vertical / na horizontal |
| `Ctrl+h/j/k/l` | Mover entre as divisões da tela |
| `Ctrl+/` | Abrir ou fechar um terminal flutuante (bom para `iex` e `mix test`) |

## Programação (LSP)

Funciona em Elixir, Python, Lua, YAML, Terraform etc.

| Tecla | O que faz |
|---|---|
| `K` | Documentação do que está sob o cursor |
| `gd` | Ir para a definição |
| `gr` | Onde aquilo é usado |
| `Ctrl+o` | Voltar para onde você estava |
| `<Space>ca` | Ações de código (correções sugeridas) |
| `<Space>cr` | Renomear em todo o projeto |
| `<Space>cf` | Formatar o arquivo |
| `]d` / `[d` | Próximo / anterior erro ou aviso |
| `<Space>cd` | Mostrar o erro da linha atual |
| `<Space>xx` | Lista de todos os erros |
| `gcc` / `gc` | Comentar a linha / a seleção |
| `F4` | Remover espaços no fim das linhas |

No autocompletar: `Ctrl+n` / `Ctrl+p` navegam entre as opções e `Enter` aceita.

## Git

| Tecla | O que faz |
|---|---|
| `<Space>gg` | lazygit (commit, push, diff, tudo visual) |
| `]h` / `[h` | Próxima / anterior mudança no arquivo |
| `<Space>gb` | Quem alterou esta linha (blame) |

## Claude Code (só no Mac)

| Tecla | O que faz |
|---|---|
| `<Space>ac` | Abrir ou fechar o Claude |
| `<Space>as` | Enviar a seleção para o Claude |
| `<Space>aa` / `<Space>ad` | Aceitar / recusar a alteração proposta |

## Manutenção

| Comando | O que faz |
|---|---|
| `:Lazy` | Plugins (`U` atualiza) |
| `:Mason` | Servidores de linguagem |
| `:LazyExtras` | Ligar ou desligar suporte a linguagens |
| `:checkhealth` | Diagnóstico quando algo não funciona |
