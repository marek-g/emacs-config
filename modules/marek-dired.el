(use-package dired
  :ensure nil
  :init
  (use-package async)
  (dired-async-mode t))

(provide 'marek-dired)
