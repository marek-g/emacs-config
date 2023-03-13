;;
;; Loads a nice blue theme.
;;

(load-theme 'deeper-blue t)

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

(use-package all-the-icons
  :if (display-graphic-p))

;;
;; Display clock
;;

(setq display-time-24hr-format t)
(setq display-time-default-load-average nil) ; do not display CPU usage

 (defface egoge-display-time
   '((((type x w32 mac))
      (:foreground "#AA6000" :inherit bold))
     (((type tty))
      (:foreground "yellow")))
   "Face used to display the time in the mode line.")

 ;; This causes the current time in the mode line to be displayed in
 ;; `egoge-display-time-face' to make it stand out visually.
 (setq display-time-string-forms
       '((propertize (concat " " 24-hours ":" minutes " ")
 		    'face 'egoge-display-time)))

(display-time-mode 1)


(provide 'marek-theme)
