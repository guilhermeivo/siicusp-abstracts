#!/bin/bash
set -ex

WORKDIR="${PWD}"

if [ ! -d "${WORKDIR}/scripts" ]; then
  echo "${WORKDIR}/scripts does not exist."
fi

sphinx-build -b html docs/ docs/_build/html

exit 0
