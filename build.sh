#!/bin/bash
LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`

BUILD=true
NDK_URL="https://dl.google.com/android/repository/android-ndk-r23b-linux.zip"
ZIP_NAME="NDK.zip"

setup_ndk() {
  wget "${NDK_URL}" -O "${ZIP_NAME}"
  7za x "${ZIP_NAME}"
  mv android-ndk-* ndk
}

build() {
  export NDK=${LOCALDIR}/ndk
  export PATH=${NDK}:${PATH}
  ndk-build
}

apply_patches() {
  export BUILD=false
  for p in patchs/* ;do
    if ! git am -3 < $p ;then
      patch -p1 < $p
    fi
  done

}

if echo $@ | grep "patch" ;then
  apply_patches
fi

if [ $BUILD = true ];then
  if echo $@ | grep -q setup; then
    setup_ndk
  fi
  build && cd $LOCALDIR
fi
