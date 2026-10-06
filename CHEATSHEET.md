# ⚡ Neovim & Development Master Cheat Sheet

A comprehensive reference for keybindings, workflows, competitive programming, and tools in **[xnocode/nvim](https://github.com/xnocode/nvim)**.

---

## 1. File Tree Navigation (`nvim-tree`)

| Action | Key | Description / How to Close |
| :--- | :--- | :--- |
| **Toggle File Tree** | **`<Space> e`** | Open or close the sidebar file tree |
| **Focus File Tree** | **`<Space> f e`** | Switch cursor into the tree without toggling |
| **Open File / Folder** | **`Enter`** or **`o`** | Open selected file or expand directory |
| **Create New File** | **`a`** | Prompts for filename *(type `folder/file.cpp` to create subdirs)* |
| **Rename File** | **`r`** | Rename file or folder |
| **Delete File (Trash)** | **`d`** | Move file to Trash safely |
| **Cut / Copy / Paste** | **`x`** / **`c`** / **`p`** | Clipboard operations inside the file tree |
| **Refresh Tree** | **`R`** | Re-read filesystem changes |
| **Close Tree** | **`q`** | Closes the file tree window |

---

## 2. 🏆 Competitive Programming & Submissions (`CompetiTest`)
*For Codeforces, AtCoder, CSES, and general competitive programming.*

### ⚡ Running Tests:
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| **`<Space> t r`** | **Run All Test Cases** | Opens visual popup with diffs (AC / WA / TLE) *(Press `q` or `Esc` to close)* |
| **`<Space> t a`** | **Add Custom Test Case** | Enter custom input & expected output |
| **`<Space> t e`** | **Edit Existing Test Case** | Modify an existing test case |
| **`<Space> t d`** | **Delete Test Case** | Remove a test case |
| **`<Space> t u`** | **Toggle Test Results UI** | Reopen the test results window *(Press `q` to close)* |

### 🚀 Submissions:
| Shortcut / Command | Action | Description |
| :--- | :--- | :--- |
| **`<Space> s`** or **`<Space> t s`** | **Smart Universal Submit** | **Auto-detects** whether your file is Codeforces or AtCoder and runs the right submitter! |
| **`<Space> c s`** | **Submit to Codeforces** | Direct terminal popup with live polling verdict (`✔ ACCEPTED` / `WA`) |
| **`<Space> a s`** | **Submit to AtCoder** | Opens Chrome with auto-selected compiler, auto-filled code & auto-submit |
| **`:Submit`** | **Command: Universal Submit** | Submit current file from command line |
| **`:AtCoderSubmit`** | **Command: AtCoder Submit** | Submit to AtCoder from command line |

### 🔄 Multi-Language Switching (Same Problem):
| Shortcut | Action |
| :--- | :--- |
| **`<Space> t c`** | Switch to / Create **C++** file (`.cpp`) in the same problem folder |
| **`<Space> t p`** | Switch to / Create **Python** file (`.py`) in the same problem folder |
| **`<Space> t g`** | Switch to / Create **Rust** file (`.rs`) in the same problem folder |

### 📦 Syncing Solutions to GitHub (`cp-sync`):
In your terminal:
```bash
cp-sync              # Automatically counts solved problems, updates README.md, and pushes to GitHub!
cp-sync "commit msg" # Custom commit message
```
*(Your repository `github.com/xnocode/cp` stays 100% private and automatically updates statistics via pre-commit hooks and GitHub Actions).*

---

## 3. 🟡 LeetCode Inside Neovim (`leetcode.nvim`)

| Shortcut / Command | Action | How to Close |
| :--- | :--- | :--- |
| **`<Space> L`** | **Open LeetCode Dashboard** (`:Leet`) | Press `<Space> l q` |
| **`<Space> l t`** | **Run Test Cases** on current problem (`:Leet test`) | Press `q` |
| **`<Space> l s`** | **Submit Solution** to LeetCode (`:Leet submit`) | Press `q` |
| **`<Space> l d`** | Show Problem Description (`:Leet desc`) | Press `q` |
| **`<Space> l l`** | List All Problems (`:Leet list`) | Press `Esc` |
| **`<Space> l r`** | Pick Random Problem (`:Leet random`) | — |
| **`<Space> l c`** | **Switch Language** (C++, Python, Rust, Java, Go...) (`:Leet lang`) | — |
| **`<Space> l q`** | **Exit LeetCode Session** (`:Leet exit`) | — |

---

## 4. ⏱️ WakaTime Coding Tracker

Tracks your daily coding time and active languages in the background:

| Element / Command | Action | Description |
| :--- | :--- | :--- |
| **Statusline Display** | **`󱑆 25 mins`** *(Cyan)* | Live coding time today shown right alongside your code in the statusline |
| **`:WakaTimeToday`** | Check Today's Time | Displays cumulative coding time today in the command area |
| **`:WakaTimeApiKey`** | Check / Update Key | Displays or configures your WakaTime API key |

---

## 5. 📜 Text Wrapping & Visual Line Navigation

| Feature / Key | Action | Description |
| :--- | :--- | :--- |
| **Permanent Auto-Wrap** | Always ON | Lines wrap smoothly without breaking words (`linebreak = true`, `breakindent = true`) |
| **`j` / `k`** | Visual Movement | Moves smoothly up/down across wrapped lines without skipping |
| **`↓` / `↑`** | Visual Movement | Arrow keys also follow visual lines |
| **`0` / `$`** | Physical Beginning / End | Jumps to beginning / end of physical file line |
| **`g 0` / `g $`** | Visual Beginning / End | Jumps to beginning / end of wrapped visual line on screen |
| **`<Space> u w`** | Toggle Wrap | Turn line wrap on or off on the fly (`:set wrap!`) |

---

## 6. Code Execution & Runners

| Language | Shortcut | Action |
| :--- | :--- | :--- |
| **C++** | **`<Space> r`** | Compiles with `g++ -std=c++20` and runs in floating terminal |
| **Python** | **`<Space> r`** | Runs using system Python in floating terminal |
| **Rust** | **`<Space> r`** | Runs with `rustc` or `cargo run` |
| **General** | **`<Space> R`** | Interactive code runner menu |

---

## 7. Search & Jump (Telescope & Flash)

### ⚡ Flash.nvim (Cursor Teleportation)
| Action | Key |
| :--- | :--- |
| **Teleport Cursor** | Press **`s`** (or `<Space> j`), type 2 letters, press jump key |
| **Cancel Jump** | Press **`Esc`** |
| **Select Code Block / Treesitter** | Press **`S`** *(Shift + s)* |

### 🔭 Telescope Search
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

## 8. Window Splits & Tabs

### Window Splits:
| Action | Key | How to Close |
| :--- | :--- | :--- |
| **Split Horizontally** | **`s s`** | `:q` or `<C-w>c` |
| **Split Vertically** | **`s v`** | `:q` or `<C-w>c` |
| **Move Left / Right / Down / Up** | **`s h`** / **`s l`** / **`s j`** / **`s k`** | — |
| **Close Active Split** | **`<C-w> c`** or **`:q`** | — |
| **Close All Splits Except Active** | **`:only`** or **`<C-w> o`** | — |

### Tabs & Buffers:
| Key | Action |
| :--- | :--- |
| **`t e`** | Create **New Tab** |
| **`Tab`** / **`Shift + Tab`** | Next Tab / Previous Tab |
| **`:tabclose`** | Close current tab |
| **`<Space> b d`** | Close current buffer without closing window split |

---

## 9. Git & Terminal Splits

### Git in Neovim:
| Action | Key | Description |
| :--- | :--- | :--- |
| **Open LazyGit TUI** | **`<Space> g g`** | Full terminal visual Git interface *(press `q` to exit)* |
| **Stage File / Commit / Push** | Inside LazyGit: `Space` to stage, `c` to commit, `P` to push | — |

### Terminal Splits (`ToggleTerm`):
| Action | Key | Description |
| :--- | :--- | :--- |
| **Toggle Terminal Split** | **`Ctrl + \`** | Open / Close bottom terminal |
| **Vertical Terminal Split** | **`<Space> t v`** | Right-side split terminal |
| **Floating Terminal** | **`<Space> t f`** | Centered floating terminal |

---

## 10. 🏷️ TODO Comments & Code Outline

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| **`<Space> s t`** | **Search All TODOs** | Finds `TODO:`, `FIXME:`, `NOTE:` across project |
| **`<Space> x t`** | **Open TODO Drawer** | Bottom panel listing all TODOs |
| **`] t`** / **`[ t`** | **Next / Prev TODO** | Jump between TODOs in current file |
| **`<Space> a`** | **Code Outline (Aerial)** | Left sidebar showing symbols, classes, and functions |
| **`<Space> u`** | **Undotree** | Visual undo/redo timeline |

---

## 11. Useful Tips

- **Return to Home Page / Dashboard:** Press **`<Space> h`** (or **`<Space> d`**, or type **`:Home`**)
- **Selecting entire file:** Press **`Ctrl + a`**
- **Undo / Redo:** **`u`** / **`Ctrl + r`** (or **`Ctrl + z`** / **`Ctrl + y`**)
- **Formatting:** **`<Space> c f`** or type **`:Format`**
- **Clearing search highlights:** Press **`<Esc>`**

---
*Maintained for [xnocode/nvim](https://github.com/xnocode/nvim).*
