# Neovim Keybinds

Leader is `<Space>`. Modes: **n** normal, **v** visual, **t** terminal, **i** insert.
Press `<leader>fk` to search all live keymaps in Telescope.

## Buffers
| Key | Mode | Action |
|---|---|---|
| `<Tab>` / `<S-Tab>` | n | Next / previous buffer |
| `<leader>bn` / `<leader>bp` | n | Next / previous buffer |
| `<leader>bb` or `<leader>\`` | n | Switch to the alternate (last) buffer |
| `<leader>bd` | n | Delete buffer |
| `<leader>w` | n | Save, then close the buffer |

## Windows & panes
| Key | Mode | Action |
|---|---|---|
| `<C-h/j/k/l>` | n | Move between splits / tmux panes (vim-tmux-navigator) |
| `<C-h/j/k/l>` | t | Move between windows from a terminal |
| `<leader>\|` | n | Vertical split |
| `<leader>-` | n | Horizontal split |
| `<leader>sm` | n | Maximise / restore window |

## File tree (nvim-tree)
| Key | Mode | Action |
|---|---|---|
| `<leader>,` | n | Toggle tree |
| `<leader>m` | n | Focus tree |

## Scrolling & misc
| Key | Mode | Action |
|---|---|---|
| `<C-d>` / `<C-u>` | n | Half-page down / up, cursor centred |
| `<leader>pa` | n | Echo full path of current file |

## Comments (Comment.nvim)
| Key | Mode | Action |
|---|---|---|
| `gtc` / `gtb` | n | Toggle line / block comment on current line |
| `goc` / `gob` | n/v | Line / block comment operator (e.g. `goc3j`; in visual, acts on selection) |
| `<C-/>` | n | Toggle line comment (alias for `gtc`) |
| `<C-/>` | v | Comment selection (alias for `goc`) |

## Folding (nvim-ufo)
| Key | Mode | Action |
|---|---|---|
| `<leader>z` / `<leader>Z` | n | Toggle fold / toggle recursively |
| `<leader>zo` / `<leader>zO` | n | Open fold / open recursively |
| `<leader>zc` / `<leader>zC` | n | Close fold / close recursively |
| `zR` / `zM` | n | Open / close all folds |
| `zr` / `zm` | n | Open folds except kinds / close folds with level |
| `z0`–`z4` | n | Close all folds at level 0–4 and deeper |
| `K` | n | Peek folded lines under cursor (falls back to LSP hover) |

## LSP (active only in buffers with an attached server)
| Key | Mode | Action |
|---|---|---|
| `K` | n | Hover docs (Lspsaga) |
| `<leader>fd` | n | Lspsaga finder (definition / references) |
| `<leader>gd` | n | Peek definition |
| `<leader>gD` | n | Go to definition |
| `<leader>ca` | n | Code actions |
| `<leader>rn` | n | Rename symbol |
| `<leader>d` | n | Diagnostics at cursor |
| `<leader>D` | n | Diagnostics on line |
| `<leader>pd` / `<leader>nd` | n | Previous / next diagnostic |

## Telescope
| Key | Mode | Action |
|---|---|---|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | Buffers |
| `<leader>fl` | n | LSP document symbols |
| `<leader>ft` | n | Help tags |
| `<leader>fk` | n | Keymaps |
| `<leader>fh` | n | Harpoon list in Telescope |
| `<C-j>` / `<C-k>` | i (in picker) | Next / previous result |

## Harpoon
| Key | Mode | Action |
|---|---|---|
| `<leader>a` | n | Add current file |
| `<leader>hr` | n | Remove current file |
| `<leader>hc` | n | Clear list |
| `<C-e>` | n | Quick menu |
| `<C-H2>` | n | File 1 (see note 4) |
| `<C-t>` / `<C-n>` / `<C-s>` | n | File 2 / 3 / 4 |
| `<leader>hn` / `<leader>hp` | n | Previous / next in list |

## Git
| Key | Mode | Action |
|---|---|---|
| `<leader>gb` | n | Blame (Gitsigns) |
| `<leader>gp` | n | Preview hunk |
| `<leader>gi` | n | Preview hunk inline |
| `<leader>gr` | n | Reset hunk |
| `<leader>do` / `<leader>dc` | n | Open / close Diffview |

## Terminals (toggleterm, floating)
Same key toggles open/closed, in both normal and terminal mode.

| Key | Action |
|---|---|
| `<C-p>` | Python terminal (auto-activates venv) |
| `<C-g>` | `cursor-agent` terminal |
| `<C-q>` | `claude` terminal (no leader, so it toggles from inside Claude Code's text box) |

## Completion (nvim-cmp, insert mode)
| Key | Action |
|---|---|
| `<C-j>` / `<C-k>` | Next / previous suggestion |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Close completion menu |
| `<C-b>` / `<C-f>` | Scroll docs up / down |
| `<CR>` | Confirm selected item |

## Leap (motion)
| Key | Action |
|---|---|
| `s` / `S` | Leap forward / backward (2-char search) |
| `gs` | Leap from other windows |
| `;` / `<Enter>` | Next match |
| `,` / `<Tab>` | Previous match |

## Lspsaga windows
`<C-j>` / `<C-k>` move within the finder window; `<CR>` opens the selection.
