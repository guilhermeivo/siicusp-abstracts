#!/bin/bash
set -ex

WORKDIR="${PWD}"
PKG=${1:-"siicusp-abstracts"}

if [ ! -d "${WORKDIR}/scripts" ]; then
  echo "${WORKDIR}/scripts does not exist."
fi

yes | latex "${PKG}".ins

pdflatex -jobname="${PKG}-doc" "${PKG}".dtx

makeindex -s gind.ist -o "${PKG}-doc".ind "${PKG}-doc".idx # \index{}
makeindex -s gglo.ist -o "${PKG}-doc".gls "${PKG}-doc".glo # \changes{}

pdflatex -jobname="${PKG}-doc" "${PKG}".dtx
pdflatex -jobname="${PKG}-doc" "${PKG}".dtx

TEXMFHOME=$(kpsewhich -var-value TEXMFHOME)
mkdir -p ${TEXMFHOME}/tex/latex/${PKG}/
#mkdir -p ${TEXMFHOME}/bibtex/bst/

cp ${WORKDIR}/${PKG}.sty $TEXMFHOME/tex/latex/${PKG}/
cp ${WORKDIR}/siicusp-abstracts-logo.png $TEXMFHOME/tex/latex/${PKG}/

texhash
mktexlsr "$TEXMFHOME"

cd examples
lualatex ${PKG}-model
grep -q "\\citation" ${PKG}-model.aux && bibtex ${PKG}-model
lualatex ${PKG}-model
lualatex ${PKG}-model

exit 0
