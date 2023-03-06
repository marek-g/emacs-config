(add-to-list 'package-selected-packages 'popup-edit-menu)
(use-package popup-edit-menu
  :config
  (global-set-key [mouse-3] (popup-edit-menu-stub)))

(provide 'marek-popup-menu)