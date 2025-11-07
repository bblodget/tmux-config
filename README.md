# Tmux Configuration

A clean, customizable tmux configuration with Gruvbox colors, git integration, and useful key bindings.

## Features

- **Gruvbox color scheme** - Dark theme matching the Gruvbox palette
- **Custom prefix key** - `Ctrl-a` instead of the default `Ctrl-b`
- **Git integration** - Shows current branch and status in the status bar
- **Smart status bar** - Session name, current directory, git info, and date/time
- **Prefix indicator** - Status bar changes color when prefix is active
- **Vim-style copy mode** - Vi key bindings for navigating and copying
- **Intuitive pane management** - Alt-based shortcuts for splits and navigation
- **X clipboard integration** - Copy directly to system clipboard with `xclip`
- **10,000 line history** - Extended scrollback buffer

## Prerequisites

- **tmux** (version 3.0+)
- **xclip** - For clipboard integration
- **FiraCode Nerd Font** - For proper icon display (optional but recommended)
- **git** - For git status integration

## Installation

### 1. Clone this repository

```bash
# Clone to ~/.config/tmux
git clone <your-repo-url> ~/.config/tmux
```

### 2. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

### 3. Make scripts executable

```bash
chmod +x ~/.config/tmux/*.sh
```

### 4. Start tmux and install plugins

```bash
tmux
# Inside tmux, press: Ctrl-a + I (capital I)
# This will install all plugins listed in tmux.conf
```

### 5. Reload configuration

```bash
# Inside tmux, press: Ctrl-a + Shift-R
# Or run: tmux source-file ~/.config/tmux/tmux.conf
```

## Key Bindings

### Prefix Key
- **Prefix**: `Ctrl-a` (replaces default `Ctrl-b`)

### Pane Management
- **Split horizontally**: `Alt-\` (new pane in same directory: `Alt-|`)
- **Split vertically**: `Alt--` (new pane in same directory: `Alt-_`)
- **Navigate panes**: `Alt-Arrow` (without prefix)
- **Resize panes**: `Shift-Arrow` (without prefix)

### Window Management
- **New window**: `Alt-n`
- **Next window**: `Alt-.`
- **Previous window**: `Alt-,`
- **Switch to window**: `Alt-0` through `Alt-9`

### Copy Mode (Vim bindings)
- **Enter copy mode**: `Ctrl-a + [`
- **Start selection**: `v`
- **Copy selection**: `y` (copies to clipboard)
- **Paste**: `Ctrl-a + P`

### Other
- **Reload config**: `Ctrl-a + Shift-R`
- **Respawn pane**: `Ctrl-a + r`

## Status Bar

**Left side:**
- Session icon and name
- Current working directory
- Git branch and status (when in a git repo)
  - Green ✓ = clean repository
  - Yellow ● = uncommitted changes

**Right side:**
- Current date and time

**Prefix indicator:**
- Green background = normal mode
- Blue background = prefix key pressed

## Plugins

This configuration uses the following plugins (installed via TPM):

- **tpm** - Tmux Plugin Manager
- **tmux-sensible** - Basic tmux settings everyone can agree on
- **tmux-starship** - Starship prompt integration (currently unused)

## Customization

### Colors

The configuration uses the Gruvbox color palette. Colors are defined in the status bar sections:

- `#FBF1C7` - Foreground (light)
- `#3C3836` - Background (dark gray)
- `#b16286` - Purple (session indicator)
- `#458588` - Blue (prefix active)
- `#689d6a` - Green (normal mode)
- `#98971a` - Green (git clean)
- `#d79921` - Yellow (git dirty)

### Scripts

- `status.sh` - Displays date/time on the right side
- `git-status.sh` - Shows git branch and status on the left side

Feel free to modify these scripts to show different information!

## Troubleshooting

### Icons not displaying correctly

Install a Nerd Font (like FiraCode Nerd Font) and configure your terminal to use it:

```bash
# Download and install FiraCode Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip
rm FiraCode.zip
fc-cache -fv
```

Then set your terminal font to "FiraCode Nerd Font Mono".

### Git status not updating

Make sure `git-status.sh` is executable:

```bash
chmod +x ~/.config/tmux/git-status.sh
```

### Clipboard not working

Install `xclip`:

```bash
sudo apt install xclip  # Ubuntu/Debian
sudo dnf install xclip  # Fedora
sudo pacman -S xclip    # Arch
```

## License

Feel free to use and modify this configuration as you like!
