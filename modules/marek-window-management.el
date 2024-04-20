;; ace-window
(add-to-list 'package-selected-packages 'ace-window)
(use-package ace-window
  :init
  (global-set-key (kbd "C-<tab>") 'ace-window))

;; other-window / previous-window
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; burly
(add-to-list 'package-selected-packages 'burly)
(use-package burly)

(provide 'marek-window-management)
