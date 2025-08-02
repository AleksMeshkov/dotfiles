# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a **LazyVim-based Neovim configuration** that extends the LazyVim starter template. The configuration follows LazyVim's modular architecture with automatic lazy-loading of plugins.

### Key Components

- **Entry Point**: `init.lua` bootstraps the entire configuration by requiring `config.lazy`
- **Plugin Manager**: Uses lazy.nvim for plugin management with automatic installation
- **Base Framework**: Built on LazyVim which provides sensible defaults and plugin configurations
- **Modular Structure**: Configuration is split into logical modules under `lua/config/` and plugins under `lua/plugins/`

### Directory Structure

```
├── init.lua                 # Main entry point
├── lua/
│   ├── config/             # Core configuration modules
│   │   ├── lazy.lua        # Lazy.nvim setup and plugin loading
│   │   ├── options.lua     # Neovim options (extends LazyVim defaults)
│   │   ├── keymaps.lua     # Custom keymaps (extends LazyVim defaults)
│   │   └── autocmds.lua    # Auto commands (extends LazyVim defaults)
│   └── plugins/            # Plugin specifications
│       ├── avante.lua      # Claude Code Neovim integration
│       └── example.lua     # Example plugin specs (disabled)
├── stylua.toml            # Lua code formatting configuration
├── lazy-lock.json         # Plugin version lockfile
└── lazyvim.json          # LazyVim-specific configuration
```

## Plugin System

### Plugin Loading Strategy
- **Automatic Import**: All files in `lua/plugins/` are automatically loaded by lazy.nvim
- **LazyVim Integration**: Base LazyVim plugins are imported via `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
- **Lazy Loading**: Plugins are lazy-loaded by default (can be overridden per plugin)
- **Version Strategy**: Uses latest git commits rather than stable releases

### Active Custom Plugins
- **Claude Code Integration** (`avante.lua`): Provides Claude Code integration with keybindings under `<leader>a` prefix

## Code Style and Formatting

### Lua Formatting (stylua.toml)
- **Indentation**: 2 spaces
- **Column Width**: 120 characters
- **Style**: Uses stylua for consistent Lua code formatting

## Development Workflow

### Plugin Development
1. **Add New Plugins**: Create new `.lua` files in `lua/plugins/` directory
2. **Override LazyVim Plugins**: Specify the same plugin in your custom plugin file with different configuration
3. **Plugin Dependencies**: Use the `dependencies` key to specify plugin dependencies

### Configuration Changes
- **Options**: Add custom Neovim options to `lua/config/options.lua`
- **Keymaps**: Add custom keymaps to `lua/config/keymaps.lua`
- **Auto Commands**: Add custom autocmds to `lua/config/autocmds.lua`

### Plugin Management Commands (within Neovim)
- `:Lazy` - Open Lazy.nvim plugin manager interface
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Synchronize plugins (install missing, update existing)
- `:Lazy check` - Check for plugin updates

## LazyVim Extension Points

This configuration extends LazyVim's defaults rather than replacing them:
- LazyVim's default options, keymaps, and autocmds are preserved
- Custom configurations in `lua/config/` files are additive
- Plugin overrides in `lua/plugins/` can disable, modify, or extend LazyVim's plugin configurations

## Claude Code Integration

The configuration includes Claude Code Neovim integration with the following keybindings:
- `<leader>ac` - Open Claude Code
- `<leader>af` - Focus Claude window  
- `<leader>ar` - Resume Claude session
- `<leader>am` - Select Claude model
- `<leader>as` - Send visual selection to Claude
- `<leader>aa` - Accept Claude diff
- `<leader>ad` - Reject Claude diff