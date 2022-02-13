#!/bin/bash
set -eu

PATH_ROOT="${HOME}/git/"

if [ $# -ne 1 ]; then
	echo "usage: clone.sh <remote repository>"
	exec bash
fi

target=$(echo "${1}" | sed -e 's/^.*@//' -e 's/:/\//' -e 's/\.git$//')

target_dir=$(dirname "${PATH_ROOT}${target}")
echo "${PATH_ROOT}${target}"
test -d "${PATH_ROOT}${target}" || (mkdir -p ${target_dir}; cd "${target_dir}"; git clone "${1}")
cd "${PATH_ROOT}${target}" && git pull
cd "${PATH_ROOT}${target}"
exec bash
