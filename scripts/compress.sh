#!/usr/bin/env bash

set -e

WORKDIR="${PWD}"
PKG=${1:-"siicusp-abstracts"}

TAG=$(git tag --sort=-v:refname | head -n1)

if [ -z "$TAG" ]; then
    TAG="v0.0.0"
fi

VERSION="${TAG#v}"

OUT="$WORKDIR/dist"
ZIP="${PKG}-${VERSION}.zip"

rm -rf "$OUT"
mkdir -p "$OUT/$PKG"

cp "$WORKDIR/${PKG}.dtx" "$OUT/$PKG/"
cp "$WORKDIR/${PKG}.ins" "$OUT/$PKG/"
cp "$WORKDIR/README" "$OUT/$PKG/"

if [ -f "$WORKDIR/LICENSE" ]; then
    cp "$WORKDIR/LICENSE" "$OUT/$PKG/"
fi

if [ -f "$WORKDIR/${PKG}.pdf" ]; then
    cp "$WORKDIR/${PKG}.pdf" "$OUT/$PKG/"
fi

if [ -f "$WORKDIR/${PKG}-logo.png" ]; then
    cp "$WORKDIR/${PKG}-logo.png" "$OUT/$PKG/"
fi

cp "$WORKDIR/examples/${PKG}-model.tex" "$OUT/$PKG/"

if [ -f "$WORKDIR/examples/${PKG}-model.pdf" ]; then
    cp "$WORKDIR/examples/${PKG}-model.pdf" "$OUT/$PKG/"
fi

cd "$OUT"

zip -r "$ZIP" "$PKG" >/dev/null

echo
echo "Release:"
echo "$OUT/$ZIP"

echo
echo "Content:"
unzip -l "$OUT/$ZIP"