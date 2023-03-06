(add-to-list 'package-selected-packages 'ace-window)
(use-package ace-window
  :init
  (global-set-key (kbd "C-<tab>") 'ace-window))

(provide 'marek-window-management)