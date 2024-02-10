# My Emacs configuration

## Keyboard setup

This configuration assumes that `CapsLock` key is mapped to `Control` key and `Control` key is mapped to `ContextMenu` on the system level when `Emacs` window is active. For that you need to install and configure one of the system keymappers that are application aware. One of them is [keymapper](https://github.com/houmain/keymapper), but you can use any other that works for you.

The reason for that mapping is to make standard `Ctrl + X`, `Ctrl + C`, `Ctrl + V` etc. keybindings working with `Emacs` without breaking any standard `Emacs` behavior. There are other solutions like `cua-mode` or `wakib-keys` packages, but they are not working perfectly in every case. Remapping the keys on the system level makes it both: convinent to use and 100% compatible with `Emacs` standard key bindings. `C-x` and `C-c` `Emacs` prefixes work perfectly fine (the only difference is that you need to use `CapsLock` key instad of `Control`).

### Windows setup (both native & WSL)

I had no luck with installing Linux version of `keymapper` in WSL. Fortunately, the Windows native version works fine with `WSLg` windows (when configured based on window title).

1. Install [keymapper](https://github.com/houmain/keymapper/releases).
2. Create `keymapper.conf` file in `AppData/Local` folder:

```
[title="/GNU Emacs/"]
CapsLock >> Control
Control >> ContextMenu
```

### Linux setup (both X11 & Wayland)

1. Install [keymapper](https://github.com/houmain/keymapper/releases).
2. Create `keymapper.conf` file in `~/.config` folder:

```
[class="emacs"]
CapsLock >> Control
Control >> ContextMenu
```

3. Enable service: `sudo systemctl enable keymapperd`

## Download configuration

### Linux

``` sh
git clone https://github.com/marek-g/emacs-config ~/.config/emacs
```

## Inspiration

- [Doom Emacs](https://github.com/doomemacs/doomemacs)
- [Crafted Emacs](https://github.com/SystemCrafters/crafted-emacs)

## Nice things to consider

- Kmonad keyboard setup: https://www.reddit.com/r/emacs/comments/11zx3bp/comment/jdgfwc9/?context=3 : https://gist.github.com/ct400/4294ac422b88f1a81d210637d88c6f70
