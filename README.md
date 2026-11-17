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
sudo apt install git curl unzip zsh build-essential i3 picom polybar fonts-font-awesome dunst dex xss-lock xclip flameshot tesseract-ocr tesseract-ocr-nor pulseaudio-utils brightnessctl playerctl blueman
chsh -s "$(which zsh)"
curl -fsSL https://vicinae.com/install | bash
```

[i3](https://i3wm.org) stands in for AeroSpace with the same shortcuts (`i3/flow`). They are on the Windows key, which sits where Option does on a Mac. Alt is left to applications, apart from Alt+F4, which closes a window.

Win+V opens the clipboard history from [Vicinae](https://docs.vicinae.com), and Win+\` the quick terminal. Vicinae's usage statistics and its own Alt+Space shortcut are turned off in `vicinae/settings.json`, which Vicinae also saves its other settings to.

The flow runs in two kinds of session. Each shows up under the gear icon on the login screen. In both, notifications pop up through [dunst](https://dunst-project.org) (`dunst/dunstrc`).

#### i3-gnome

i3 inside GNOME's own session (`i3/gnome`), with nothing else added. GNOME handles the function keys, power, sound, the lock screen, the keyboard layout and Settings; the bar is [Polybar](https://polybar.github.io) (`polybar/config.ini`), as in the plain i3 session.

```bash
sudo apt install gnome-session-flashback
sudo sh i3-gnome/install.sh
```

| Keys | What |
| --- | --- |
| Win+Space | Launcher (Vicinae) |
| Win+Ctrl+C | Ubuntu's Settings (Win+Ctrl+W wifi, Win+Ctrl+B Bluetooth, Win+Ctrl+D displays) |
| Print, Shift+Print, Win+Print | Flameshot: annotate an area, copy an area, copy the text in an area |
| Win+Escape | Lock |
| Win+Shift+E | Log out |

The install script also adds a few GNOME defaults that apply to this session only (`i3-gnome/90_i3-gnome.gschema.override`). Without them GNOME's own Win+L, Win+Space, Print and Shift+Print shortcuts, its desktop window and its notification bubbles take over from i3. `sudo sh i3-gnome/install.sh uninstall` removes the session again.

The session takes its keyboard layout from GNOME, so set Colemak and Caps Lock as Escape there:

```bash
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+colemak')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```

#### i3

Bare i3 (`i3/config`). It replaces GNOME's top bar and function-key handling, so this file binds the volume, brightness and media keys itself and puts wifi and Bluetooth icons in the bar. The brightness keys need your user in the `video` group: `sudo gpasswd -a "$USER" video`, then reboot. Ubuntu's Settings app opens with `env XDG_CURRENT_DESKTOP=GNOME gnome-control-center`.

Win+Space opens Vicinae as the launcher. [Flameshot](https://flameshot.org) stands in for macshot: Print captures an area to annotate, Shift+Print copies an area straight to the clipboard, and Win+Print copies the text in an area (OCR). Win+Escape locks.

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
