# NEOVIM SHORTCUTS

## NAVIGATION

| Mode | Key        | Action                          |
| ---- | ---------- | ------------------------------- |
| (n)  | `h`        | Move cursor left                |
| (n)  | `l`        | Move cursor right               |
| (n)  | `j`        | Move cursor below               |
| (n)  | `k`        | Move cursor up                  |
| (n)  | `w`        | Bring cursor to next word head  |
| (n)  | `e`        | Bring cursor to end of word     |
| (n)  | `gg`       | Go to start of file             |
| (n)  | `G`        | Go to end of file               |
| (n)  | `{`        | Go to start of paragraph        |
| (n)  | `}`        | Go to end of paragraph          |
| (n)  | `0`        | Go to start of line             |
| (n)  | `^`        | Go to first non-blank character |
| (n)  | `$`        | Go to end of line               |
| (n)  | `Ctrl + u` | Move up half page               |
| (n)  | `Ctrl + d` | Move down half page             |
| (n)  | `Ctrl + b` | Move one page up                |
| (n)  | `Ctrl + f` | Move one page down              |

## EDITING

| Mode | Key        | Action                            |
| ---- | ---------- | --------------------------------- |
| (n)  | `x`        | Delete character after cursor     |
| (n)  | `dw`       | Delete to word end                |
| (n)  | `diw`      | Delete whole word                 |
| (n)  | `dd`       | Delete entire line                |
| (n)  | `D`        | Delete from cursor to end of line |
| (n)  | `u`        | Undo                              |
| (n)  | `Ctrl + r` | Redo                              |
| (n)  | `>>`       | Indent right                      |
| (n)  | `<<`       | Indent left                       |
| (n)  | `~`        | Toggle case                       |
| (n)  | `.`        | Repeat last action                |
| (n)  | `viw`      | Select inside word                |
| (n)  | `ciw`      | Change inside word                |
| (n)  | `cw`       | Change word (partial)             |
| (n)  | `caw`      | Change entire word                |

## VISUAL MODE

| Mode | Key | Action              |
| ---- | --- | ------------------- |
| (v)  | `v` | Start visual mode   |
| (v)  | `V` | Select whole line   |
| (v)  | `y` | Yank (copy)         |
| (v)  | `p` | Paste               |
| (v)  | `P` | Paste before cursor |

---

## PLUGINS CONFIGURATION

### nvim-treesitter

| Mode | Key                    | Action                |
| ---- | ---------------------- | --------------------- |
| (v)  | `Ctrl + Shift + Space` | Incremental selection |
| (v)  | `Backspace`            | Decremental selection |

### vim-maximizer

| Mode | Key        | Action                         |
| ---- | ---------- | ------------------------------ |
| (n)  | `Ctrl + M` | Maximize/minimize split window |

### mason, mason-lspconfig, nvim-lspconfig

| Mode | Key           | Action                      |
| ---- | ------------- | --------------------------- |
| (n)  | `Leader + ch` | Show code hover information |
| (n)  | `Leader + cd` | Go to code definition       |
| (n)  | `Leader + cr` | Show code references        |
| (n)  | `Leader + ca` | Show code actions           |

### substitute.nvim

| Mode | Key     | Action                           |
| ---- | ------- | -------------------------------- |
| (n)  | `s + e` | Change word until end            |
| (n)  | `s + 0` | Change word from start of line   |
| (n)  | `s + G` | Change word until end of file    |
| (n)  | `s + h` | Change word to add before cursor |
| (n)  | `s + j` | Change word to add below cursor  |
| (n)  | `s + k` | Change word to add above cursor  |
| (n)  | `s + w` | Change until next word           |
| (n)  | `s + $` | Change until end of line         |
| (n)  | `s + %` | Change inside brackets/braces    |

### nvim-surround

| Mode | Key                     | Action                           |
| ---- | ----------------------- | -------------------------------- |
| (n)  | `ysiw + character`      | Surround word with a character   |
| (n)  | `yss + character`       | Surround line with a character   |
| (n)  | `ds + character`        | Delete surrounding character     |
| (n)  | `cs + character`        | Change surrounding character     |
| (n)  | `cs + character + text` | Change surrounding with new text |

### vim-fugitive

| Mode | Key            | Action                      |
| ---- | -------------- | --------------------------- |
| (n)  | `Leader + gs`  | Open Git status window      |
| (n)  | `Leader + gd`  | Show Git diff               |
| (n)  | `Leader + gaa` | Stage all files             |
| (n)  | `Leader + ga`  | Stage current file          |
| (n)  | `Leader + gc`  | Commit changes with message |

| Fugitive Shortcuts                      |
| --------------------------------------- |
| `-` : Stage/unstage current file        |
| `cc` : Commit changes                   |
| `s` : Stage the current file            |
| `u` : Unstage the current file          |
| `X` : Discard changes                   |
| `=` : View file differences             |
| `ZZ` : Save and exit the commit message |
