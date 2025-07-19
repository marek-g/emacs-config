(add-to-list 'package-selected-packages 'treemacs)
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

(add-to-list 'package-selected-packages 'ripgrep)
(use-package ripgrep)

(use-package project
  :config
  (setq project-vc-extra-root-markers '(".project.el" ".projectile" )))

(add-to-list 'package-selected-packages 'treemacs-magit)
(use-package treemacs-magit
  :after (treemacs magit))

(provide 'marek-projects)
