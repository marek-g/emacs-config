(add-to-list 'package-selected-packages 'lsp-pyright)
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(provide 'marek-lsp-python)
