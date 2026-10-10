# 📖 Complete Neovim & Terminal Cheat Sheet

Every single command, keybinding, and shortcut in your setup — with exact instructions on **how to open**, **how to navigate**, and **how to close** each window, panel, and feature.

---

## 📑 Table of Contents
1. [General: Save, Quit & Close Everything](#1-general-save-quit--close-everything)
2. [Home Dashboard & Quick Return](#2-home-dashboard--quick-return)
3. [File Explorers & File Management](#3-file-explorers--file-management)
4. [Code Outline, Navigation & Context](#4-code-outline-navigation--context)
5. [Search & Jump (Telescope & Flash)](#5-search--jump-telescope--flash)
6. [Window Splits & Resizing](#6-window-splits--resizing)
7. [Tabs & Buffer Management](#7-tabs--buffer-management)
8. [Formatting Code (VS Code Style)](#8-formatting-code-vs-code-style)
9. [Running Code & Interactive REPL](#9-running-code--interactive-repl)
10. [LSP, Definitions & Inlay Hints](#10-lsp-definitions--inlay-hints)
11. [AI Completion (GitHub Copilot)](#11-ai-completion-github-copilot)
12. [Editing Tricks, Smart Increment & Undo](#12-editing-tricks-smart-increment--undo)
13. [TODO Comments & Bug Tracker](#13-todo-comments--bug-tracker)
14. [Git, LazyGit & Quick Commits](#14-git-lazygit--quick-commits)
15. [Competitive Programming Suite (CompetiTest)](#15-competitive-programming-suite-competitest)
16. [LeetCode Integration (leetcode.nvim)](#16-leetcode-integration-leetcodenvim)
17. [Obsidian Vault & Markdown Live Preview](#17-obsidian-vault--markdown-live-preview)
18. [Embedded Terminals & CLI Tools](#18-embedded-terminals--cli-tools)
19. [WakaTime Coding Stats](#19-wakatime-coding-stats)
20. [Troubleshooting & Emergency Fixes](#20-troubleshooting--emergency-fixes)

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

## 2. Home Dashboard & Quick Return

Return to the clean home screen with the ASCII banner and recent files at any moment:

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> h`** | **Go to Home Dashboard** | Press `q` or open any file |
| **`<Space> d`** | **Go to Home Dashboard** (alternative) | Press `q` or open any file |
| `:Home` | Command: Return to Dashboard | Press `q` |
| `:Dashboard` | Command: Return to Dashboard | Press `q` |

---

## 3. File Explorers & File Management

### 🗂️ Snacks File Explorer (with Live Code Preview)
*Opens a top-down tree on the left and a live syntax-highlighted code preview on the right.*

| Action | Key |
| :--- | :--- |
| **Open / Toggle Explorer** | **`<Space> e`** or **`Ctrl + b`** |
| *Inside Explorer:* Navigate files/folders | `j` (down) / `k` (up) |
| *Inside Explorer:* Expand folder / Open file | `Enter` or `l` *(Opens file and closes explorer)* |
| *Inside Explorer:* Collapse folder | `h` |
| *Inside Explorer:* Go up directory | `<Backspace>` |
| *Inside Explorer:* Create new file | `a` |
| *Inside Explorer:* Delete file/folder | `d` *(confirms before moving to Trash)* |
| *Inside Explorer:* Rename file/folder | `r` |
| *Inside Explorer:* Close Explorer | `<Esc>` or `q` |

### 📝 Batch File Renamer (`Oil.nvim`)
*Edits folder contents like a text buffer (batch renaming, cutting/pasting filenames with Vim motions).*

| Action | Key |
| :--- | :--- |
| **Open Parent Folder in Oil** | **`-`** |
| **Open Oil Buffer in Current Folder** | **`<Space> O`** *(Shift + o)* |
| *Inside Oil:* Rename file/folder | Change text directly (`cw` or `ciw`), then type **`:w`** |
| *Inside Oil:* Create new file/folder | Add new line (`o` or `O`), type name (end with `/` for folder), then **`:w`** |
| *Inside Oil:* Delete file/folder | Delete line (`dd`), then **`:w`** *(moves to Trash)* |
| *Inside Oil:* Move file | Cut line (`dd`), navigate to other folder, paste (`p`), then **`:w`** |
| *Inside Oil:* Close Oil | Type **`:bd`** or open any file |

### 🔍 Telescope File Browser
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Open File Browser with Preview** | **`s f`** | Press **`Esc`** or **`q`** |
| *Inside popup:* Move to Trash | `d` *(then `y` to confirm)* | — |
| *Inside popup:* Create new file | `N` | — |
| *Inside popup:* Go up to parent folder | `h` | — |

---

## 4. Code Outline, Navigation & Context

### 📌 Sticky Code Context (`Treesitter-Context`)
*Pins the outer function, class, or JSX component declaration at the top line of your screen while scrolling.*

| Action | Key |
| :--- | :--- |
| **Sticky Header** | Active automatically while scrolling through long files |
| **Jump Up to Enclosing Header** | **`[ c`** *(Teleports cursor directly up to the function declaration)* |

### 📏 Indentation & Scope Readability (`Indent-Blankline`)
*Displays subtle vertical indent guides (`│`) and highlights the active code block your cursor is inside.*

### 📜 Code Outline (`Aerial`)
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Toggle Code Outline Sidebar** | **`<Space> o`** *(or `<Space> c o`)* | Press **`q`** |
| **Floating Symbol Navigator** | **`<Space> O`** *(Shift + o)* | Press **`Esc`** |
| *Inside outline:* Jump to function | `Enter` | — |
| *Inside outline:* Jump in vertical split | `Ctrl + v` | — |
| *Inside outline:* Jump in horizontal split | `Ctrl + s` | — |

### 🧘 Zen Mode (Distraction-Free Focus)
| Action | Key |
| :--- | :--- |
| **Toggle Zen Mode ON / OFF** | **`<Space> z`** |

---

## 5. Search & Jump (Telescope & Flash)

### ⚡ Flash.nvim (Cursor Teleportation)
| Action | Key |
| :--- | :--- |
| **Teleport Cursor Anywhere** | Press **`s`** (or `<Space> j`), type 2 letters, press jump badge |
| **Cancel Jump** | Press **`Esc`** |
| **Select Code Block / Treesitter** | Press **`S`** *(Shift + s)* |
| **Remote Flash Action** | Press **`r`** in operator mode |

### 🔭 Telescope Project Search
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Find File by Name** | **`; f`** | Press **`Esc`** |
| **Search Text Everywhere (Live Grep)** | **`; r`** | Press **`Esc`** |
| **List Open Buffers / Files** | **`\`** *(two backslashes)* | Press **`Esc`** |
| **List Code Errors & Diagnostics** | **`; e`** | Press **`Esc`** |
| **Search Treesitter Symbols** | **`; s`** | Press **`Esc`** |
| **Search Neovim Help Docs** | **`; t`** | Press **`Esc`** |
| **Resume Previous Search** | **`; ;`** | Press **`Esc`** |

---

## 6. Window Splits & Resizing

Split your screen into multiple panes and move between them:

| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Split Horizontally** | **`s s`** | Type `:q` or `<C-w>c` |
| **Split Vertically** | **`s v`** | Type `:q` or `<C-w>c` |
| **Move to Left Window** | **`s h`** | — |
| **Move to Right Window** | **`s l`** | — |
| **Move to Bottom Window** | **`s j`** | — |
| **Move to Top Window** | **`s k`** | — |
| **Resize Width Wider** | **`Ctrl + w` `>`** (or `<C-w><right>`) | — |
| **Resize Width Narrower** | **`Ctrl + w` `<`** (or `<C-w><left>`) | — |
| **Resize Height Taller** | **`Ctrl + w` `+`** (or `<C-w><up>`) | — |
| **Resize Height Shorter** | **`Ctrl + w` `-`** (or `<C-w><down>`) | — |
| **Close Active Split** | **`<C-w> c`** or **`:q`** | — |
| **Close All Splits Except Active** | **`:only`** or **`<C-w> o`** | — |

---

## 7. Tabs & Buffer Management

| Key | Action | How to Close |
| :--- | :--- | :--- |
| **`t e`** | Create **New Tab** | Type `:tabclose` |
| **`Tab`** | Cycle to **Next Tab** | — |
| **`Shift + Tab`** | Cycle to **Previous Tab** | — |
| `:tabclose` | **Close current tab** | — |
| **`<Space> b d`** | **Close/delete current buffer** without closing split | — |
| **`<Space> t h`** | Close all **Hidden Buffers** | — |
| **`<Space> t u`** | Close all **Nameless Buffers** | — |

---

## 8. Formatting Code (VS Code Style)

Auto-arranges messy code into clean, indented structure (4 spaces for C++/Python, 2 for web):

| Key | Action |
| :--- | :--- |
| **`:w`** | **Automatic Format on Save** (happens whenever you save) |
| **`Alt + Shift + F`** | **Format Document** *(exact VS Code shortcut)* |
| **`<Space> c f`** | Format Document (Neovim shortcut) |
| `:ToggleAutoformat` | Toggle automatic formatting on/off |
| `:Format` or `:LazyFormat` | Command-mode manual formatting |

---

## 9. Running Code & Interactive REPL

### 🚀 Code Runner (`code_runner.nvim`)
Execute C++, Python, JavaScript, Rust, Bash, and Fish in a split window:

| Key | Action | How to Close |
| :--- | :--- | :--- |
| **`F5`** | **Save & Run Code** in split window | Press **`<Space> r q`** or click split and press **`q`** |
| **`<Space> r r`** | Same as `F5` (Save & Run) | Press **`<Space> r q`** |
| **`<Space> r f`** | Run current file directly | Press **`<Space> r q`** |
| **`<Space> r q`** | **Close the Code Runner window** | — |
| **`<Space> r c`** | Alternative: Close Runner window | — |

### 🐍 Interactive REPL (`iron.nvim`)
Interactive Python/Node/Bash console inside Neovim:

| Key | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> i s`** | **Open REPL** console split | Press **`<Space> i h`** |
| **`<Space> i l`** | **Send Current Line** to REPL | — |
| **`<Space> i f`** | **Send Entire File** to REPL | — |
| **`<Space> i c`** | Send visual selection or motion to REPL | — |
| **`<Space> i r`** | **Restart** REPL | — |
| **`<Space> i h`** | **Hide / Close** REPL | — |
| **`<Space> i q`** | Exit REPL session | — |

---

## 10. LSP, Definitions & Inlay Hints

| Key | Action |
| :--- | :--- |
| **`g d`** | **Go to Definition** (jumps to function or variable declaration) |
| **`K`** | Show documentation / type signature on hover |
| **`<Space> i`** | **Toggle Inlay Hints** on/off |
| **`Ctrl + j`** | Jump to **Next Diagnostic / Error** |
| `:IncRename <name>` | **Incremental Rename** variable across file |

---

## 11. AI Completion (GitHub Copilot)

Real-time AI ghost text suggestions as you write code:

| Key | Action |
| :--- | :--- |
| **`Ctrl + l`** | **Accept full suggestion** |
| **`Alt + l`** | Accept next **word only** |
| **`Alt + Shift + l`** | Accept next **line only** |
| **`Alt + ]`** | Cycle to **Next suggestion** |
| **`Alt + [`** | Cycle to **Previous suggestion** |
| **`Ctrl + ]`** | **Dismiss / Cancel suggestion** |

---

## 12. Editing Tricks, Smart Increment & Undo

| Key | Action |
| :--- | :--- |
| **`Ctrl + a`** | **Select entire file** (all lines: `ggVG`) |
| **`d w`** | Delete word backwards |
| **`<Space> p`** / **`<Space> P`** | Paste without overwriting default clipboard register |
| **`<Space> o`** | Open line below and stay in Normal mode |
| **`<Space> O`** | Open line above and stay in Normal mode |
| **`x`** | Delete character without polluting clipboard |
| **`<Space> c h`** | Replace Hex color with HSL format |
| **`+`** or **`Ctrl + a`** | **Smart Increment** (numbers, dates, `true` $\leftrightarrow$ `false`, `let` $\leftrightarrow$ `const`) |
| **`-`** or **`Ctrl + x`** | **Smart Decrement** |
| **`Ctrl + z`** or **`u`** | **Undo** (works in Normal & Insert mode) |
| **`Ctrl + y`**, **`Ctrl + Shift + z`**, or **`U`** | **Redo** (works in Normal & Insert mode) |
| **`Ctrl + r`** | Redo (classic Vim) |
| **`<Space> u`** | **Visual Undotree** (explore full history timeline with `j`/`k`, `q` to exit) |

---

## 13. 🏷️ TODO Comments & Bug Tracker (`todo-comments`)

Highlights comments like `// TODO:`, `// FIXME:`, `// BUG:`, `// NOTE:` in glowing neon colors:

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> s t`** | **Search All TODOs across Project** (Telescope) | Press **`Esc`** |
| **`<Space> x t`** | Open **TODO Drawer** at bottom (Trouble) | Press **`q`** |
| **`] t`** | Jump to **Next TODO** in file | — |
| **`[ t`** | Jump to **Previous TODO** in file | — |

---

## 14. Git, LazyGit & Quick Commits

### Inside Neovim:
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Open LazyGit TUI** | **`<Space> g g`** | Press **`q`** |
| **LazyGit for Current File** | **`<Space> g f`** | Press **`q`** |
| **Open Git Blame Window** | **`<Space> g b`** | Press **`q`** |
| *Inside LazyGit:* Stage file | `Space` | — |
| *Inside LazyGit:* Stage all files | `a` | — |
| *Inside LazyGit:* Commit | `c` *(type message + Enter)* | — |
| *Inside LazyGit:* Push to GitHub | `P` *(Shift + p)* | — |
| *Inside LazyGit:* Discard / Undo delete | `d` | — |
| *Inside LazyGit:* **Quit LazyGit** | **`q`** | Returns directly to code |

### In Terminal (Bash or Fish):
| Command | Action |
| :--- | :--- |
| `gp "commit message"` | **One-command:** Stages all files, commits, and pushes to GitHub |
| `lg` | Opens LazyGit visual interface in terminal *(press `q` to exit)* |
| `cp-sync "commit message"` | **CP Repo Sync:** Automatically updates problem stats, generates `README.md`, commits, and pushes private `cp` repo |

---

## 15. 🏆 Competitive Programming Suite (`CompetiTest`)
*For Codeforces, AtCoder, CSES, and contest platforms.*
*Repository location: `~/Downloads/programming/cp` (100% Private on GitHub)*

Automatically compiles your code, runs all test cases, and opens a split screen showing:
- 🟩 **Passed (AC)** with execution time in ms
- 🟥 **Wrong Answer (WA)** with side-by-side diff between Expected Output and Your Output
- ⏱️ **Time Limit Exceeded (TLE)** / Runtime Error

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> t r`** | **Run All Test Cases** (Visual popup with diffs) | Press **`q`** or **`Esc`** |
| **`<Space> t s`** or **`<Space> s`** | **Universal Smart Submit** (Auto-detects Codeforces vs AtCoder) | Press **`q`** |
| **`<Space> c s`** | **Submit to Codeforces** (Auto-submits in browser tab) | — |
| **`<Space> a s`** | **Submit to AtCoder** (Submits via official `acc submit`) | Press **`q`** |
| **`<Space> t a`** | **Add Custom Test Case** (manually enter input & output) | Press **`Esc`** |
| **`<Space> t e`** | **Edit an Existing Test Case** | Press **`Esc`** |
| **`<Space> t d`** | **Delete a Test Case** | Press **`Esc`** |
| **`<Space> t u`** | **Toggle Test Results UI** | Press **`q`** |
| **`<Space> t c`** | **Open / Switch to C++ solution** (`.cpp`) | — |
| **`<Space> t p`** | **Open / Switch to Python solution** (`.py`) | — |
| **`<Space> t g`** | **Open / Switch to Rust solution** (`.rs`) | — |
| *Browser extension* | Click **Parse** in Competitive Companion $	o$ auto-creates folder and test cases | — |

---

## 16. 🟡 LeetCode Integration (`leetcode.nvim`)
*Solve LeetCode problems directly from Neovim.*
*Storage directory: `~/Downloads/programming/cp/LeetCode` (Synced with your private `cp` repo)*

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> L`** | **Open LeetCode Dashboard** (`:Leet`) | Press `<Space> l q` |
| **`<Space> l t`** | **Run Test Cases** on current problem (`:Leet test`) | Press `q` |
| **`<Space> l s`** | **Submit Solution** to LeetCode (`:Leet submit`) | Press `q` |
| **`<Space> l d`** | Show Problem Description (`:Leet desc`) | Press `q` |
| **`<Space> l l`** | List All Problems (`:Leet list`) | Press `Esc` |
| **`<Space> l r`** | Pick Random Problem (`:Leet random`) | — |
| **`<Space> l c`** | Switch Language (`:Leet lang`) | Press `Esc` |
| **`<Space> l q`** | **Exit LeetCode Session** (`:Leet exit`) | — |

---

## 17. 📓 Obsidian Vault & Markdown Live Preview
*Your real Obsidian vault at `~/garden/content` is connected inside Neovim with in-buffer Live Preview!*

| Shortcut | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> o s`** | **Search Notes in Vault** (Fuzzy search with Telescope) | Press **`Esc`** |
| **`<Space> o q`** | **Quick Switch Notes** in Vault | Press **`Esc`** |
| **`<Space> o n`** | **Create New Note** | — |
| **`<Space> o t`** | **Today's Daily Note** | — |
| **`<Space> o b`** | **Show Backlinks** to current note | Press `q` |
| **`<Space> o l`** | **Show All Note Links** | Press `Esc` |
| **`<Space> o o`** | **Open Current Note in Desktop Obsidian App** | — |
| **`Enter`** or **`g f`** | **Follow `[[Wiki-Link]]`** to destination note | — |
| **`<Space> c h`** or **`Enter`** | **Toggle Checkbox** (`- [ ]` $\leftrightarrow$ `- [x]`) | — |

### 🎨 Live Markdown Rendering (`render-markdown.nvim`)
* **Headers**: Rendered with clean icons (`󰲡`, `󰲣`, `󰲥`).
* **Checkboxes**: Rendered with interactive icons (`󰄱` and `󰄵`).
* **Callouts**: `> [!NOTE]`, `> [!TIP]`, `> [!WARNING]` render with distinctive colored borders and icons.
* **Tables**: Formatted with smooth box borders (`┌───┬───┐`).

---

## 18. Embedded Terminals & CLI Tools

### Embedded Terminal Splits (`ToggleTerm`):
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Toggle Terminal (Open / Close)** | **`Ctrl + \`** | Press **`Ctrl + \`** again or type `exit` |
| **Bottom Split Terminal** | **`<Space> t t`** | Press `Ctrl + \` or type `exit` |
| **Right Vertical Terminal** | **`<Space> t v`** | Press `Ctrl + \` or type `exit` |
| **Floating Terminal** | **`<Space> t f`** | Press `Ctrl + \` or type `exit` |
| *Inside Terminal:* Return to Normal mode | **`Esc`** or **`Ctrl + \` `Ctrl + n`** | — |
| *Inside Terminal:* Move to split window | `Ctrl + h`, `Ctrl + j`, `Ctrl + k`, `Ctrl + l` | — |

### Terminal CLI Navigation (Zoxide & Shell):
| Command | Action |
| :--- | :--- |
| `z <name>` | Jump to frequent folder *(e.g. `z cp`, `z garden`, `z nvim`)* |
| `zi` | Interactive search menu *(select with arrows + Enter, `Esc` to cancel)* |
| `source ~/.bashrc` | Reload Bash configuration |

---

## 19. ⏱️ WakaTime Coding Stats

* **Real-Time Tracker**: Automatically tracks coding time across all files and languages.
* **Statusline Integration**: Displays today's total coding hours cleanly in the bottom right statusline without cluttering duplicates.
* **Config file**: `~/.wakatime.cfg`

---

## 20. Troubleshooting & Emergency Fixes

### 🔒 Removing the Lock Icon:
If a file displays a lock icon (opened Read-Only):
```vim
:set noreadonly
```
*(or `:set noro`)* and hit Enter.

### ♻️ Restoring an Accidentally Deleted File:
1. **If buffer is still open in Neovim:** Just type `:w` and press Enter.
2. **If tracked in Git:** Run `:!git restore <filename>` or press `<Space>gg` $	o$ hover file $	o$ press `d`.
3. **From Linux Trash Bin:** Open `~/.local/share/Trash/files/` or check desktop Trash.

### 🔄 Syncing Neovim Config to GitHub:
```bash
cd ~/.config/nvim
gp "chore: update config"
```

---

*Cheat sheet maintained for [xnocode/nvim](https://github.com/xnocode/nvim).*
