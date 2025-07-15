(add-to-list 'package-selected-packages 'dashboard)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :config
  (when (not ANDROID-P)
    (setq
     dashboard-startup-banner (concat user-emacs-directory "media/xemacs_color.svg")))
  (setq
   dashboard-set-navigator t
   dashboard-center-content t
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-set-footer nil
   dashboard-agenda-release-buffers t
   dashboard-projects-backend 'project-el
   dashboard-items '((recents . 5)
                     (bookmarks . 5)
                     (projects . 5)
                     (agenda . 5)
                     ;(registers . 5)
		     )
   )
  )

(provide 'marek-dashboard)
