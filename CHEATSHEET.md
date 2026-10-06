# 📖 Complete Neovim & Terminal Cheat Sheet

Every single command, keybinding, and shortcut in your setup — with exact instructions on **how to open** and **how to close** each window, panel, and feature.

---

## 📑 Table of Contents
1. [General: Save, Quit & Close Everything](#1-general-save-quit--close-everything)
2. [Panels & Sidebars: How to Open & Close](#2-panels--sidebars-how-to-open--close)
3. [Running & Executing Code](#3-running--executing-code)
4. [Formatting Code (VS Code Style)](#4-formatting-code-vs-code-style)
5. [Search & Jump (Telescope & Flash)](#5-search--jump-telescope--flash)
6. [Window Splits & Navigation](#6-window-splits--navigation)
7. [Tabs & Buffers](#7-tabs--buffers)
8. [Git & LazyGit](#8-git--lazygit)
9. [Terminal in Neovim & Terminal CLI](#9-terminal-in-neovim--terminal-cli)
10. [Editing Tricks & Registers](#10-editing-tricks--registers)
11. [Troubleshooting & Fixes](#11-troubleshooting--fixes)

---

## 1. General: Save, Quit & Close Everything

| Command | Action |
| :--- | :--- |
| `:w` | **Save** current file |
| `:q` | **Close** current window / panel |
| `:q!` | **Force close** without saving changes |
| `:wq` or `:x` | **Save and exit** current file |
| `:qa!` | **Force close all windows** and completely exit Neovim |
| `<C-w> c` | **Close** currently focused split / window |
| `<C-w> o` (or `:only`) | **Close ALL other splits**, keeping only active window |

---

## 2. Panels & Sidebars: How to Open & Close

Every panel in your setup has a simple toggle key:

### 🗂️ File Manager Sidebar (`NvimTree`)
| Action | Key |
| :--- | :--- |
| **Open / Close (Toggle)** | **`<Space> e`** or **`Ctrl + b`** |
| **Close from inside** | Press **`q`** |
| **Locate active file in tree** | **`<Space> f e`** |
| *Inside tree:* Open file | `Enter` or `o` |
| *Inside tree:* Add new file/folder | `a` *(type `file.py` or `folder/`)* |
| *Inside tree:* Move to Trash | `d` *(confirms before moving to Trash)* |
| *Inside tree:* Rename | `r` |
| *Inside tree:* Cut / Copy / Paste | `x` / `c` / `p` |
| *Inside tree:* Toggle hidden files | `H` *(Shift + h)* |
| *Inside tree:* Collapse all folders | `W` *(Shift + w)* |

---

### 📜 Code Outline & Function List (`Aerial`)
| Action | Key |
| :--- | :--- |
| **Open / Close (Toggle)** | **`<Space> o`** *(or `<Space> c o`)* |
| **Close from inside** | Press **`q`** |
| **Floating Symbol Navigator** | **`<Space> O`** *(Shift + o)* |
| *Inside outline:* Jump to function | `Enter` |
| *Inside outline:* Browse symbols | `j` (down), `k` (up) |

---

### 🕒 Undotree (Visual Time Machine)
| Action | Key |
| :--- | :--- |
| **Open / Close (Toggle)** | **`<Space> u`** |
| **Close from inside** | Press **`q`** |
| *Inside tree:* Browse timeline | `j` (down), `k` (up) |
| *Inside tree:* Revert to past state | `Enter` |

---

### 🔍 Telescope File Browser (Floating Popup)
| Action | Key |
| :--- | :--- |
| **Open** | **`s f`** |
| **Close** | Press **`Esc`** or **`q`** |
| *Inside popup:* Move to Trash | `d` *(then `y` to confirm)* |
| *Inside popup:* Create new file | `N` |
| *Inside popup:* Go up to parent folder | `h` |

---

### 🧘 Zen Mode (Distraction-Free)
| Action | Key |
| :--- | :--- |
| **Turn ON / OFF (Toggle)** | **`<Space> z`** |

---

## 3. Running & Executing Code

Execute C++, Python, JavaScript, Rust, Bash, and Fish directly inside Neovim:

| Key | Action | How to Close |
| :--- | :--- | :--- |
| **`F5`** | **Save & Run Code** in split window | Press **`<Space> r q`** or click split and press **`q`** |
| **`<Space> r r`** | Same as `F5` (Save & Run) | Press **`<Space> r q`** |
| **`<Space> r f`** | Run current file directly | Press **`<Space> r q`** |
| **`<Space> r q`** | **Close the Code Runner window** | — |
| **`<Space> r c`** | Alternative: Close Runner window | — |

---

## 4. Formatting Code (VS Code Style)

Auto-arranges messy code into clean, indented structure (4 spaces for C++/Python, 2 for web):

| Key | Action |
| :--- | :--- |
| **`:w`** | **Automatic Format on Save** (happens whenever you save) |
| **`Alt + Shift + F`** | **Format Document** *(exact VS Code shortcut)* |
| **`<Space> c f`** | Format Document (Neovim shortcut) |
| **`:Format`** or **`:LazyFormat`** | Command-mode formatting |

---

## 5. Search & Jump (Telescope & Flash)

### ⚡ Flash.nvim (Cursor Teleportation)
| Action | Key |
| :--- | :--- |
| **Teleport Cursor** | Press **`s`** (or `<Space> j`), type 2 letters, press jump key |
| **Cancel Jump** | Press **`Esc`** |
| **Select Code Block / Treesitter** | Press **`S`** *(Shift + s)* |

### 🔭 Telescope Project Search
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Find File by Name** | **`; f`** | Press **`Esc`** |
| **Search Text Everywhere (Live Grep)** | **`; r`** | Press **`Esc`** |
| **List Open Buffers / Files** | **`\\`** *(two backslashes)* | Press **`Esc`** |
| **List Code Errors & Diagnostics** | **`; e`** | Press **`Esc`** |
| **Search Treesitter Symbols** | **`; s`** | Press **`Esc`** |
| **Search Neovim Help Docs** | **`; t`** | Press **`Esc`** |
| **Resume Previous Search** | **`; ;`** | Press **`Esc`** |

---

## 6. Window Splits & Navigation

Split your screen into multiple panes and move between them:

| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Split Horizontally** | **`s s`** | Type `:q` or `<C-w>c` |
| **Split Vertically** | **`s v`** | Type `:q` or `<C-w>c` |
| **Move Left** | **`s h`** | — |
| **Move Right** | **`s l`** | — |
| **Move Down** | **`s j`** | — |
| **Move Up** | **`s k`** | — |
| **Close Active Split** | **`<C-w> c`** or **`:q`** | — |
| **Close All Splits Except Active** | **`:only`** or **`<C-w> o`** | — |

---

## 7. Tabs & Buffers

| Key | Action | How to Close |
| :--- | :--- | :--- |
| **`t e`** | Create **New Tab** | Type `:tabclose` |
| **`Tab`** | Next Tab | — |
| **`Shift + Tab`** | Previous Tab | — |
| **`:tabclose`** | **Close current tab** | — |
| **`<Space> b d`** | **Close/delete current buffer** without closing split | — |

---

## 8. Git & LazyGit

### Inside Neovim:
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Open LazyGit TUI** | **`<Space> g g`** | Press **`q`** |
| *Inside LazyGit:* Stage file | `Space` | — |
| *Inside LazyGit:* Stage all files | `a` | — |
| *Inside LazyGit:* Commit | `c` *(type message + Enter)* | — |
| *Inside LazyGit:* Push to GitHub | `P` *(Shift + p)* | — |
| *Inside LazyGit:* Discard / Undo delete | `d` | — |
| *Inside LazyGit:* **Quit LazyGit** | **`q`** | Returns directly to code |

### In Terminal (Fish or Bash):
| Command | Action |
| :--- | :--- |
| `gp "commit message"` | **One-command:** Stages all files, commits, and pushes to GitHub |
| `lg` | Opens LazyGit visual interface in terminal *(press `q` to exit)* |

---

## 9. Terminal in Neovim & Terminal CLI

### Embedded Terminal Splits (`ToggleTerm`):
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Toggle Terminal (Open / Close)** | **`Ctrl + \`** | Press **`Ctrl + \`** again or type `exit` |
| **Bottom Split Terminal** | **`<Space> t t`** | Press `Ctrl + \` or type `exit` |
| **Right Vertical Terminal** | **`<Space> t v`** | Press `Ctrl + \` or type `exit` |
| **Floating Terminal** | **`<Space> t f`** | Press `Ctrl + \` or type `exit` |

### Terminal CLI (Zoxide Navigation):
| Command | Action |
| :--- | :--- |
| `z <name>` | Jump to frequent folder *(e.g. `z py`, `z cpp`, `z garden`, `z nvim`)* |
| `zi` | Interactive search menu *(select with arrows + Enter, `Esc` to cancel)* |
| `source ~/.bashrc` | Reload Bash configuration |

---

## 10. Editing Tricks & Registers

| Key | Action |
| :--- | :--- |
| **`Ctrl + a`** | **Select entire file** (all lines) |
| **`+`** / **`-`** | Increment / Decrement number under cursor |
| **`d w`** | Delete word backwards |
| **`<Space> p`** | Paste without overwriting your clipboard register |
| **`<Space> o`** | Open line below and stay in Normal mode |
| **`<Space> O`** | Open line above and stay in Normal mode |
| **`x`** | Delete character without polluting clipboard |
| **`Ctrl + z`** or **`u`** | **Undo** (works in Normal & Insert mode) |
| **`Ctrl + y`**, **`Ctrl + Shift + z`**, or **`U`** | **Redo** (works in Normal & Insert mode) |
| **`Ctrl + r`** | Redo (classic Vim) |
| **`<Space> u`** | **Visual Undotree** (explore full history timeline) |

---

## 11. Troubleshooting & Fixes

### 🔒 Removing the Lock Icon:
If a file displays a lock icon (opened Read-Only):
```vim
:set noreadonly
```
*(or `:set noro`)* and hit Enter.

### ♻️ Restoring an Accidentally Deleted File:
1. **If buffer is still open in Neovim:** Just type `:w` and press Enter.
2. **If tracked in Git:** Run `:!git restore <filename>` or press `<Space>gg` $\to$ hover file $\to$ press `d`.
3. **From Linux Trash Bin:** Open `~/.local/share/Trash/files/` or check desktop Trash.

---

*Cheat sheet maintained for [xnocode/nvim](https://github.com/xnocode/nvim).*

---

## 12. 🏷️ TODO Comments & Bug Tracker (`todo-comments`)

Highlights comments like `// TODO:`, `// FIXME:`, `// BUG:`, `// NOTE:` in glowing neon colors:

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> s t`** | **Search All TODOs across Project** (Telescope) | Press **`Esc`** |
| **`<Space> x t`** | Open **TODO Drawer** at bottom (Trouble) | Press **`q`** |
| **`] t`** | Jump to **Next TODO** in file | — |
| **`[ t`** | Jump to **Previous TODO** in file | — |

---

## 13. 🏆 Competitive Programming & Test Runner (`CompetiTest`)
*For Codeforces, AtCoder, CSES, and general competitive programming.*

Automatically compiles your code, runs all test cases, and opens a split screen showing:
- 🟩 **Passed (AC)** with execution time in ms
- 🟥 **Wrong Answer (WA)** with side-by-side diff between Expected Output and Your Output
- ⏱️ **Time Limit Exceeded (TLE)** / Runtime Error

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> t r`** | **Run All Test Cases** (Visual popup with diffs) | Press **`q`** or **`Esc`** |
| **`<Space> t s`** | **Submit to Codeforces** (Auto-submits in your Chrome tab) | — |
| **`<Space> a s`** | **Submit to AtCoder** (Submits via official `acc submit`) | Press **`q`** |
| **`<Space> t a`** | **Add Custom Test Case** (manually enter input & output) | Press **`Esc`** |
| **`<Space> t e`** | **Edit an Existing Test Case** | Press **`Esc`** |
| **`<Space> t d`** | **Delete a Test Case** | Press **`Esc`** |
| **`<Space> t p`** | **Receive Problem from Browser** (via Competitive Companion) | — |
| **`<Space> t c`** | **Receive Entire Contest from Browser** | — |
| **`<Space> t u`** | **Toggle Test Results UI** | Press **`q`** |

---

## 14. 🟡 LeetCode Inside Neovim (`leetcode.nvim`)
*Solve LeetCode problems directly from Neovim.*

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> L`** | **Open LeetCode Dashboard** (`:Leet`) | Press `<Space> l q` |
| **`<Space> l t`** | **Run Test Cases** on current problem (`:Leet test`) | Press `q` |
| **`<Space> l s`** | **Submit Solution** to LeetCode (`:Leet submit`) | Press `q` |
| **`<Space> l d`** | Show Problem Description (`:Leet desc`) | Press `q` |
| **`<Space> l l`** | List All Problems (`:Leet list`) | Press `Esc` |
| **`<Space> l r`** | Pick Random Problem (`:Leet random`) | — |
| **`<Space> l q`** | **Exit LeetCode Session** (`:Leet exit`) | — |
