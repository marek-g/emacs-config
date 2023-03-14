;;
;; initial size on startup
;;
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(delete-selection-mode t) ; enable deleting selected text when typing
(setq-default indent-tabs-mode t) ; enable tabs
(global-visual-line-mode t) ; enable long line wrapping
(column-number-mode 1) ; show column in mode line
;(global-linum-mode t) ; enable line numbers
;(when (fboundp 'set-scroll-bars-mode)
;  (set-scroll-bar-mode t)) ; enable scroll bars
(tool-bar-mode -1) ; hide toolbar

(provide 'marek-general-settings)
