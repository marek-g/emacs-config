(add-to-list 'package-selected-packages 'which-key)
(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 0.1)
  (which-key-mode 1)
)

(add-to-list 'package-selected-packages 'marginalia)
(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :bind
  (:map minibuffer-local-map
   ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(add-to-list 'package-selected-packages 'all-the-icons-completion)
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(add-to-list 'package-selected-packages 'vertico)
(use-package vertico
  :custom
  (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :bind
  (:map vertico-map
   ("<tab>" . vertico-insert)  ; Insert selected candidate into text area
   ;; NOTE 2022-02-05: Cycle through candidate groups
   ("C-M-n" . vertico-next-group)
   ("C-M-p" . vertico-previous-group))
  :init
  (vertico-mode))

(add-to-list 'package-selected-packages 'orderless)
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(add-to-list 'package-selected-packages 'vertico-posframe)
(use-package vertico-posframe
  :config (vertico-posframe-mode 1))

(add-to-list 'package-selected-packages 'company)
(use-package company
  :diminish
  :bind (:map company-mode-map
	      ("C-SPC" . company-complete))
  :config
  (setq company-idle-delay 0.0) ;; how long to wait until popup
  (setq company-minimum-prefix-length 1)
  :hook (after-init . global-company-mode))

(provide 'marek-completion)
