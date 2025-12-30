# termux-configs

Professional development environment for Android, powered by **Termux**, **PRoot-Distro (Ubuntu)**, and **Nix**.

## 🏗️ Architecture

This setup uses `proot-distro` with custom bind mounts to unify the Android storage, Termux environment, and a glibc-based Linux distribution.

- **Host:** Termux (Bionic libc)
- **Guest:** Ubuntu (glibc via PRoot)
- **User:** `brantes`

## 🚀 Key Features

### Dynamic SD Card Discovery
The environment automatically detects the external SD Card ID (`XXXX-XXXX`) to maintain portability across different hardware/formatting.

### Nix Integration
All package management and environment reproducibility are handled by Nix, following the configurations defined in my main repository:
👉 [dotfiles](https://github.com/pedrobrantes/dotfiles)

Integrated Workspace
 * Home Bind: Termux $HOME is mapped to /mnt/termux_home.
 * System Access: Termux $PREFIX mapped to /mnt/termux_root.
 * External Storage: SD Card mapped to /mnt/sdcard.

### Installation & Usage

1. Requirements
Install the following packages via pkg:
```bash
pkg install proot-distro gh git
```

2. Termux Ecosystem (APKs)
For the best experience, install these extensions:
 * Termux:Styling (Required for custom themes/fonts)
 * Termux:Widget (Highly recommended for home screen shortcuts)
 * Termux:API (Device hardware access)
 * Termux:Boot (Run scripts on device startup)
 * Termux:GUI (X11/Wayland support)

3. Bootstrap
```bash
gh repo clone termux-configs .
source .bashrc
ubuntu # Launch the environment
```
