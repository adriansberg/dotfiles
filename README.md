```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

# dotfiles

Personal macOS and Ubuntu setup for a fresh machine. Managed with [dotbot](https://github.com/anishathalye/dotbot).

## Setup

```bash
git clone git@github.com:adriansberg/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

That's it. The install script will:

1. Create symlinks for all config files
2. Install Homebrew (if missing)
3. Install all packages and apps via `Brewfile`
4. Apply macOS system defaults (macOS only)

### Linux (Ubuntu)

Install the basics first, then run the setup above:

```bash
sudo apt install git curl unzip zsh build-essential sway swaybg swayidle swaylock waybar fonts-font-awesome dunst grim slurp wl-clipboard xdg-desktop-portal-wlr brightnessctl playerctl policykit-1-gnome tesseract-ocr tesseract-ocr-nor
chsh -s "$(which zsh)"
curl -fsSL https://vicinae.com/install | bash
```

Then log out and pick "Sway" under the gear icon on the login screen.

[Sway](https://swaywm.org) stands in for AeroSpace with the same shortcuts (`sway/flow`). They are on the Windows key, which sits where Option does on a Mac. Alt is left to applications, apart from Alt+F4, which closes a window. Ctrl+Q quits the focused app, like Cmd+Q.

`sway/config` adds what a full desktop would: Colemak with Caps Lock as Escape (Win+Shift+Space switches to Norwegian), the touchpad, the volume, brightness and media keys, and wifi in the tray. The bar is [Waybar](https://github.com/Alexays/Waybar) (`waybar/`), notifications pop up through [dunst](https://dunst-project.org) (`dunst/dunstrc`). The brightness keys need your user in the `video` group: `sudo gpasswd -a "$USER" video`, then reboot.

Win+V opens the clipboard history from [Vicinae](https://docs.vicinae.com), and Win+\` the quick terminal. Vicinae's usage statistics and its own Alt+Space shortcut are turned off in `vicinae/settings.json`, which Vicinae also saves its other settings to.

| Keys | What |
| --- | --- |
| Win+Space | Launcher (Vicinae) |
| Win+Ctrl+C | Ubuntu's Settings (Win+Ctrl+W wifi, Win+Ctrl+B Bluetooth) |
| Print, Shift+Print, Win+Print | Save and copy an area, copy an area, copy the text in an area |
| Win+Escape | Lock, with fingerprint unlock (`sway/lock`) |
| Win+Shift+E | Log out |

Ubuntu's Settings only starts when it thinks it is in GNOME. `applications/org.gnome.Settings.desktop` starts it that way and makes it show up in Vicinae. Its Displays panel doesn't work outside GNOME.

The install skips the macOS-only steps and Brewfile entries. VS Code extensions are installed only if `code` is already on the PATH.

## What's included

### Shell

- **zsh** with [antigen](https://github.com/zsh-users/antigen) for plugin management
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** prompt
- Aliases in `~/.alias`

### Config files

| File         | Symlinked to    |
| ------------ | --------------- |
| `zshrc`      | `~/.zshrc`      |
| `alias`      | `~/.alias`      |
| `p10k.zsh`   | `~/.p10k.zsh`   |
| `vimrc`      | `~/.vimrc`      |
| `ssh/config` | `~/.ssh/config` |

### macOS defaults

`macos.sh` sets sane defaults on a fresh machine:

- Tap to click enabled
- Natural scrolling disabled
- Dock autohide (no delay)
- Finder: show extensions, folders first, search current folder
- Disable quarantine dialog

### iTerm2

Preferences tracked in `iterm2/`. iTerm2 is configured to load directly from this folder — changes sync back automatically.

### Apps

Installed via Homebrew Bundle. Key tools:

| Category | Tools                                       |
| -------- | ------------------------------------------- |
| Terminal | iTerm2, bat, lsd, fzf, ranger, htop         |
| Dev      | git, gh, node/nvm, go, rbenv, pnpm, podman  |
| Infra    | terraform, kubectl/kubectx, minikube        |
| Java     | jenv, maven                                 |
| Security | gnupg, git-crypt, bitwarden-cli             |
| macOS    | Raycast, AeroSpace, BetterTouchTool, AltTab |

Full list in [`Brewfile`](Brewfile).
