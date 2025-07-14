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

(add-to-list 'package-selected-packages 'projectile)
(use-package projectile
  :diminish
  :init
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory)
	projectile-known-projects-file (expand-file-name ".cache/projectile-known-projects.eld" user-emacs-directory))

  (projectile-add-known-project "~/.config/emacs")
  (when HOME-LINUX-P
    (setq projectile-project-search-path `(("~/Ext/Src" . 3) "~/Ext/dokumenty/Notatki")
	  ))

  ;; projectile's bug workaround
  ;; https://github.com/bbatsov/projectile/issues/1816
  ;; cannot create files (find-file) when
  ;; you don't have permissions to
  ;; some subfolder on the path to the file
  (defun my-safe-projectile-expand-file-name-wildcard (old-func &rest args)
  "Swallow errors and return the same fallback as original function."
  (condition-case nil
      (apply old-func args)
    (file-error (expand-file-name (car args) (cadr args)))))
(advice-add #'projectile-expand-file-name-wildcard :around #'my-safe-projectile-expand-file-name-wildcard)


  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(add-to-list 'package-selected-packages 'treemacs-projectile)
(use-package treemacs-projectile
  :after (treemacs projectile))

(add-to-list 'package-selected-packages 'treemacs-magit)
(use-package treemacs-magit
  :after (treemacs magit))

(provide 'marek-projects)
