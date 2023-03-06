;; Add the modules folder to the load path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

(require 'marek-cheatsheet)
(require 'marek-general-keys)
(require 'marek-general-settings)
(require 'marek-git)
(require 'marek-orgmode)
(require 'marek-popup-menu)
(require 'marek-projects)
(require 'marek-theme)
(require 'marek-window-management)
