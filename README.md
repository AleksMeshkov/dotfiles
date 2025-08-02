# 💤 My Neovim Configuration

A customized LazyVim setup with enhanced debugging, task running, and development tools.

## ✨ Features

- **Full Debugging Support** - DAP configuration for JavaScript/TypeScript, Python, and Rust
- **Task Runner** - Run npm scripts and project tasks with Overseer
- **Smart File Explorer** - Shows hidden files by default
- **Enhanced Search** - Hidden files included in file search
- **Stable Debugging UI** - No flickering during log streaming
- **VS Code-like Experience** - Familiar debugging and task running workflow

## 🚀 Quick Start

### Prerequisites

- **Neovim >= 0.9.0** with LuaJIT
- **Git >= 2.19.0**
- **Node.js** (for JavaScript/TypeScript debugging)
- **Python** (for Python debugging)
- **Rust** (for Rust debugging)
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

### Installation

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install debuggers** (after Neovim loads):
   ```vim
   :Mason
   ```
   Then install:
   - `js-debug-adapter` (JavaScript/TypeScript)
   - `debugpy` (Python)
   - `codelldb` (Rust)

## 🔧 Key Bindings

### Debugging
- `<leader>dc` - Start/Continue debugging
- `<leader>db` - Toggle breakpoint
- `<leader>du` - Toggle DAP UI
- `<leader>dO` - Step over
- `<leader>di` - Step into
- `<leader>do` - Step out
- `<leader>dt` - Terminate debugging
- `K` - Hover over variable (during debugging)

### Task Running
- `<leader>oo` - Run task (npm scripts, etc.)
- `<leader>ow` - Toggle task list
- `<leader>oq` - Quick actions

### File Management
- `<leader>e` - Toggle file explorer
- `<space><space>` - Find files (includes hidden)
- `<leader>/` - Search in files

## 📁 Structure

```
├── init.lua                    # Entry point
├── lua/
│   ├── config/                # Core configuration
│   │   ├── lazy.lua          # Lazy.nvim setup
│   │   ├── options.lua       # Neovim options
│   │   ├── keymaps.lua       # Custom keymaps
│   │   ├── autocmds.lua      # Auto commands
│   │   ├── lsp-fix.lua       # LSP error handling
│   │   └── dap-stability.lua # Debug UI stability
│   └── plugins/              # Plugin configurations
│       ├── dap.lua          # Debugging setup
│       ├── overseer.lua     # Task runner
│       ├── snacks.lua       # File explorer & picker
│       ├── npm-tasks.lua    # npm script debugging
│       └── eslint-fix.lua   # ESLint configuration
├── stylua.toml              # Lua formatting
├── lazyvim.json            # LazyVim extras
└── CLAUDE.md               # Development guidance
```

## 🎯 Debugging Workflow

1. **Set breakpoints**: `<leader>db` in your code
2. **Start debugging**: `<leader>dc` (UI opens automatically)
3. **Debug controls**: Step through code with `<leader>dO`, `<leader>di`, `<leader>do`
4. **Inspect variables**: Hover with `K` or use DAP UI panels
5. **Close UI**: `<leader>du` when done

## 🔄 Task Running

1. **Run npm scripts**: `<leader>oo` → select script
2. **Debug npm scripts**: `<leader>dc` → select npm script from debug configs
3. **View output**: `<leader>ow` for task list and output

## 🤝 Contributing

This is a personal configuration, but feel free to fork and adapt it to your needs!

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
