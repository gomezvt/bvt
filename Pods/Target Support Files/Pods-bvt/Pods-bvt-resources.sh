#!/bin/sh
set -e

mkdir -p "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"

RESOURCES_TO_COPY=$***REMOVED***PODS_ROOT***REMOVED***/resources-to-copy-$***REMOVED***TARGETNAME***REMOVED***.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

case "$***REMOVED***TARGETED_DEVICE_FAMILY***REMOVED***" in
  1,2)
    TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
    ;;
  1)
    TARGET_DEVICE_ARGS="--target-device iphone"
    ;;
  2)
    TARGET_DEVICE_ARGS="--target-device ipad"
    ;;
  3)
    TARGET_DEVICE_ARGS="--target-device tv"
    ;;
  *)
    TARGET_DEVICE_ARGS="--target-device mac"
    ;;
esac

install_resource()
***REMOVED***
  if [[ "$1" = /* ]] ; then
    RESOURCE_PATH="$1"
  else
    RESOURCE_PATH="$***REMOVED***PODS_ROOT***REMOVED***/$1"
  fi
  if [[ ! -e "$RESOURCE_PATH" ]] ; then
    cat << EOM
error: Resource "$RESOURCE_PATH" not found. Run 'pod install' to update the copy resources script.
EOM
    exit 1
  fi
  case $RESOURCE_PATH in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target $***REMOVED***!DEPLOYMENT_TARGET_SETTING_NAME***REMOVED*** --output-format human-readable-text --compile $***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc $RESOURCE_PATH --sdk $***REMOVED***SDKROOT***REMOVED*** $***REMOVED***TARGET_DEVICE_ARGS***REMOVED***"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target $***REMOVED***!DEPLOYMENT_TARGET_SETTING_NAME***REMOVED*** --output-format human-readable-text --compile "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc" "$RESOURCE_PATH" --sdk "$***REMOVED***SDKROOT***REMOVED***" $***REMOVED***TARGET_DEVICE_ARGS***REMOVED***
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target $***REMOVED***!DEPLOYMENT_TARGET_SETTING_NAME***REMOVED*** --output-format human-readable-text --compile $***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename \"$RESOURCE_PATH\" .xib`.nib $RESOURCE_PATH --sdk $***REMOVED***SDKROOT***REMOVED*** $***REMOVED***TARGET_DEVICE_ARGS***REMOVED***"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target $***REMOVED***!DEPLOYMENT_TARGET_SETTING_NAME***REMOVED*** --output-format human-readable-text --compile "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename \"$RESOURCE_PATH\" .xib`.nib" "$RESOURCE_PATH" --sdk "$***REMOVED***SDKROOT***REMOVED***" $***REMOVED***TARGET_DEVICE_ARGS***REMOVED***
      ;;
    *.framework)
      echo "mkdir -p $***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"
      mkdir -p "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"
      echo "rsync -av $RESOURCE_PATH $***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"
      rsync -av "$RESOURCE_PATH" "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***FRAMEWORKS_FOLDER_PATH***REMOVED***"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"$RESOURCE_PATH\" \"$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH"`.mom\""
      xcrun momc "$RESOURCE_PATH" "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"$RESOURCE_PATH\" \"$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd\""
      xcrun momc "$RESOURCE_PATH" "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"$RESOURCE_PATH\" \"$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm\""
      xcrun mapc "$RESOURCE_PATH" "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE="$RESOURCE_PATH"
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    *)
      echo "$RESOURCE_PATH"
      echo "$RESOURCE_PATH" >> "$RESOURCES_TO_COPY"
      ;;
  esac
***REMOVED***

mkdir -p "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "$***REMOVED***TARGET_BUILD_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"
if [[ "$***REMOVED***ACTION***REMOVED***" == "install" ]] && [[ "$***REMOVED***SKIP_INSTALL***REMOVED***" == "NO" ]]; then
  mkdir -p "$***REMOVED***INSTALL_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "$***REMOVED***INSTALL_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "$***REMOVED***WRAPPER_EXTENSION***REMOVED***" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "$***REMOVED***PODS_ROOT***REMOVED****" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  printf "%s\0" "$***REMOVED***XCASSET_FILES[@]***REMOVED***" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "$***REMOVED***PLATFORM_NAME***REMOVED***" --minimum-deployment-target "$***REMOVED***!DEPLOYMENT_TARGET_SETTING_NAME***REMOVED***" $***REMOVED***TARGET_DEVICE_ARGS***REMOVED*** --compress-pngs --compile "$***REMOVED***BUILT_PRODUCTS_DIR***REMOVED***/$***REMOVED***UNLOCALIZED_RESOURCES_FOLDER_PATH***REMOVED***"
fi
