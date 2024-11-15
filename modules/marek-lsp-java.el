(add-to-list 'package-selected-packages 'lsp-java)
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))

(provide 'marek-lsp-java)
