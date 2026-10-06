# 🚀 Neovim IDE Setup (`xnocode`)

A modern, blazing-fast, and aesthetic Neovim IDE setup powered by [LazyVim](https://lazyvim.org), featuring the Solarized Osaka theme, intelligent LSP diagnostics, automatic code formatting, and one-key execution.

---

## ⚡ 1-Line Quick Install

### 🐧 Linux (Ubuntu / Debian / Arch / Fedora)
```bash
git clone https://github.com/xnocode/nvim.git ~/.config/nvim && nvim
```

### 🍎 macOS
```bash
git clone https://github.com/xnocode/nvim.git ~/.config/nvim && nvim
```

### 🪟 Windows (PowerShell)
```powershell
git clone https://github.com/xnocode/nvim.git $env:LOCALAPPDATA\nvim ; nvim
```

> **Note:** On first launch, Lazy.nvim will automatically download and set up all plugins, themes, and language tools. Just wait a few seconds and restart Neovim!

---

## 📦 Prerequisites

Make sure the following tools are installed on your system:
- **Neovim** (>= 0.10.0)
- **Git**
- A **Nerd Font** (e.g., JetBrainsMono Nerd Font, Hack Nerd Font)
- **C/C++ Compiler** (`gcc` / `g++` / `clang`)
- **Python 3**
- **Ripgrep** (`ripgrep`) & **FZF** (`fzf`)

---

## 🎮 Keybindings & Shortcuts

### 🏃 Running & Formatting Code
| Key | Action |
| :--- | :--- |
| **`F5`** | **Save & Run Code** in split terminal (C++, Python, JS, etc.) |
| **`Alt + Shift + F`** | **Format Document** (VS Code style) |
| **`<Space> c f`** | Format current file via LSP / Conform |
| **`<Space> r q`** | Close code runner window |

### 🗂️ Navigation & Files
| Key | Action |
| :--- | :--- |
| **`<Space> e`** *(or `Ctrl + b`)* | **Toggle File Manager Sidebar** (Left) |
| **`<Space> o`** | **Toggle Code Outline / Function List** (Right) |
| **`s`** *(or `<Space> j`)* | **Flash Jump** (Teleport cursor to any 2 letters) |
| **`<Space> u`** | **Undotree** (Visual code history & time machine) |
| **`; f`** | Telescope Find Files |
| **`; r`** | Telescope Live Grep (Search text in project) |
| **`\\`** | List open buffers / tabs |

### 🐙 Git Workflow
| Key | Action |
| :--- | :--- |
| **`<Space> g g`** | Open **LazyGit** full visual TUI inside Neovim |
| `gp "message"` | *(Terminal command)* Auto git add, commit & push |
| `lg` | *(Terminal command)* Open LazyGit in shell |

---

## 🛡️ Backup Existing Config (If you already have one)

Before installing on a new machine, you can back up your old config with:

### Linux / macOS:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### Windows (PowerShell):
```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

---

## 📝 License
MIT © [xnocode](https://github.com/xnocode)
