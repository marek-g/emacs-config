(add-to-list 'package-selected-packages 'ledger-mode)
(use-package ledger-mode
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
  (custom-set-faces '(ledger-font-payee-uncleared-face ((t (:inherit nil :foreground "orange red")))))
  :config
  (unbind-key "S-<up>" ledger-mode-map)
  (unbind-key "S-<down>" ledger-mode-map)
  :mode "\\.ledger\\'")

(provide 'marek-ledger-mode)
