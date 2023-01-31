; EAF - Emacs Application Framework
; Needs to be installed manually first: https://github.com/emacs-eaf/emacs-application-framework
; TODO:
; See here for more config ideas: https://github.com/abougouffa/dotfiles
(use-package! eaf
  :if (string= (system-name) "marek-linux")
  :load-path "~/Programy/edit/emacs-application-framework"
  :init
  :custom

  (eaf-kill-process-after-last-buffer-closed t)
  ;(eaf-config-location (expand-file-name (locate-user-emacs-file "eaf/"))

  ; web engine
  (browse-url-browser-function 'eaf-open-browser) ;; Make EAF Browser my default browser
  (eaf-webengine-download-path "~/Pobrane")
  (eaf-browser-continue-where-left-off nil)
  (eaf-browser-enable-adblocker t)
  (eaf-webengine-enable-scrollbar t)
  (eaf-webengine-scroll-step 200)
  (eaf-webengine-default-zoom 1.25)
  (eaf-webengine-show-hover-link t)

  ; web browser
  (eaf-browser-continue-where-left-off nil)
  (eaf-browser-remember-history nil)
  (eaf-browser-blank-page-url "https://www.duckduckgo.com")
  (eaf-browser-default-search-engine "duckduckgo")

  :config
  (defalias 'browse-web #'eaf-open-browser)

  (require 'eaf-file-manager)
  (require 'eaf-music-player)
  (require 'eaf-image-viewer)
  ;(require 'eaf-camera)
  ;(require 'eaf-demo)
  ;(require 'eaf-airshare)
  (require 'eaf-terminal)
  (require 'eaf-markdown-previewer)
  ;(require 'eaf-video-player)
  ;(require 'eaf-vue-demo)
  (require 'eaf-file-sender)
  (require 'eaf-pdf-viewer)
  ;(require 'eaf-mindmap)
  ;(require 'eaf-netease-cloud-music)
  ;(require 'eaf-jupyter)
  (require 'eaf-org-previewer)
  (require 'eaf-system-monitor)
  (require 'eaf-rss-reader)
  (require 'eaf-file-browser)
  (require 'eaf-browser)
  (require 'eaf-org-previewer)
  ;(require 'eaf-mail)
  ;(require 'eaf-git)
  (when (display-graphic-p)
    (require 'eaf-all-the-icons))
)
