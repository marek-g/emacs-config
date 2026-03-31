(use-package markdown-mode
  :commands (markdown-mode gfm-mode) ; gfm-mode - markdown-mode + GitHub Flavored Markdown
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))

  :custom
  (markdown-header-scaling t)
  (markdown-hide-urls t)
  (markdown-fontify-code-blocks-natively t)

  :custom-face
  (markdown-header-delimiter-face ((t (:height 0.9))))
  (markdown-header-face-1 ((t (:height 1.6 :weight bold :foreground "#EBCB8B" :inherit markdown-header-face))))
  (markdown-header-face-2 ((t (:height 1.4 :weight bold :inherit markdown-header-face))))
  (markdown-header-face-3 ((t (:height 1.2 :weight bold :inherit markdown-header-face))))
  (markdown-header-face-4 ((t (:height 1.15 :inherit markdown-header-face))))
  (markdown-header-face-5 ((t (:height 1.1 :inherit markdown-header-face))))
  (markdown-header-face-6 ((t (:height 1.05 :inherit markdown-header-face))))

  ;;
  ;; automatically add hook to hide/unhide markdown syntax
  ;;
  ;; :hook (markdown-mode . nb/markdown-unhighlight)
  ;; :config
  ;; (defvar-local nb/current-line nil
  ;;   "(start . end) of current line in current buffer")
  ;; (defun nb/refontify-on-linemove ()
  ;;   "Post-command-hook to trigger re-fontification when moving lines."
  ;;   (let ((start (line-beginning-position))
  ;;         (end (line-beginning-position 2)))
  ;;     (unless (equal nb/current-line (cons start end))
  ;;       (let ((old-line nb/current-line))
  ;;         (setq nb/current-line (cons start end))
  ;;         (when old-line
  ;;           (font-lock-flush (car old-line) (cdr old-line)))
  ;;         (font-lock-flush start end)))))
  ;; (defun nb/unhide-current-line (limit)
  ;;   "Function to remove hiding on the current line."
  ;;   (when (consp nb/current-line)
  ;;     (let ((start (max (point) (car nb/current-line)))
  ;;           (end (min limit (cdr nb/current-line))))
  ;;       (when (< start end)
  ;;         (remove-text-properties start end
  ;;                                 '(invisible t display "" composition ""))
  ;;         (goto-char limit)
  ;;         t))))
  ;; (defun nb/markdown-unhighlight ()
  ;;   "Enable markdown concealing with current-line expansion."
  ;;   (interactive)
  ;;   (markdown-toggle-markup-hiding 1)
  ;;   (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
  ;;   (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t)
  ;; 	)
  )

(provide 'marek-markdown-mode)
