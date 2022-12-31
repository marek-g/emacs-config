(after! persp-mode
  ;; display current project when switching projects
  (setq projectile-current-project-on-switch 'keep)

  ;; after selecting a project to switch to, you’ll be prompted to specify the action to take
  (setq projectile-switch-project-action #'projectile-commander))
