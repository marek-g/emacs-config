(use-package! lsp-java
  :after lsp-mode
  :preface
  (setq lsp-java-workspace-dir (expand-file-name "~/work/projects/java-workspace/"))
  (add-hook 'java-mode-hook 'lsp))
