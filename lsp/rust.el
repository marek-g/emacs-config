(use-package! lsp-mode
  :custom
  (lsp-eldoc-render-all t)
  (lsp-rust-analyzer-server-display-inlay-hints t))

(after! lsp-ui
  (setq lsp-ui-peek-always-show t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t))
