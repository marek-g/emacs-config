(define-key global-map [f1] 'marek-help-toggle-window)

(defun marek-help-toggle-window ()
  "Open or close marek-help window"
  (interactive)
  (if (get-buffer "*marek-help*")
      (marek-help-close)
    (marek-help-show)))

;;;###autoload
(defun marek-help-close ()
  "Close marek-help window"
  (interactive)
  (if (not (string-equal "*marek-help*" (buffer-name)))
      (setq marek-help-buffer-to-return (buffer-name)))
  (switch-to-buffer-other-window "*marek-help*")
  (kill-buffer-and-window)
  (switch-to-buffer marek-help-buffer-to-return))

;;;###autoload
(defun marek-help-show ()
  "Create buffer and show marek-help."
  (interactive)
  (setq marek-help-buffer-to-return (buffer-name))
  (switch-to-buffer-other-window "*marek-help*")
  (org-mode)
  (erase-buffer)
  (insert-file-contents (expand-file-name "help/main.org" user-emacs-directory))
  (goto-char 0)
  (setq buffer-read-only t))

(provide 'marek-help)
