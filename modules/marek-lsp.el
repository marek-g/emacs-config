(add-to-list 'package-selected-packages 'lsp-mode)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-session-file (expand-file-name ".cache/.lsp-session-v1" user-emacs-directory))
  :hook (lsp-mode . (lambda () (lsp-enable-which-key-integration) (superword-mode t)))
  :commands (lsp lsp-deferred)
  :bind
  (:map lsp-mode-map
	("C-." . lsp-execute-code-action)
	("M-RET" . lsp-execute-code-action)
	("<f12>" . lsp-find-definition)
	("M-<f12>" . lsp-find-type-definition)
	("C-<f12>" . lsp-find-declaration)
	("S-<f12>" . lsp-find-references)
	)
  )

(add-to-list 'package-selected-packages 'lsp-ui)
(use-package lsp-ui :commands lsp-ui-mode)

(add-to-list 'package-selected-packages 'lsp-treemacs)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list
  :custom
  (lsp-treemacs-sync-mode 1))

(add-to-list 'package-selected-packages 'yasnippet)
(use-package yasnippet
  :ensure t
  :hook ((lsp-mode . yas-minor-mode)))

(add-to-list 'package-selected-packages 'dap-mode)
(use-package dap-mode
  :commands dap-debug
  :bind
  ;; (("<F5>" . dap-continue)
  ;;  ("<F9>" . dap-breakpoint-toggle)
  ;;  ("<F10>" . dap-next)
  ;;  ("<F11>" . dap-step-in)
  ;;  ("<S-F11>" . dap-step-out))
  ;; (:map dap-mode-map
  ;;  ("<F5>" . dap-continue)
  ;;  ("<F9>" . dap-breakpoint-toggle)
  ;;  ("<F10>" . dap-next)
  ;;  ("<F11>" . dap-step-in)
  ;;  ("<S-F11>" . dap-step-out))
  :config
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra))))

(provide 'marek-lsp)
