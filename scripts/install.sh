#!/bin/bash
set -ex

WORKDIR="${PWD}"
PKG=${1:-"siicusp"}

if [ ! -d "${WORKDIR}/scripts" ]; then
  echo "${WORKDIR}/scripts does not exist."
fi

yes | latex "${PKG}".ins

pdflatex "${PKG}".dtx

makeindex -s gind.ist -o "${PKG}".ind "${PKG}".idx # \index{}
makeindex -s gglo.ist -o "${PKG}".gls "${PKG}".glo # \changes{}

pdflatex "${PKG}".dtx
pdflatex "${PKG}".dtx

TEXMFHOME=$(kpsewhich -var-value TEXMFHOME)
mkdir -p ${TEXMFHOME}/tex/latex/${PKG}/
#mkdir -p ${TEXMFHOME}/bibtex/bst/

cp ${WORKDIR}/${PKG}.sty $TEXMFHOME/tex/latex/${PKG}/
cp ${WORKDIR}/logo.png $TEXMFHOME/tex/latex/${PKG}/

texhash
mktexlsr "$TEXMFHOME"

cd examples
lualatex model
grep -q "\\citation" model.aux && bibtex model
lualatex model
lualatex model

exit 0
