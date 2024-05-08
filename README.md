# My NvChad configuration

## Prerequisite

- Neovim 0.9.5.
- Nerd Font as your terminal font.
- Make sure the nerd font you set doesn't end with Mono to prevent small icons.
  - Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono
- Ripgrep is required for grep searching with Telescope (OPTIONAL).
- GCC, Windows users must have mingw installed and set on path.
- Make, Windows users must have GnuWin32 installed and set on path.
- Delete old neovim folders (check commands below)
- Win32yank, for clipboard

## Installation

### Linux

```bash

git clone https://github.com/vunguyen4920/my-NvChad ~/.config/nvim && nvim

```

### Windows

```cmd

git clone https://github.com/vunguyen4920/my-NvChad %USERPROFILE%\AppData\Local\nvim && nvim

```

```powershell

git clone https://github.com/vunguyen4920/my-NvChad $ENV:USERPROFILE\AppData\Local\nvim && nvim

```

## Uninstallation

```shell

# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Window PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

```

## Plugins
