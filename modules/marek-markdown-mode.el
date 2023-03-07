(add-to-list 'package-selected-packages 'markdown-mode)
(use-package markdown-mode
  :commands (markdown-mode gfm-mode) ; gfm-mode - markdown-mode + GitHub Flavored Markdown
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)))

(provide 'marek-markdown-mode)
