;; TODO:
;; - ctrl+w ('kill-current-buffer)
;; - window management ('split-window-right, 'split-window-below, 'delete-window)
;; - ctrl+shift+f ('projectile-ripgrep)
;; - C-- 'text-scale-decrease (what about negative C-u?), C-+ 'text-scale-increase

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

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'vundo)
;(global-set-key (kbd "C-y") 'undo-redo)


;; duplicate current line or region
(global-set-key (kbd "C-M-d") 'duplicate-dwim)

;;
;; Navigate back and forward between visited places
;;
(add-to-list 'package-selected-packages 'backward-forward)
(use-package backward-forward
  :config
  (backward-forward-mode t)
  (define-key backward-forward-mode-map (kbd "C-<left>") nil)
  (define-key backward-forward-mode-map (kbd "C-<right>") nil)
  (define-key backward-forward-mode-map (kbd "M-<left>") 'backward-forward-previous-location)
  (define-key backward-forward-mode-map (kbd "M-<right>") 'backward-forward-next-location)
  )

;;
;; Switch buffers
;;
(global-set-key (kbd "M-SPC") 'switch-to-buffer) ; switch to buffer

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
;; <menu> leader key key-map
;;
;; On Linux, the menu/apps key syntax is <menu>
;; on Windows, the menu/apps key syntax is <apps>
;; make the syntax equal and make <menu> key leader key
;;
(define-key key-translation-map (kbd "<apps>") (kbd "<menu>"))
(global-unset-key [apps])
(global-unset-key [menu])

;(global-set-key (kbd "<menu> x") 'kill-region)
;(global-set-key (kbd "<menu> c") 'kill-ring-save)
;(global-set-key (kbd "<menu> v") 'yank)

(provide 'marek-general-keys)
