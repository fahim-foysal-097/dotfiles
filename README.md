# Dotfiles

This repo contains dotfiles for my system.

![sceenshot](assets/screen.png)

## Requirements

Make sure you have stow & git installed.

```bash
pacman -S stow git
```

## Installation

#### Clone the repo in your `$HOME` diectory.

```bash
$ git clone https://github.com/fahim-foysal-097/dotfiles.git
$ cd dotfiles
```

#### Then use GNU stow to create symlinks.

To apply all configs:

```bash
stow */
```

To apply a specific configuration package:

```bash
stow <pkg_name>
```

## Screenshots

#### Locksreen (Hyprlock)

![lock](assets/lock.png)

#### Waybar

![waybar0](assets/waybar-0.png)
![waybar](assets/waybar.png)

#### VSCode

![waybar](assets/vscode.png)

#### Notification center (swaync)

![notification](assets/notification.png)
![notification-center](assets/notification-center.png)

#### Vim

![vim](assets/vim.png)

#### zsh

![fs-zsh](assets/fastfetch-zsh.png)

#### Powermenu & Clipboard

![powermenu](assets/powermenu.png)
![clipboard](assets/clippboard.png)
