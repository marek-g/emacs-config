(define-key global-map [f1] 'marek-help-toggle-window)

(defun marek-help-toggle-window()
  "Open or close marek-help window"
  (interactive)
  (if (get-file-buffer (expand-file-name "help/main.org" user-emacs-directory))
      (marek-help-close)
    (marek-help-show)))

;;;###autoload
(defun marek-help-close()
  "Close marek-help window"
  (interactive)
  (kill-buffer (get-file-buffer (expand-file-name "help/main.org" user-emacs-directory))))

;;;###autoload
(defun marek-help-show()
  "Create buffer and show marek-help."
  (interactive)
  (find-file (expand-file-name "help/main.org" user-emacs-directory))
  (setq buffer-read-only t))

(provide 'marek-help)
