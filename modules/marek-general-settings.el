;;
;; initial size on startup
;;
(setq frame-resize-pixelwise t) ; do not round frame size to font size
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(delete-selection-mode t) ; enable deleting selected text when typing
(setq-default indent-tabs-mode t) ; enable tabs
(setq-default tab-width 4)
(setq visual-line-fringe-indicators '(nil right-curly-arrow)) ; right arrow on wrapped lines
(global-visual-line-mode t) ; enable long line wrapping
(column-number-mode 1) ; show column in mode line

;;(global-linum-mode t) ; enable line numbers

(set-window-scroll-bars (minibuffer-window) nil nil) ; hide scroll bar from mini-buffer

;; disable ring bell (both sound and flashing)
(setq ring-bell-function 'ignore)

;; smooth buffer scrolling
(unless WORK-LINUX-P
  (pixel-scroll-precision-mode 1))

;; show keyboard all the time on Android
(when ANDROID-P
  (setq touch-screen-display-keyboard t)
  )

;;
;; backup files
;;

;(setq make-backup-files nil) ; disable backups
(setq backup-directory-alist            (list (cons ".*" (concat temporary-file-directory ".EmacsBackupFiles"))))
(setq backup-by-copying t)

(provide 'marek-general-settings)

;;
;; TRAMP
;;

;; configure TRAMP to respect the PATH variable on the remote machine (read .profile)
(with-eval-after-load 'tramp
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))
