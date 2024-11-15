(add-to-list 'package-selected-packages 'async)
(use-package dired
  :ensure nil
  :init
  (use-package async :ensure t)
  (dired-async-mode t))

(provide 'marek-dired)
