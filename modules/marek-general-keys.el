(add-to-list 'package-selected-packages 'wakib-keys)
(use-package wakib-keys
  :config
  (wakib-keys 1)
  (add-hook 'after-change-major-mode-hook 'wakib-update-major-mode-map)
  (add-hook 'menu-bar-update-hook 'wakib-update-minor-mode-maps)
  ; write & close - this works with commits in magit
  (define-key wakib-keys-overriding-map (kbd "C-w") 'with-editor-finish)
  ; killing the buffer is moved to C-k
  (define-key wakib-keys-overriding-map (kbd "C-k") 'kill-current-buffer)
  ; split window horizontally
  (define-key wakib-keys-overriding-map (kbd "s-h") 'split-window-right)
  ; split window vertically
  (define-key wakib-keys-overriding-map (kbd "s-v") 'split-window-below)
  ; delete window
  (define-key wakib-keys-overriding-map (kbd "s-k") 'delete-window))

;;
;; vundo (visual undo-tree)
;;
(add-to-list 'package-selected-packages 'vundo)
(use-package vundo
  :config
  (setq vundo-compact-display t)
  (setq vundo-glyph-alist vundo-unicode-symbols)
  (custom-set-faces
    '(vundo-node ((t (:foreground "#808080"))))
    '(vundo-stem ((t (:foreground "#808080"))))
    '(vundo-highlight ((t (:foreground "#FFFF00")))))
)

; redo
(global-set-key (kbd "C-S-z") 'vundo)
(global-set-key (kbd "C-y") 'undo-redo)

;;
;; <menu> leader key key-map
;;
;; on Linux, the menu/apps key syntax is <menu>
;; on Windows, the menu/apps key syntax is <apps>
;; make the syntax equal and make <menu> key leader key
;;
(define-key key-translation-map (kbd "<apps>") (kbd "<menu>"))
(global-unset-key [apps])
(global-unset-key [menu])

(define-prefix-command 'menu-leader-key-map)
(define-key menu-leader-key-map (kbd "RET") 'execute-extended-command)
(define-key menu-leader-key-map (kbd "<menu>") 'exchange-point-and-mark)
(define-key menu-leader-key-map (kbd "'") 'quoted-insert)
(global-set-key (kbd "<menu>") 'menu-leader-key-map)

(provide 'marek-general-keys)
