;; use standard package manager (package.el)
(require 'package)

;; add `melpa` to `package-archives`
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; manually manage list of selected packages, so they are not added automatically to init.el
;; you can install packages with (package-install-selected-packages)
;; you can remove packages with (package-autoremove)
(setq package-selected-packages
  '(use-package))

;; initialize package manager
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; causes the packages to be installed automatically if not already present on your system
(require 'use-package-ensure)
(setq use-package-always-ensure t)
