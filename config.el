;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Marek"
      user-mail-address "marek@email.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;(setq doom-font (font-spec :family "Fira Code" :size 15 :weight 'semi-light))
;;(setq doom-font (font-spec :family "Source Code Pro" :size 18 :weight 'semi-light))
;;(setq doom-font (font-spec :family "JetBrains Mono" :size 18 :weight 'semi-light))
;;(setq doom-font (font-spec :family "Iosevka SS10" :size 18 :weight 'semi-light))
(setq doom-font (font-spec :family "Iosevka" :size 18 :weight 'semi-light))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;
;; Dashboard customization
;;

(load! "dashboard.el")


;;
;; Popup menu on right mouse button
;;

(use-package! popup-edit-menu
  :config
  (global-set-key [mouse-3] (popup-edit-menu-stub)))


;;
;; Modern key-bindings (ctrl+c, ctrl+v, ctrl+s, ctrl+a etc.)
;;

(use-package! wakib-keys
  :config
  (wakib-keys 1)
  (add-hook 'after-change-major-mode-hook 'wakib-update-major-mode-map)
  (add-hook 'menu-bar-update-hook 'wakib-update-minor-mode-maps)
  ; write & close - this works with commits in magit
  (define-key wakib-keys-overriding-map (kbd "C-w") 'with-editor-finish)
  ; killing the buffer is moved to C-k
  (define-key wakib-keys-overriding-map (kbd "C-k") 'kill-current-buffer))

;;
;; Switch active window (ctrl+<tab>)
;;

(global-set-key (kbd "C-<tab>") 'ace-window)


;;
;; Fix terminal colors with doom and emacs 28
;; (without it for example ledger reports had wrong colors)
;;

(custom-set-faces
 `(ansi-color-blacF((t (:foreground ,(doom-color 'bg)))))
 `(ansi-color-red ((t (:foreground ,(doom-color 'red)))))
 `(ansi-color-green ((t (:foreground ,(doom-color 'green)))))
 `(ansi-color-yellow ((t (:foreground ,(doom-color 'yellow)))))
 `(ansi-color-blue ((t (:foreground ,(doom-color 'blue)))))
 `(ansi-color-magenta ((t (:foreground ,(doom-color 'magenta)))))
 `(ansi-color-cyan ((t (:foreground ,(doom-color 'cyan)))))
 `(ansi-color-gray ((t (:foreground ,(doom-color 'fg)))))
 `(ansi-color-bright-black ((t (:foreground ,(doom-color 'bg)))))
 `(ansi-color-bright-red ((t (:foreground ,(doom-color 'red)))))
 `(ansi-color-bright-green ((t (:foreground ,(doom-color 'green)))))
 `(ansi-color-bright-yellow ((t (:foreground ,(doom-color 'yellow)))))
 `(ansi-color-bright-blue ((t (:foreground ,(doom-color 'blue)))))
 `(ansi-color-bright-magenta ((t (:foreground ,(doom-color 'magenta)))))
 `(ansi-color-bright-cyan ((t (:foreground ,(doom-color 'cyan))))))


;;
;; Miscellaneous
;; TODO: look at: https://codeberg.org/dr.ops/sanekeys/src/branch/main/sanekeys.org
;;

(setq-default indent-tabs-mode t) ; enable tabs
(global-visual-line-mode t) ; enable long line wrapping
;(global-linum-mode t) ; enable line numbers

(define-key isearch-mode-map (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "M-f") 'isearch-forward-regexp)
(define-key isearch-mode-map (kbd "<f3>") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "S-<f3>") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "M-d") 'isearch-delete-char)

(global-set-key (kbd "C-SPC") 'switch-to-buffer) ; switch to buffer

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;
;; home key - cycle between move to beginning of line and indentation
;;
(defun smart-beginning-of-line()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive) in Emacs 22 or older
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)

;;
;; treemacs configuration
;;

; allow resizing
(setq treemacs-width-is-initially-locked nil)

; initial size
(setq treemacs-width 30)


;;
;; Leger-mode configuration
;;

(setq ledger-reconcile-default-commodity "PLN")

(setq ledger-reports
  '(("Balance PLN - Aktywa" "%(binary) -w -f %(ledger-file) -X PLN balance ^Aktywa")
    ("Balance PLN - Wszystko" "%(binary) -w -f %(ledger-file) -X PLN balance")
    ("Balance - Wszystko" "%(binary) -f %(ledger-file) balance")
    ("reg" "%(binary) -f %(ledger-file) reg")
    ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
    ("account" "%(binary) -f %(ledger-file) reg %(account)")))
