(add-to-list 'package-selected-packages 'lsp-mode)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-session-file (expand-file-name ".cache/.lsp-session-v1" user-emacs-directory))
  :hook ((lsp-mode . lsp-enable-which-key-integration))
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
  :bind
  (:map dap-mode-map
   ("<F5>" . dap-continue)
   ("<F9>" . dap-breakpoint-toggle)
   ("<F10>" . dap-next)
   ("<F11>" . dap-step-in)
   ("<S-F11>" . dap-step-out)))

(provide 'marek-lsp)
