(add-to-list 'package-selected-packages 'lsp-mode)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
		lsp-session-file (expand-file-name ".cache/.lsp-session-v1" user-emacs-directory))

  :custom
  ;; Mouse movement evants interrupt commands like ctrl+x b or isearch
  ;; when the mouse is moved after the first key press
  ;; so we have to remove tooltips unfortunately until better solution is found
  ;; see: https://github.com/emacs-lsp/lsp-ui/issues/607
  (lsp-ui-doc-enable nil)
  
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

;; DAP mode (debugging)
(add-to-list 'package-selected-packages 'dap-mode)
(use-package dap-mode
  :after lsp-mode
  :config
  ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
  (setq dap-default-terminal-kind "integrated")
  ;; Remove tooltip from features
  ;; Mouse movement evants interrupt commands like ctrl+x b or isearch
  ;; when the mouse is moved after the first key press
  ;; so we have to remove tooltips unfortunately until better solution is found
  ;; see: https://github.com/emacs-lsp/lsp-ui/issues/607
  ;;(setq dap-auto-configure-features '(sessions locals controls tooltip)
  (setq dap-auto-configure-features '(sessions locals controls))
  (dap-auto-configure-mode))

(provide 'marek-lsp)
