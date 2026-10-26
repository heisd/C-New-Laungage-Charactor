# C-New-Laungage-Charactor

C++20 Modules 学习示例，通过独立模块文件练习模块导出与导入。

## 内容导航

- [src/main.cpp](./src/main.cpp)：模块使用入口
- [modules/math.cppm](./modules/math.cppm)：math 模块
- [modules/greet.cppm](./modules/greet.cppm)：greet 模块
- [Makefile](./Makefile)：Clang 模块预编译与链接
- [reference/readme.md](./reference/readme.md)：学习参考

## 构建说明

需要支持 C++20 Modules 的 Clang 与 Make。`Makefile` 默认编译器为 macOS Homebrew 路径 `/opt/homebrew/opt/llvm/bin/clang++`；请按本机环境修改 `CXX`。

先创建 `build/`，再运行 `make`；输出为 `build/main.exe`。Clang 模块格式与版本相关，应使用同一套编译器生成与链接模块。
