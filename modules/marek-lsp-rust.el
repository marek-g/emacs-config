(add-to-list 'package-selected-packages 'rustic)
(use-package rustic
  :config
  (setq rustic-format-on-save t)
  :hook ((rust-mode . lsp-deferred)))

(provide 'marek-lsp-rust)
