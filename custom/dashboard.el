(defun doom-dashboard-draw-ascii-banner-fn ()
  (let* ((banner
          '("______  _____  _____ ___  ___"
            "|  _  \\|  _  ||  _  ||  \\/  |"
            "| | | || | | || | | || .  . |"
            "| | | || | | || | | || |\\/| |"
            "| |/ / \\ \\_/ /\\ \\_/ /| |  | |"
            "|___/   \\___/  \\___/ \\_|  |_/"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   30)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-menu-sections
  '(("Reload last session"
    :icon (all-the-icons-octicon "history" :face 'doom-dashboard-menu-title)
    :when (cond ((require 'persp-mode nil t)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
    :face (:inherit (doom-dashboard-menu-title bold))
    :action doom/quickload-session)
    ("Open org-agenda"
    :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
    :when (fboundp 'org-agenda)
    :action org-agenda)
    ("Recently opened files"
    :icon (all-the-icons-octicon "file-text" :face 'doom-dashboard-menu-title)
    :action recentf-open-files)
    ("Open project"
    :icon (all-the-icons-octicon "briefcase" :face 'doom-dashboard-menu-title)
    :action projectile-switch-project)
    ("Jump to bookmark"
    :icon (all-the-icons-octicon "bookmark" :face 'doom-dashboard-menu-title)
    :action bookmark-jump)
    ("Open private configuration"
    :icon (all-the-icons-octicon "tools" :face 'doom-dashboard-menu-title)
    :when (file-directory-p doom-private-dir)
    :action doom/open-private-config)
    ("Open documentation"
    :icon (all-the-icons-octicon "book" :face 'doom-dashboard-menu-title)
    :action doom/help)))
