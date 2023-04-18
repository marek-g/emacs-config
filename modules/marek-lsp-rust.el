;;
;; You need to call `M-x dap-cpptools-setup`.
;; Then you can open a project and 'M-x dap-edit-debug-template' to set up the template.
;;

(add-to-list 'package-selected-packages 'rustic)
(add-to-list 'package-selected-packages 'dap-cpptools)
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

  :hook ((rust-mode .  (lambda ()
			 (require 'dap-cpptools)

			 (with-eval-after-load 'dap-cpptools
			   ;; Add a template specific for debugging Rust programs.
			   ;; It is used for new projects, where I can 'M-x dap-edit-debug-template'
			   (dap-register-debug-template "Rust::CppTools Run Configuration"
							(list :type "cppdbg"
							      :request "launch"
							      :name "Rust::Run"
							      :MIMode "gdb"
							      :miDebuggerPath "rust-gdb"
							      :environment []
							      :program "/home/marek/Ext/.cargo_cache/debug/speech_recognition_test"
							      :cwd "${workspaceFolder}"
							      :console "external"
							      :dap-compilation "cargo build"
							      :dap-compilation-dir "${workspaceFolder}")))


			 (with-eval-after-load 'dap-mode
			   (setq dap-default-terminal-kind "integrated") ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
			   (dap-auto-configure-mode +1))
			 
			 (lsp-deferred))))
  )

(provide 'marek-lsp-rust)
