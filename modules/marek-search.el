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
;; flash extends isearch for support of avy-like jump,
;; but jump letters never collide with text that can by typed and found
;;
;; flash-treesitter is great for selecting code blocks
;;
(add-to-list 'package-selected-packages 'flash)
(use-package flash
  :demand t
  ;;:bind ("s-j" . flash-jump)
  :bind ("C-c t" . flash-treesitter)
  :custom
  (flash-rainbow nil)
  (flash-backdrop nil)
  (flash-label-position 'before)
  :config
  (require 'flash-isearch)
  (flash-isearch-mode 1)
)


(add-to-list 'package-selected-packages 'casual)
(use-package casual
  :config
  (require 'casual-isearch)
  (keymap-set isearch-mode-map "<f2>" #'casual-isearch-tmenu))

(provide 'marek-search)
