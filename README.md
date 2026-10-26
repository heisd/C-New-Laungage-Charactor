# C++20 Modules 入门实验

通过两个小模块体验 C++20 的 `export module` 与 `import`。项目最初在 macOS / Mac mini 上使用 Homebrew LLVM 进行实验，源码和 Makefile 保留了当时的环境设定。

## 项目内容

```text
.
├── modules/
│   ├── math.cppm      # math 模块
│   └── greet.cppm     # greet 模块
├── src/main.cpp      # 导入模块并调用导出函数
├── Makefile          # 模块预编译与可执行文件链接
└── reference/readme.md
```

| 模块 | 导出函数 |
| --- | --- |
| [math](./modules/math.cppm) | `add(a,b)`、`subtract(a,b)`、`multiply(a,b)` |
| [greet](./modules/greet.cppm) | `greet()`、`farewell()` |

[main.cpp](./src/main.cpp) 导入两个模块，输出简单运算与问候信息。这是模块机制的最小示例，未包含类模块、包管理或跨编译器兼容层。

## 构建原理

现有 [Makefile](./Makefile) 分两步处理：

1. 使用 Clang 的 `--precompile` 将两个 `.cppm` 文件生成 `build/*.pcm`。
2. 编译 `main.cpp`，通过 `-fprebuilt-module-path` 与 `-fmodule-file` 指定模块文件，再链接可执行程序。

编译选项为 `-std=c++20`。模块预编译文件与编译器版本、选项密切相关，更换 LLVM 后应重新构建。

## 环境准备与运行

需要 Make 和支持该模块构建流程的 LLVM Clang。原始开发笔记使用 Homebrew：

```bash
brew install llvm
git clone --branch liquanyan https://github.com/heisd/C-New-Laungage-Charactor.git
cd C-New-Laungage-Charactor
mkdir -p build
make
./build/main.exe
```

Makefile 的默认编译器为 `/opt/homebrew/opt/llvm/bin/clang++`。如果 LLVM 不在这里，应显式指定本机路径，例如：

```bash
make CXX=/your/llvm/bin/clang++
```

路径中的 `/your/llvm/bin/clang++` 是需要替换的示意值。仅凭系统存在名为 `clang++` 的命令，不能保证它与原配置的模块支持一致。

## 预期输出

根据当前入口中的常量调用，输出应包含：

```text
=== Math Module ===
3 + 5 = 8
10 - 4 = 6
6 * 7 = 42

=== Greet Module ===
Hello, Li!
Goodbye, Li!
```

`main.exe` 是作者选择的文件名后缀；在本项目中它也用于 macOS 构建产物，并不代表可以直接复制到 Windows 运行。

## 修改与清理

修改模块后重新执行 `make`。切换工具链或遇到 PCM 不兼容时，先清理：

```bash
make clean
make
```

## 常见问题

| 现象 | 原因或处理 |
| --- | --- |
| 找不到默认 clang++ 路径 | 修改 `CXX` 或通过命令行覆盖 |
| 无法写入 build/*.pcm | 首次构建前创建 `build/` |
| module not found | 检查预编译是否成功、模块名是否与 `import` 相同 |
| 更换编译器后 PCM 无法读取 | 清理旧产物，使用同一 LLVM 版本重新生成 |
| 在其他平台构建失败 | 当前 Makefile 面向原 macOS 工具链，需要按平台调整 |

原始实验过程见 [学习记录](./reference/readme.md)。
