# 文章来源
由于我刷抖音看到 import 一个模块，我在 cpp 文件里面并没有见过这种方式来对文件进行链接，好奇怎么操作于是就有下文

开发环境为我的 macmini 电脑（macos 环境）
# 操作流程
- 需要使用 llvm 的编译器，我本来想使用clang++,但是好像不行
```bash
brew install llvm
# 我们构建好的都放在这个文件夹里面
mkdir build
```
- 然后
```bash
make
./build/main.exe
```
在这个里面我尝试添加类，但是失败了，claude 给我的解释是:</br>
C++20 模块目前编译器支持确实还不够成熟，各家实现都有些问题。简化版应该能跑起来，让你先体验模块的基本用法。
- 清除构建
```bash
make clean
```