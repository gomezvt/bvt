#!/bin/sh
set -e

echo "mkdir -p $***REMOVED***CONFIGURATION_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"
mkdir -p "$***REMOVED***CONFIGURATION_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"

SWIFT_STDLIB_PATH="$***REMOVED***DT_TOOLCHAIN_DIR***REMOVED***/usr/lib/swift/$***REMOVED***PLATFORM_NAME***REMOVED***"

install_framework()
***REMOVED***
  if [ -r "$***REMOVED***BUILT_PRODUCTS_DIR***REMOVED***/$1" ]; then
    local source="$***REMOVED***BUILT_PRODUCTS_DIR***REMOVED***/$1"
  elif [ -r "$***REMOVED***BUILT_PRODUCTS_DIR***REMOVED***/$(basename "$1")" ]; then
    local source="$***REMOVED***BUILT_PRODUCTS_DIR***REMOVED***/$(basename "$1")"
  elif [ -r "$1" ]; then
    local source="$1"
  fi

  local destination="$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"

  if [ -L "$***REMOVED***source***REMOVED***" ]; then
      echo "Symlinked..."
      source="$(readlink "$***REMOVED***source***REMOVED***")"
  fi

  # use filter instead of exclude so missing patterns dont' throw errors
  echo "rsync -av --filter \"- CVS/\" --filter \"- .svn/\" --filter \"- .git/\" --filter \"- .hg/\" --filter \"- Headers\" --filter \"- PrivateHeaders\" --filter \"- Modules\" \"$***REMOVED***source***REMOVED***\" \"$***REMOVED***destination***REMOVED***\""
  rsync -av --filter "- CVS/" --filter "- .svn/" --filter "- .git/" --filter "- .hg/" --filter "- Headers" --filter "- PrivateHeaders" --filter "- Modules" "$***REMOVED***source***REMOVED***" "$***REMOVED***destination***REMOVED***"

  local basename
  basename="$(basename -s .framework "$1")"
  binary="$***REMOVED***destination***REMOVED***/$***REMOVED***basename***REMOVED***.framework/$***REMOVED***basename***REMOVED***"
  if ! [ -r "$binary" ]; then
    binary="$***REMOVED***destination***REMOVED***/$***REMOVED***basename***REMOVED***"
  fi

  # Strip invalid architectures so "fat" simulator / device frameworks work on device
  if [[ "$(file "$binary")" == *"dynamically linked shared library"* ]]; then
    strip_invalid_archs "$binary"
  fi

  # Resign the code if required by the build settings to avoid unstable apps
  code_sign_if_enabled "$***REMOVED***destination***REMOVED***/$(basename "$1")"

  # Embed linked Swift runtime libraries. No longer necessary as of Xcode 7.
  if [ "$***REMOVED***XCODE_VERSION_MAJOR***REMOVED***" -lt 7 ]; then
    local swift_runtime_libs
    swift_runtime_libs=$(xcrun otool -LX "$binary" | grep --color=never @rpath/libswift | sed -E s/@rpath\\/\(.+dylib\).*/\\1/g | uniq -u  && exit $***REMOVED***PIPESTATUS[0]***REMOVED***)
    for lib in $swift_runtime_libs; do
      echo "rsync -auv \"$***REMOVED***SWIFT_STDLIB_PATH***REMOVED***/$***REMOVED***lib***REMOVED***\" \"$***REMOVED***destination***REMOVED***\""
      rsync -auv "$***REMOVED***SWIFT_STDLIB_PATH***REMOVED***/$***REMOVED***lib***REMOVED***" "$***REMOVED***destination***REMOVED***"
      code_sign_if_enabled "$***REMOVED***destination***REMOVED***/$***REMOVED***lib***REMOVED***"
    done
  fi
***REMOVED***

# Signs a framework with the provided identity
code_sign_if_enabled() ***REMOVED***
  if [ -n "$***REMOVED***EXPANDED_CODE_SIGN_IDENTITY***REMOVED***" -a "$***REMOVED***CODE_SIGNING_REQUIRED***REMOVED***" != "NO" -a "$***REMOVED***CODE_SIGNING_ALLOWED***REMOVED***" != "NO" ]; then
    # Use the current code_sign_identitiy
    echo "Code Signing $1 with Identity $***REMOVED***EXPANDED_CODE_SIGN_IDENTITY_NAME***REMOVED***"
    local code_sign_cmd="/usr/bin/codesign --force --sign $***REMOVED***EXPANDED_CODE_SIGN_IDENTITY***REMOVED*** $***REMOVED***OTHER_CODE_SIGN_FLAGS***REMOVED*** --preserve-metadata=identifier,entitlements '$1'"

    if [ "$***REMOVED***COCOAPODS_PARALLEL_CODE_SIGN***REMOVED***" == "true" ]; then
      code_sign_cmd="$code_sign_cmd &"
    fi
    echo "$code_sign_cmd"
    eval "$code_sign_cmd"
  fi
***REMOVED***

# Strip invalid architectures
strip_invalid_archs() ***REMOVED***
  binary="$1"
  # Get architectures for current file
  archs="$(lipo -info "$binary" | rev | cut -d ':' -f1 | rev)"
  stripped=""
  for arch in $archs; do
    if ! [[ "$***REMOVED***VALID_ARCHS***REMOVED***" == *"$arch"* ]]; then
      # Strip non-valid architectures in-place
      lipo -remove "$arch" -output "$binary" "$binary" || exit 1
      stripped="$stripped $arch"
    fi
  done
  if [[ "$stripped" ]]; then
    echo "Stripped $binary of architectures:$stripped"
  fi
***REMOVED***

if [ "$***REMOVED***COCOAPODS_PARALLEL_CODE_SIGN***REMOVED***" == "true" ]; then
  wait
fi
