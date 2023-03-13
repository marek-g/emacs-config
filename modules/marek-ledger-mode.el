(use-package ledger-mode
  ; load from github as my patches (2022-04-14) are not on melpa yet
  :elpaca (ledger-mode :host github :repo "ledger/ledger-mode")
  :init
  (setq ledger-reconcile-default-commodity "PLN")
  (setq ledger-post-auto-align nil)
  (setq ledger-reports
    '(("Balance PLN - Aktywa" "%(binary) -w -f %(ledger-file) -X PLN balance ^Aktywa")
      ("Balance PLN - Wszystko" "%(binary) -w -f %(ledger-file) -X PLN balance")
      ("Balance - Wszystko" "%(binary) -f %(ledger-file) balance")
      ("reg" "%(binary) -f %(ledger-file) reg")
      ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
      ("account" "%(binary) -f %(ledger-file) reg %(account)")))
  :mode "\\.ledger\\'")

(provide 'marek-ledger-mode)
