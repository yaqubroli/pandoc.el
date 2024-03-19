;;; pandoc.el --- Pandoc integration for Emacs

;; Author: ChatGPT 
;; Version: 0.1
;; Package-Requires: ((emacs "24.3"))

;;; Commentary:
;; This package provides easy Pandoc integration for Emacs, allowing users to
;; convert files to various formats with optional citation support.

;;; Code:

(defgroup pandoc nil
  "Integration with Pandoc for various document conversions."
  :prefix "pandoc-"
  :group 'external)

(defcustom pandoc-citation-styles-dir "~/.pandoc/csl/"
  "Directory where Pandoc citation style files (.csl) are stored."
  :type 'directory
  :group 'pandoc)

(defcustom pandoc-default-citation-style "apa.csl"
  "Default citation style."
  :type 'string
  :group 'pandoc)

(defun pandoc--convert (src-file dest-format &optional citation-style)
  "Convert SRC-FILE to DEST-FORMAT using Pandoc.
Optionally use CITATION-STYLE if provided."
  (let* ((dest-file (concat (file-name-sans-extension src-file) "." dest-format))
         (command (concat "pandoc " src-file " -o " dest-file)))
    (when citation-style
      (setq command (concat command " --csl=" (expand-file-name citation-style pandoc-citation-styles-dir))))
    (shell-command command)
    dest-file))

(defun pandoc-view-as (format &optional with-citations)
  "Convert current file to FORMAT and open it. Use citations if WITH-CITATIONS is non-nil."
  (interactive "sFormat: \nP")
  (let* ((src-file (buffer-file-name))
         (citation-style (if with-citations
                             (completing-read "Citation Style: " (directory-files pandoc-citation-styles-dir nil "\\.csl$") nil t)
                           pandoc-default-citation-style)) ;; Use default citation style if with-citations is non-nil but no style is selected.
         (dest-file (pandoc--convert src-file format citation-style)))
    (if (and dest-file (file-exists-p dest-file))
        (cond
         ((string-equal format "docx") (shell-command (concat "open -a 'Microsoft Word' " dest-file)))
         ((string-equal format "pdf") (shell-command (concat "open " dest-file)))
         (t (shell-command (concat "open " dest-file))))
      (message "Conversion failed or file does not exist."))))

(defun pandoc-view-in-word (&optional with-citations)
  "Convert current file to a DOCX using Pandoc and open it in Microsoft Word. With prefix argument, use citations."
  (interactive "P")
  (pandoc-view-as "docx" with-citations))

(defun pandoc-view-as-latex (&optional with-citations)
  "Convert current file to PDF using Pandoc with LaTeX and open it. With prefix argument, use citations."
  (interactive "P")
  (pandoc-view-as "pdf" with-citations))

(defun pandoc-view-as-html (&optional with-citations)
  "Convert current file to HTML using Pandoc and open it in the default browser. With prefix argument, use citations."
  (interactive "P")
  (pandoc-view-as "html" with-citations))

(defun pandoc-view-as-markdown (&optional with-citations)
  "Convert current file to Markdown using Pandoc and open it. With prefix argument, use citations."
  (interactive "P")
  (pandoc-view-as "md" with-citations))

;;; Keybindings
(global-set-key (kbd "M-p w") 'pandoc-view-in-word)
(global-set-key (kbd "M-p W") (lambda () (interactive) (pandoc-view-in-word t)))
(global-set-key (kbd "M-p l") 'pandoc-view-as-latex)
(global-set-key (kbd "M-p L") (lambda () (interactive) (pandoc-view-as-latex t)))
(global-set-key (kbd "M-p h") 'pandoc-view-as-html)
(global-set-key (kbd "M-p H") (lambda () (interactive) (pandoc-view-as-html t)))
(global-set-key (kbd "M-p m") 'pandoc-view-as-markdown)
(global-set-key (kbd "M-p M") (lambda () (interactive) (pandoc-view-as-markdown t)))

(provide 'pandoc)
;;; pandoc.el ends here
