## Magiskboot_ndk

> 这是一个从[magisk](https://github.com/topjohnwu/Magisk) native中分离出来的供单独编译的源码
> 使用 android ndk toolchains 编译

* 如何使用:
*   git clone --recurse-submodules https://github.com/xiaoxindada/magiskboot_ndk.git
*   cd magiskboot_ndk
*   git pull --recurse-submodules
*   ./build.sh setup
*   生成物 lib,bin: obj/local/${ARCH} 最终输出: libs/${ARCH} 
