;;
;; You need to call `M-x dap-cpptools-setup`.
;; Then you can open a project and 'M-x dap-edit-debug-template' to set up the template.
;;

(add-to-list 'package-selected-packages 'rustic)

;; make rust-mode to derive from rust-ts-mode
;; as rustic is based on rust-mode
;; (currently buggy - reports errors with using)
;; (use-package rust-mode
;;   :defer t
;;   :init
;;   (setq rust-mode-treesitter-derive t))

(use-package rustic
  :config
  (setq rustic-format-on-save t)

  (setq rustic-ansi-faces ["black"
                              "deep pink"
                              "green yellow"
                              "gold"
                              "turquoise"
                              "violet"
                              "aquamarine"
                              "white"])

  :hook (rust-mode . lsp-deferred))

(provide 'marek-lsp-rust)
