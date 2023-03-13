(add-to-list 'package-selected-packages 'magit)
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(provide 'marek-git)
