(add-to-list 'package-selected-packages 'ace-window)
(use-package ace-window
  :init
  (global-set-key (kbd "C-<tab>") 'ace-window))

(add-to-list 'package-selected-packages 'burly)
(use-package burly)

(provide 'marek-window-management)