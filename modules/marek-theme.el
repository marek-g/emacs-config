;;
;; Loads a nice blue theme.
;;

;;(load-theme 'deeper-blue t)
;;(load-theme `modus-vivendi t)
;;(load-theme `fleury t)

(add-to-list 'package-selected-packages 'doom-themes)
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(add-to-list 'package-selected-packages 'color-theme-modern)
(use-package color-theme-modern
  :ensure t
  :after doom-themes
  :config
  (load-theme (cond
   (EINK-TABLET-P 'modus-operandi)
   (WORK-LINUX-P 'lawrence)
   (t 'doom-horizon)
  ) t)
)

;; Set default cursor type
(setq-default cursor-type 'box)

;;
;; Change some colors
;;

(set-face-foreground 'font-lock-comment-face "forest green") ; comment
(set-face-foreground 'font-lock-doc-face "lime green") ; doc comment

;;
;; Mode-line look
;;

(set-face-attribute 'mode-line nil :background "gray75" :foreground "black" :box `(:line-width 1 :style released-button))
(set-face-attribute 'mode-line-buffer-id nil :weight `bold :background `unspecified :foreground "gray30")
(set-face-attribute 'mode-line-inactive nil :background "gray40" :foreground "black" :box `(:line-width 1 :color "gray40" :style nil))
;(set-face-background 'mode-line "chocolate") ; mode-line background

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

;; (when DESKTOP-P
;;   (let ((my-font (font-spec :family "Iosevka" :weight 'normal :width 'expanded :size 12)))
;;     (unless (find-font my-font) (setq my-font (font-spec :size 12)))
;;     (set-frame-font my-font nil t)
;;   )
;; )
(set-frame-font "Monospace-12" nil t)

;;
;; Scale
;;

(when ANDROID-P
  (global-text-scale-adjust 8)
  )

;;
;; Icons
;;

(add-to-list 'package-selected-packages 'all-the-icons)
(use-package all-the-icons
  :if (display-graphic-p))

;;
;; Prism - color code based on depth
;;

(add-to-list 'package-selected-packages 'prism)
(use-package prism
  :config
  (add-hook 'emacs-lisp-mode-hook 'prism-mode)
  (prism-set-colors
    :num 32
    :desaturations (cl-loop for i from 0 below 32
			    collect (* i 2.5))
    :lightens (cl-loop for i from 0 below 32
		       collect 0)
    :colors (list "#fb00b3" ;; magenta
		  "#f41239" ;; r
		  "#e17756" ;; o
		  "#c8c256" ;; y
		  "#03ce56" ;; g
		  "#00a0ee" ;; c
		  "#4750ff" ;; b
		  "#a136ff") ;; purp
    :comments-fn
    (lambda (color)
      (prism-blend color
		   (face-attribute 'font-lock-comment-face :foreground) 0.25))
    :strings-fn
    (lambda (color)
	    (prism-blend color "white" 0.75))))

;;
;; Org-mode
;;

;(setq org-fontify-whole-heading-line t)
;(set-face-attribute 'org-document-title nil :height 2.0)
;(set-face-attribute 'org-level-1 nil :foreground "#AF0" :background "#121" :height 1.3 :overline "#050")
;(set-face-attribute 'org-level-2 nil :foreground "#0F0" :height 1.1)
;(set-face-attribute 'org-level-3 nil :foreground "#0FF" :height 1.0)
;(set-face-attribute 'org-level-4 nil :foreground "#0AA" :height 1.0)
;(set-face-attribute 'org-level-5 nil :foreground "#088" :height 1.0)
;(set-face-attribute 'org-level-6 nil :foreground "#055" :height 1.0)
;(set-face-attribute 'org-block-begin-line nil :background "#010" :overline "grey")
;(set-face-attribute 'org-block nil :background "#010")
;(set-face-attribute 'org-block-end-line nil :background "#010" :underline "grey" :overline nil)
;(set-face-attribute 'org-verbatim nil :foreground "orange")

;;
;; Mode-line - group all minor modes in a nested menu
;;

(add-to-list 'package-selected-packages 'minions)
(use-package minions
  ;:custom
  ;(minions-mode-line-lighter "⚙")
  :config
  (minions-mode))

;;
;; Tab-bar
;;

(tab-bar-mode t)

(set-face-attribute 'tab-bar nil
                    :background "#1c1c1c"
                    :foreground "#ffffff")

(set-face-attribute 'tab-bar-tab nil
                    :background "#3a3a3a"
                    :foreground "#ffccff"
                    :box '(:line-width 2 :color "#3a3a3a"))

(set-face-attribute 'tab-bar-tab-inactive nil
                    :background "#2a2a2a"
                    :foreground "#888888")

;; add menu icon to the tab-bar
(add-to-list 'tab-bar-format #'tab-bar-format-menu-bar)

;;
;; Clock on tab-bar
;;

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

;; add clock to the tab-bar
(add-to-list 'tab-bar-format 'tab-bar-format-align-right 'append)
(add-to-list 'tab-bar-format 'tab-bar-format-global 'append)
(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil) ; do not display CPU usage
(display-time-mode 1)

(provide 'marek-theme)
