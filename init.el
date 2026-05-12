;; initilize package manager
(load (expand-file-name "package-manager-init.el" user-emacs-directory))

;; use environemnt variables (like PATH) from shell (bash, zsh, fish)
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x pgtk))
    (exec-path-from-shell-initialize)))

;; load all modules
(load (expand-file-name "modules-load.el" user-emacs-directory))
