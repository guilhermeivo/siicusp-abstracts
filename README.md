# siicusp-abstracts #

LaTeX package for formatting scientific abstracts according to **Simpósio
Internacional de Iniciação Científica e Tecnológica da USP (SIICUSP)**
requirements.

## Description ##

The `siicusp-abstracts` package provides a LaTeX style for preparing scientific
abstracts according to the formatting requirements of the SIICUSP symposium.
It configures page layout, typography, title information, institutional
header elements, and bibliography formatting.

## Disclaimer ##

This package is an independent project and has no official affiliation with
the SIICUSP organizing committee.

It was created to help authors prepare scientific abstracts using the SIICUSP
formatting guidelines. Before submitting an abstract, users should consult the
latest official guidelines provided by SIICUSP, as submission requirements may
change over time.

## Installation ##

### From source ###

Clone the repository:

```bash
git clone https://github.com/guilhermeivo/siicusp-abstracts.git
```

Generate the package files:

```bash
./scripts/install.sh
```

This will create:

```text
siicusp-abstracts.sty
```

The generated package file is automatically placed in a directory searched by
TeX. Alternatively, the file can be kept in the same directory as your
document for local use.

## License ##

This package is distributed under the terms of the
LaTeX Project Public License (LPPL), version 1.3c or later.

The complete license text is available at:

https://www.latex-project.org/lppl/

## Files ##

- `siicusp-abstracts-logo.png` - logo provided by the user
- `siicusp-abstracts.dtx` - documented source file
- `siicusp-abstracts.ins` - installation script
- `siicusp-abstracts.sty` - generated LaTeX package
- `siicusp-abstracts.pdf` - package documentation
