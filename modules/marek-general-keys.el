(add-to-list 'package-selected-packages 'wakib-keys)
(use-package wakib-keys
  :diminish wakib-keys
  :config
  (wakib-keys 1)
  (add-hook 'after-change-major-mode-hook 'wakib-update-major-mode-map)
  (add-hook 'menu-bar-update-hook 'wakib-update-minor-mode-maps)
  ;; killing the buffer is moved to C-k
  (define-key wakib-keys-overriding-map (kbd "C-k") 'kill-current-buffer)
  ;; split window horizontally
  (define-key wakib-keys-overriding-map (kbd "s-h") 'split-window-right)
  ;; split window vertically
  (define-key wakib-keys-overriding-map (kbd "s-v") 'split-window-below)
  ;; delete window
  (define-key wakib-keys-overriding-map (kbd "s-k") 'delete-window)
  ;; decrease font size
  ;;(define-key wakib-keys-overriding-map (kbd "C--") nil)
  ;;(define-key wakib-keys-overriding-map (kbd "C-<kp-subtract>") 'text-scale-decrease)
  ;; increase font size
  ;;(define-key wakib-keys-overriding-map (kbd "C-=") nil)
  ;;(define-key wakib-keys-overriding-map (kbd "C-<kp-add>") 'text-scale-increase)
)

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
;; search
;;
(define-key isearch-mode-map (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "M-f") 'isearch-forward-regexp)
(define-key global-map (kbd "<f3>") 'isearch-repeat-forward)
(define-key global-map (kbd "S-<f3>") 'isearch-repeat-backward)
(define-key global-map (kbd "C-<f3>") 'isearch-exit) ;; stops repeat search - TODO: find a way to ESC do the same
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "M-d") 'isearch-delete-char)

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
;; Map Escape to cancel (like C-g)
;;
(define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
(define-key isearch-mode-map "\e" 'isearch-abort)   ;; \e seems to work better for terminals
(global-set-key [escape] 'keyboard-escape-quit)         ;; everywhere else

;;
;; Switch buffers
;;
(global-set-key (kbd "C-SPC") 'switch-to-buffer) ; switch to buffer

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
