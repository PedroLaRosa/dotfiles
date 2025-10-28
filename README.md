# 🚀 Pedro's Dotfiles

> A meticulously crafted development environment for macOS, featuring Neovim with LazyVim, Kitty terminal, Tmux, and a powerful shell configuration.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## ✨ Overview

This repository contains my personal development environment configuration, optimized for productivity and developer experience. It represents years of refinement, focusing on terminal-based workflows, modern development tools, and seamless integration between components.

**Philosophy**: Powerful, fast, and beautiful tools that stay out of your way.

---

## 📦 What's Inside

### 🎨 Core Components

- **[LazyVim](#-neovim--lazyvim)** - Modern Neovim configuration with LSP, AI integration, and 20+ custom plugins
- **[Kitty](#-kitty-terminal)** - GPU-accelerated terminal with ligature support and beautiful themes
- **[Tmux](#-tmux-configuration)** - Enhanced terminal multiplexer with session persistence and custom keybindings
- **[Zsh + Powerlevel10k](#-shell-configuration)** - Fast, beautiful shell with intelligent auto-completion
- **[Homebrew](#-homebrew-packages)** - Comprehensive package management with 30+ developer tools

### 🛠️ Additional Tools

- **Version Control**: Git with custom configurations
- **Version Managers**: NVM (Node.js), Pyenv (Python)
- **Package Managers**: pnpm, pipx
- **Developer Tools**: lazygit, lazydocker, fzf, ripgrep, bat, eza
- **Language Support**: Node.js, Python, Go, Rust, PHP, Lua, Julia

---

## 🌟 Features

### 🎯 Development Experience

- **AI-Powered Editing**: Claude Code and Claude FZF integration in Neovim
- **Smart Navigation**: Vim-style keybindings across terminal, tmux, and editor
- **Session Management**: Tmux resurrect for persistent workflows across restarts
- **Git Workflow**: lazygit, Git conflict resolution, and enhanced Git signs
- **Live Preview**: Real-time markdown rendering and package info

### ⚡ Performance Optimizations

- **Instant Prompt**: Powerlevel10k cached rendering for sub-50ms shell startup
- **GPU Acceleration**: Kitty terminal with hardware-accelerated rendering
- **Lazy Loading**: LazyVim's plugin lazy-loading for fast Neovim startup
- **Modern Replacements**: `eza` for ls, `bat` for cat, `ripgrep` for grep

### 🎨 Visual Polish

- **Monokai Remastered**: Consistent theme across Kitty and Neovim
- **FiraCode Nerd Font**: Beautiful ligatures and icon support
- **Custom Tmux Status Bar**: CPU, RAM, weather, date/time, ping, Pomodoro timer
- **Powerline Tabs**: Slanted separators and visual hierarchy

---

## 🔧 Neovim + LazyVim

### Configuration Structure

```
.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin versions
├── lazyvim.json          # LazyVim config
├── lua/
│   ├── config/           # Core settings
│   │   └── keymaps.lua   # Custom key bindings
│   └── plugins/          # Plugin configurations (23 files)
```

### 🎮 Key Plugins

| Plugin                            | Purpose                              |
| --------------------------------- | ------------------------------------ |
| **claude-fzf** & **claudecode**   | AI-powered code assistance           |
| **lazygit** & **lazydocker**      | Git and Docker TUI integration       |
| **nvim-spider** & **multicursor** | Advanced text navigation and editing |
| **telescope** & **mini-files**    | Fuzzy finding and file management    |
| **refactoring** & **coerce**      | Code transformation utilities        |
| **render-markdown**               | Live markdown preview                |
| **vim-tmux-navigator**            | Seamless tmux integration            |
| **undotree**                      | Visual undo history                  |
| **package-info**                  | NPM package version display          |

### ⌨️ Custom Keybindings

```vim
Leader Key: <Space>

# File Operations
<leader>w         - Save file
<leader>q         - Close window
<leader>Q         - Quit all tabs

# Clipboard (File Paths)
;yp               - Copy relative path
;yP               - Copy absolute path
;yf               - Copy filename
;yd               - Copy directory

# Window Management
ss                - Split horizontal
sv                - Split vertical
sh/sj/sk/sl       - Navigate panes

# Tab Management
<Tab>             - Next tab
<S-Tab>           - Previous tab
te                - New tab
tw                - Close tab

# Utilities
+/-               - Increment/decrement numbers
<C-a>             - Select all
<C-j>             - Next diagnostic
```

### 🔍 LSP & Language Support

Full LSP integration with intelligent auto-completion, diagnostics, and code actions for:

- TypeScript/JavaScript
- Python
- Go
- Rust
- Lua
- And more...

---

## 🖥️ Kitty Terminal

### Features

- **Font**: FiraCode Nerd Font Mono (16pt) with ligature support
- **Theme**: Monokai Remastered
- **Cursor**: Smooth cursor trail for enhanced visibility
- **Windows**: 2pt borders with cyan active window highlighting
- **Tabs**: Powerline style with slanted separators
- **Performance**: GPU-accelerated rendering

### Custom Configuration

```conf
# Neovim Integration
map cmd+x send_text all \x18

# Visual
background_opacity 1.0
active_border_color #00ffff
window_border_width 2pt
window_margin_width 20pt

# Tab Bar
tab_bar_style powerline
tab_bar_edge top
```

---

## 🎯 Tmux Configuration

### Key Features

- **Prefix**: `C-a` (instead of default `C-b`)
- **Vi Mode**: Full Vi keybindings in copy mode
- **Session Persistence**: Auto-save and restore with tmux-resurrect
- **Vim Integration**: Seamless navigation with vim-tmux-navigator
- **Mouse Support**: Full mouse integration enabled

### ⌨️ Custom Keybindings

```bash
Prefix: C-a

# Pane Management
|                 - Split vertical (keep current path)
_                 - Split horizontal (keep current path)
x                 - Kill pane
h/j/k/l           - Navigate panes (Vim-style)
H/J/K/L           - Resize panes

# Window Management
C-h/C-l           - Cycle windows
x                 - Kill pane
X                 - Kill session

# Session Management
S                 - New session
C-u               - Reload config

# Utilities
M-s               - Screenshot (ASCII capture)
```

### 📊 Status Bar

**Left**: Session • Window • Pane (with active prefix indicator)

**Right**:

- CPU usage
- RAM usage
- Weather
- Date/Time
- Ping latency
- Pomodoro timer

### 🔌 Plugins

```bash
# Core
tmux-plugins/tpm              # Plugin manager
christoomey/vim-tmux-navigator # Vim integration
tmux-plugins/tmux-resurrect   # Session persistence

# Utilities
olimorris/tmux-pomodoro-plus  # Pomodoro timer
laktak/extrakto               # Text extraction

# System Monitoring
tmux-plugins/tmux-cpu
tmux-plugins/tmux-mem
alexanderjeurissen/tmux-world-clock
```

---

## 🐚 Shell Configuration

### Zsh + Powerlevel10k

**Theme**: Powerlevel10k with instant prompt caching

**Plugins**:

- `git` - Git aliases and shortcuts
- `vscode` - VS Code integration

**Custom Alias**:

```bash
config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Manage dotfiles with bare Git repository
```

### 🛠️ Development Tools Integration

```bash
# Node.js Version Management
nvm                 # Node Version Manager

# Python Version Management
pyenv               # Python version manager

# Package Managers
pnpm                # Fast, disk space efficient package manager

# Command Corrections
thefuck             # Corrects previous console command

# AI Assistant
Amazon Q            # Shell integration
```

---

## 📚 Homebrew Packages

### Development Languages & Runtimes

```bash
# Languages
node (via nvm)      python              go
rust                php                 lua
julia

# Build Tools & Analysis
rust-analyzer       luarocks            ast-grep
ripgrep             fd
```

### Developer Tools

```bash
# Version Control
git                 hub                 gh (GitHub CLI)

# Container & Orchestration
docker              lazygit             lazydocker

# Editors
neovim              code                cursor
```

### Terminal Enhancements

```bash
# Modern CLI Replacements
eza                 # Better ls
bat                 # Better cat with syntax highlighting
dust                # Better du
ripgrep             # Better grep
fd                  # Better find

# Utilities
fzf                 # Fuzzy finder
thefuck             # Command correction
tmux                # Terminal multiplexer
fish                # Alternative shell
```

### System Utilities

```bash
# GNU Tools (replacing macOS defaults)
coreutils           findutils           gnu-sed
moreutils           grep

# Image Processing
imagemagick         pngpaste            ghostscript

# System Monitoring
glances

# Other
openssh             screen              tree
```

### macOS Applications (Casks)

```bash
hot                 # Toolbar utility
rectangle           # Window management
amazon-q            # AI assistant
```

---

## 🚀 Installation

This Repo is intended to be used as a git bare repository. This is the guide used for maintain my dotfiles: [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

### Prerequisites

- **macOS** (tested on latest versions)
- **Git** (for cloning repository)
- **curl** or **wget** (for downloading installers)

### Quick Start

```bash
# 1. Clone the repository

# Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
echo ".cfg" >> .gitignore

#Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
git clone --bare https://github.com/PedroLaRosa/dotfiles $HOME/.cfg

# Define the alias in the current shell scope:
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Checkout the actual content from the bare repository to your $HOME:
config checkout

# Set the flag showUntrackedFiles to no on this specific (local) repository:
config config --local status.showUntrackedFiles no


# 2. Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Install all packages and applications
bash brew.sh

# 4. Set up Zsh with Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 6. Create symbolic links
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.config/kitty ~/.config/kitty

# 7. Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 8. Install FiraCode Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

# 9. Reload shell configuration
source ~/.zshrc
```

### Post-Installation

1. **Configure Powerlevel10k**: Run `p10k configure` to set up your prompt
2. **Install Tmux plugins**: Press `Prefix + I` (C-a + I) in Tmux
3. **Install Neovim plugins**: Open Neovim and run `:Lazy sync`
4. **Restart terminal**: Ensure all changes take effect

---

## 🎨 Customization

### Changing Theme

**Kitty**: Edit `.config/kitty/kitty.conf` and change the theme include:

```conf
include monokai-remastered.conf  # Change to your preferred theme
```

**Neovim**: Edit `.config/nvim/lua/plugins/colorscheme.lua`

### Adding Plugins

**Neovim**: Create a new file in `.config/nvim/lua/plugins/`:

```lua
return {
  "username/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

**Tmux**: Add to `.tmux.conf`:

```bash
set -g @plugin 'username/plugin-name'
```

Then run `Prefix + I` to install.

### Custom Keybindings

**Neovim**: Edit `.config/nvim/lua/config/keymaps.lua`

**Tmux**: Edit `.tmux.conf`

**Shell**: Add aliases to `.zshrc`

---

## 📁 Repository Structure

```
dotfiles/
├── .config/
│   ├── kitty/
│   │   ├── kitty.conf
│   │   └── monokai-remastered.conf
│   └── nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── lazyvim.json
│       └── lua/
│           ├── config/
│           │   └── keymaps.lua
│           └── plugins/         # 23 plugin configs
├── .gitconfig                   # Git configuration
├── .p10k.zsh                    # Powerlevel10k theme config
├── .tmux.conf                   # Tmux configuration
├── .zshrc                       # Zsh configuration
├── brew.sh                      # Homebrew installation script
├── LICENSE
└── README.md
```

---

## 🤝 Contributing

While this is a personal configuration, suggestions and improvements are welcome! Feel free to:

1. **Fork** the repository
2. **Create** a feature branch
3. **Submit** a pull request with your improvements

---

## 🙏 Acknowledgments

This configuration is built on the shoulders of giants. Special thanks to:

- **[LazyVim](https://www.lazyvim.org/)** - Neovim configuration framework
- **[Oh My Zsh](https://ohmyz.sh/)** - Zsh framework
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - Zsh theme
- **[Tmux](https://github.com/tmux/tmux)** - Terminal multiplexer
- **[Kitty](https://sw.kovidgoyal.net/kitty/)** - Terminal emulator
- And all the amazing open-source contributors who maintain these tools

---

### Productivity Boosters

1. **Use tmux sessions** for different projects
2. **Configure p10k** to show git status and command duration
3. **Learn Vim motions** - they work everywhere (tmux, shell, editor)
4. **Use fzf** with Ctrl+R for command history search
5. **Set up Claude AI** for intelligent code assistance

### Troubleshooting

**Fonts not displaying correctly?**

- Install FiraCode Nerd Font: `brew install --cask font-fira-code-nerd-font`
- Set Kitty font in terminal preferences

**Plugins not loading in Neovim?**

- Run `:Lazy sync` in Neovim
- Check for errors with `:checkhealth`

**Tmux plugins not working?**

- Ensure TPM is installed: `~/.tmux/plugins/tpm`
- Install plugins with `Prefix + I`

---

<div align="center">

**Made with ❤️ and lots of ☕**

[Report Bug](https://github.com/PedroLaRosa/dotfiles/issues) · [Request Feature](https://github.com/PedroLaRosa/dotfiles/issues)

</div>
