(add-to-list 'package-selected-packages 'which-key)
(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 0.1)
  (which-key-mode 1)
)

(provide 'marek-completion)
