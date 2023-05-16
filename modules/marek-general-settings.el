;;
;; initial size on startup
;;
(setq frame-resize-pixelwise t) ; do not round frame size to font size
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(delete-selection-mode t) ; enable deleting selected text when typing
(setq-default indent-tabs-mode t) ; enable tabs
(global-visual-line-mode t) ; enable long line wrapping
(column-number-mode 1) ; show column in mode line

;;(global-linum-mode t) ; enable line numbers

(set-window-scroll-bars (minibuffer-window) nil nil) ; hide scroll bar from mini-buffer

(if (not ANDROID-P)
    (tool-bar-mode -1) ; hide toolbar on non Android system

  ;; configure toolbar on Android
  (progn
    (defun android-hide-keyboard ()
      "hides keyboard"
      (interactive)
      (frame-toggle-on-screen-keyboard (selected-frame) t))

    (defun android-show-keyboard ()
      "shows keyboard"
      (interactive)
      (frame-toggle-on-screen-keyboard (selected-frame) nil))

    (tool-bar-add-item "sort-descending" 'android-hide-keyboard
		       'android-hide-keyboard
		       :help   "Hide keyboard")

    (tool-bar-add-item "sort-ascending" 'android-show-keyboard
		       'android-show-keyboard
		       :help   "Show keyboard")
    )
  )

;; show keyboard all the time on Android
(when ANDROID-P
  (setq touch-screen-display-keyboard t)
  )

(provide 'marek-general-settings)

;;
;; Backup files
;;

;(setq make-backup-files nil) ; disable backups
(setq backup-directory-alist            (list (cons ".*" (concat temporary-file-directory ".EmacsBackupFiles"))))
(setq backup-by-copying t)
