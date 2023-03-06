;;
;; initial size on startup
;;
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default indent-tabs-mode t) ; enable tabs
(global-visual-line-mode t) ; enable long line wrapping
;(global-linum-mode t) ; enable line numbers
;(when (fboundp 'set-scroll-bars-mode)
;  (set-scroll-bar-mode t)) ; enable scroll bars

(provide 'marek-general-settings)