mkdir build
cd build

cmake -G Ninja -S .. ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX%\Library ^
    -DCMAKE_PREFIX_PATH=%PREFIX%\Library

cmake --build .

REM upstream tests require server component that's failing in containers
REM ctest -C Release --output-on-failure

cmake --install .
