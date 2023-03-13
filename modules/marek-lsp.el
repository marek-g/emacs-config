(add-to-list 'package-selected-packages 'lsp-mode)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(add-to-list 'package-selected-packages 'lsp-ui)
(use-package lsp-ui :commands lsp-ui-mode)

(add-to-list 'package-selected-packages 'lsp-treemacs)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(add-to-list 'package-selected-packages 'dap-mode)
(use-package dap-mode)

(provide 'marek-lsp)
