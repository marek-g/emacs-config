(add-to-list 'package-selected-packages 'lsp-pyright)
(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
			 (require 'dap-python)
			 ;; if you installed debugpy, you need to set this
			 ;; https://github.com/emacs-lsp/dap-mode/issues/306
			 (setq dap-python-debugger 'debugpy)
                         (lsp-deferred))))

(provide 'marek-lsp-python)
