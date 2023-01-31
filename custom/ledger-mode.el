;;
;; Leger-mode configuration
;;

(setq ledger-reconcile-default-commodity "PLN")

(setq ledger-post-auto-align nil)

(setq ledger-reports
  '(("Balance PLN - Aktywa" "%(binary) -w -f %(ledger-file) -X PLN balance ^Aktywa")
    ("Balance PLN - Wszystko" "%(binary) -w -f %(ledger-file) -X PLN balance")
    ("Balance - Wszystko" "%(binary) -f %(ledger-file) balance")
    ("reg" "%(binary) -f %(ledger-file) reg")
    ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
    ("account" "%(binary) -f %(ledger-file) reg %(account)")))
