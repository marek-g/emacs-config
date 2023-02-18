(after! rustic
  (set-formatter! 'rustic-mode #'rustic-cargo-fmt))

(setq rustic-lsp-server 'rust-analyzer
      rustic-format-on-save t
      lsp-rust-server 'rust-analyzer)

(after! lsp-rust
  (setq lsp-rust-analyzer-lru-capacity 100
	lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-reborrow-hints t
        lsp-rust-analyzer-display-closure-return-type-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial"
        lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names t
        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-run-build-scripts t
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy"
	lsp-eldoc-render-all t)

  (require 'dap-cpptools))

(after! lsp-ui
  (setq lsp-ui-peek-always-show t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t))

;;
;; Debugger
;;

; latest version can be found here: https://github.com/microsoft/vscode-cpptools
; install it with M-x dap-cpptools-setup
(setq dap-cpptools-extension-version "1.14.3")

(after! dap-cpptools
  ;; Add a template specific for debugging Rust programs.
  ;; It is used for new projects, where I can M-x dap-edit-debug-template
  (dap-register-debug-template "Rust::CppTools Run Configuration"
			       (list :type "cppdbg"
				     :request "launch"
				     :name "Rust::Run"
				     :MIMode "gdb"
				     :miDebuggerPath "rust-gdb"
				     :environment []
				     :program "${workspaceFolder}/target/debug/hello / replace with binary"
				     :cwd "${workspaceFolder}"
				     :console "external"
				     :dap-compilation "cargo build"
				     :dap-compilation-dir "${workspaceFolder}")))

(after! dap-mode
  (setq dap-default-terminal-kind "integrated") ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
  (dap-auto-configure-mode +1))
