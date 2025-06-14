#!/bin/bash

# Configure debug build
(
  mkdir -p build/Debug
  cmake -DCMAKE_BUILD_TYPE=Debug -Wno-deprecated -DBUILD_EXAMPLES=0 -B build/Debug -S .
)

(
  # utilizing cmake's parallel build options
  # for cmake >= 3.12: -j <number of processor cores + 1>
  # for older cmake: -- -j5
  cmake --build build/Debug -j 9
)

result=$?
if [ ${result} == 0 ]; then
  cd ./bin
  lldb -o run ./Allolib-Kickstart
fi
fi