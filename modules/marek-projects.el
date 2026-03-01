(use-package treemacs
  :defer t
  :config
  (setq treemacs-width-is-initially-locked nil ; allow resizing
        treemacs-width 30 ; initial size
	)
  ;; single mouse click expands a folder and opens a file
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  :bind
  (:map global-map
        ("<f9>" . treemacs))
)

(use-package ripgrep)

(use-package project
  :ensure nil
  :config
  (setq project-vc-extra-root-markers '(".project.el" ".projectile" )))

(use-package treemacs-magit
  :after (treemacs magit))

(provide 'marek-projects)
