# latexmk configuration for project-management.tex
#
# Local build:  latexmk project-management.tex
# CI build:     .github/workflows/build.yml  (xu-cheng/latex-action, latexmk driver)

# --- Engine -----------------------------------------------------------------
# The preamble uses fontspec, so pdfLaTeX cannot be used: XeLaTeX (or LuaLaTeX).
$pdf_mode = 5;                                      # 5 => run xelatex to make the PDF
$pdflatex = 'xelatex -interaction=nonstopmode -file-line-error %O %S';

# --- Shell escape -----------------------------------------------------------
# minted (Pygments) and the markdown package shell out to external helpers.
$shell_escape = 1;

# --- Output -----------------------------------------------------------------
# Aux files and the PDF land in build/, which is already git-ignored.
$out_dir = 'build';
$aux_dir = 'build';

# --- Behaviour --------------------------------------------------------------
$halt_on_error = 1;    # stop at the first TeX error (same as -halt-on-error)
$synctex       = 1;    # forward/inverse search from the editor
$max_repeat    = 5;    # enough passes to settle refs / toc / longtable
$pdf_previewer = '';   # never try to spawn a PDF viewer (CI / headless)
