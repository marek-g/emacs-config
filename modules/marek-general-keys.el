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

(provide 'marek-general-keys)
