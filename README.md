# My Emacs configuration

## Keyboard setup

This configuration assumes that `CapsLock` key is remapped to be a `Control` key and some key bindings with the original `Control` key are remapped (at system level) to the standard CUA actions (like: `Ctrl+X`, `Ctrl+C`, `Ctrl+V` etc). That way the important original `Emacs` actions (like `C-x` and `C-c`) are still available (although by `CapsLock` key, but it's easy to learn) without conflicting with standard actions. This works much better than any `Emacs` internal solutions (like `cua-mode` or `wakib-keys`) which do not work in all situations.

Not all such mappings have to mapped at a system level. Some of them are mapped at `Emacs` level (if they are not conflicting with anything important or are easier to define in Lisp).

There are many different system level key mappers. The one I'm using is [keymapper](https://github.com/houmain/keymapper), because it is multiplatform, application aware, very powerfull and easy to configure.

### Windows setup (both native & WSL2)

I had no luck with installing Linux version of `keymapper` in WSL2. Fortunately, the Windows native version works fine with `WSLg` windows (the application can be matched successfully by window title).

1. Install [keymapper](https://github.com/houmain/keymapper/releases).
2. Create `keymapper.conf` file in `AppData/Local` folder:

```
[title="/GNU Emacs/"]
CapsLock >> Control
Control{X} >> Control{W}                      ; cut
Control{C} >> AltLeft{W}                      ; copy
Control{V} >> Control{Y}                      ; paste
Control{A} >> Control{X} H                    ; select all
Control{S} >> Control{X} Control{S}           ; save
Control{O} >> Control{X} Control{F}           ; open
Control{F} >> Control{S}                      ; search
(Shift Control){F} >> Control{R}              ; search backward
Control{W} >> Control{X} K                    ; kill buffer
Control{Z} >> Control{X} U                    ; undo
Control{Y} >> (Control AltLeft Shift){Minus}  ; redo
# any more?
```

### Linux setup (both X11 & Wayland)

1. Install [keymapper](https://github.com/houmain/keymapper/releases).
2. Create `keymapper.conf` file in `~/.config` folder:

```
[class="emacs"]
CapsLock >> Control
Control{X} >> Control{W}                      ; cut
Control{C} >> AltLeft{W}                      ; copy
Control{V} >> Control{Y}                      ; paste
Control{A} >> Control{X} H                    ; select all
Control{S} >> Control{X} Control{S}           ; save
Control{O} >> Control{X} Control{F}           ; open
Control{F} >> Control{S}                      ; search
(Shift Control){F} >> Control{R}              ; search backward
Control{W} >> Control{X} K                    ; kill buffer
Control{Z} >> Control{X} U                    ; undo
Control{Y} >> (Control AltLeft Shift){Minus}  ; redo
# any more?
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
- [Wakib-keys](https://github.com/darkstego/wakib-keys)
- [Ergoemacs](https://ergoemacs.github.io/)

## Nice things to consider

- Kmonad keyboard setup: https://www.reddit.com/r/emacs/comments/11zx3bp/comment/jdgfwc9/?context=3 : https://gist.github.com/ct400/4294ac422b88f1a81d210637d88c6f70
