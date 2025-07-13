;; Add the modules folder to the load path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

(require 'marek-completion)
(require 'marek-dashboard)
(require 'marek-dired)
(require 'marek-general-keys)
(require 'marek-general-settings)
(require 'marek-git)
(require 'marek-help)
(require 'marek-ledger-mode)
(require 'marek-markdown-mode)
(require 'marek-org-mode)
(require 'marek-popup-menu)
(require 'marek-projects)
(require 'marek-search)
(require 'marek-theme)
(require 'marek-toolbar)
(require 'marek-treesitter)
(require 'marek-window-management)

(when LSP-P
  (require 'marek-lsp))
(when LSP-PYTHON-P
  (require 'marek-lsp-python))
(when LSP-RUST-P
  (require 'marek-lsp-rust))
(when LSP-JAVA-P
  (require 'marek-lsp-java))
