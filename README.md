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
sudo apt install git curl unzip zsh build-essential i3 dex xss-lock xclip
chsh -s "$(which zsh)"
curl -fsSL https://vicinae.com/install | bash
```

[i3](https://i3wm.org) stands in for AeroSpace with the same shortcuts (`i3/config`). Log out and pick "i3" from the gear icon on the login screen.

[Vicinae](https://docs.vicinae.com) stands in for Raycast: Alt+Space opens the launcher and Ctrl+Alt+F the clipboard history. Its usage statistics are turned off in `vicinae/settings.json`, which Vicinae also saves its other settings to.

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
