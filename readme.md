# pandoc.el

An Emacs package for integrating Pandoc, allowing for easy conversion of documents to various formats directly within Emacs. This package provides functions to convert and view documents in formats such as DOCX, PDF (via LaTeX), HTML, and Markdown. It supports optional citation styles for academic and professional document formatting. This package was created with the assistance of OpenAI's ChatGPT.

## Features

- Convert documents to multiple formats: DOCX, PDF, HTML, and Markdown.
- Optional support for citations across all formats, with customizable citation styles.
- Integration with Microsoft Word for DOCX viewing (macOS only), and system default applications for PDF, HTML, and Markdown.
- Customizable citation styles directory and default citation style.
- Easy-to-use interactive functions.
- Default keybindings for quick access to conversion functions.

## Installation

1. Ensure Pandoc is installed on your system. If not, please install Pandoc from [the Pandoc website](https://pandoc.org/installing.html) or use a package manager.
2. Download `pandoc.el` and place it in your Emacs `load-path`.
3. Add `(require 'pandoc)` to your Emacs configuration file (e.g., `init.el` or `.emacs`).

### Using straight.el

To install `pandoc.el` using `straight.el`, add the following to your Emacs configuration file (e.g., `init.el` or `.emacs`):

```emacs-lisp
(straight-use-package
 '(pandoc :type git :host github :repo "yourusername/pandoc.el"))```

### Customization

To include instructions for installing pandoc.el using straight.el and customizing the citation styles directory and default citation style, you can amend the README.md like this:

markdown

# pandoc.el

An Emacs package for integrating Pandoc, allowing for easy conversion of documents to various formats directly within Emacs. This package provides functions to convert and view documents in formats such as DOCX, PDF (via LaTeX), HTML, and Markdown. It supports optional citation styles for academic and professional document formatting. This package was created with the assistance of OpenAI's ChatGPT.

## Features

- Convert documents to multiple formats: DOCX, PDF, HTML, and Markdown.
- Optional support for citations across all formats, with customizable citation styles.
- Integration with Microsoft Word for DOCX viewing (macOS only), and system default applications for PDF, HTML, and Markdown.
- Customizable citation styles directory and default citation style.
- Easy-to-use interactive functions.
- Default keybindings for quick access to conversion functions.

## Installation

### Prerequisites

Ensure Pandoc is installed on your system. If not, please install Pandoc from [the Pandoc website](https://pandoc.org/installing.html) or use a package manager.

### Using straight.el

To install `pandoc.el` using `straight.el`, add the following to your Emacs configuration file (e.g., `init.el` or `.emacs`):

```emacs-lisp
(straight-use-package
 '(pandoc :type git :host github :repo "yourusername/pandoc.el"))

Customization

After installation, customize the citation styles directory and default citation style by adding the following to your Emacs configuration:

```emacs-lisp
(setq pandoc-citation-styles-dir "/path/to/your/citation/styles/")
(setq pandoc-default-citation-style "your-default-style.csl")```

## Usage

This package provides several interactive functions, which you can call with `M-x` followed by the function name:

- `pandoc-view-in-word`: Convert the current file to DOCX format and open it in Microsoft Word. Add a prefix argument (`C-u`) to include citations.
- `pandoc-view-as-latex`: Convert the current file to PDF using LaTeX and open it. Add a prefix argument to include citations.
- `pandoc-view-as-html`: Convert the current file to HTML and open it in the default web browser. Add a prefix argument to include citations.
- `pandoc-view-as-markdown`: Convert the current file to Markdown and open it. Add a prefix argument to include citations.

### Customization

You can customize the directory where Pandoc citation style files (.csl) are stored and the default citation style by setting `pandoc-citation-styles-dir` and `pandoc-default-citation-style` respectively in your Emacs configuration.

### Keybindings

Default keybindings are provided for convenience:

- `M-p w`: View in Word without citations.
- `M-p W`: View in Word with citations.
- `M-p l`: View as LaTeX (PDF) without citations.
- `M-p L`: View as LaTeX (PDF) with citations.
- `M-p h`: View as HTML without citations.
- `M-p H`: View as HTML with citations.
- `M-p m`: View as Markdown without citations.
- `M-p M`: View as Markdown with citations.

## Acknowledgments

This package was created with the assistance of OpenAI's ChatGPT. It is intended for educational and practical use, with hopes that it enhances your productivity within Emacs.
