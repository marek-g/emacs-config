(use-package treemacs
  :defer t
  :config
  (setq treemacs-width-is-initially-locked nil ; allow resizing
        treemacs-width 30 ; initial size
  )
  :bind
  (:map global-map
        ("<f9>" . treemacs))
)

(use-package projectile
  :diminish
  :init
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory)
	projectile-known-projects-file (expand-file-name ".cache/projectile-known-projects.eld" user-emacs-directory))
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-magit
  :after (treemacs magit))

(provide 'marek-projects)
