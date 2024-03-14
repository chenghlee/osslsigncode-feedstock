#!/usr/bin/env bash
set -exu -o pipefail

mkdir build
cd build

cmake -G Ninja -S .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_PREFIX_PATH="${PREFIX}"    \
    ;

cmake --build .

# upstream tests require server component that's failing in containers
#ctest -C Release --output-on-failure

cmake --install .
