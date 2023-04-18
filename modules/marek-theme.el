;;
;; Loads a nice blue theme.
;;

(load-theme 'deeper-blue t)

;;
;; Change some colors
;;

(set-face-foreground 'font-lock-comment-face "forest green") ; comment
(set-face-foreground 'font-lock-doc-face "lime green") ; doc comment

(set-face-background 'mode-line "chocolate") ; mode-line background

;;
;; Change terminal ansi colors
;;

(custom-set-faces
 `(ansi-color-red ((t (:foreground "deep pink"))))
 `(ansi-color-green ((t (:foreground "green yellow"))))
 `(ansi-color-yellow ((t (:foreground "gold"))))
 `(ansi-color-blue ((t (:foreground "turquoise"))))
 `(ansi-color-magenta ((t (:foreground "violet"))))
 `(ansi-color-cyan ((t (:foreground "aquamarine")))))

;;
;; Default font
;;

(when DESKTOP-P
  (let ((my-font (font-spec :family "Iosevka" :weight 'normal :width 'expanded :size 16)))
    (unless (find-font my-font) (setq my-font (font-spec :size 16)))
    (set-frame-font my-font nil t)
  )
)

;;
;; Icons
;;

(add-to-list 'package-selected-packages 'all-the-icons)
(use-package all-the-icons
  :if (display-graphic-p))

;;
;; Display clock
;;

(setq display-time-24hr-format t)
(setq display-time-default-load-average nil) ; do not display CPU usage

 (defface egoge-display-time
   '((((type x w32 mac))
      (:foreground "gold" :inherit bold))
     (((type tty))
      (:foreground "gold")))
   "Face used to display the time in the mode line.")

 ;; This causes the current time in the mode line to be displayed in
 ;; `egoge-display-time-face' to make it stand out visually.
 (setq display-time-string-forms
       '((propertize (concat " " 24-hours ":" minutes " ")
 		    'face 'egoge-display-time)))

(display-time-mode 1)


(provide 'marek-theme)
