```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

# dotfiles

Personal macOS setup for a fresh machine. Managed with [dotbot](https://github.com/anishathalye/dotbot).

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
4. Apply macOS system defaults

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
