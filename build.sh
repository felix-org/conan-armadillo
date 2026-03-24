#!/bin/bash

ARCH=$(uname -m)

# Standard build
conan create . -s compiler.cppstd=14 --build missing

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ "$ARCH" == "arm64" ]]; then
    BUILD_PROFILE="profiles/macos-apple-silicon-profile"
    echo "Running on Apple Silicon ($ARCH)..."
  else
    BUILD_PROFILE="profiles/macos-profile"
    echo "Running on Intel Mac ($ARCH)..."
  fi

  # Android Cross-builds
  conan create . --build missing --profile:build "$BUILD_PROFILE" --profile:host profiles/android-armv7-profile -o armadillo:cmake_policy_version_minimum=3.5
  conan create . --build missing --profile:build "$BUILD_PROFILE" --profile:host profiles/android-armv8-profile -o armadillo:cmake_policy_version_minimum=3.5
else
  echo 'Cross-building profiles only provided for macOS.'
fi
