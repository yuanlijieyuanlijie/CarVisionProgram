#!/bin/bash

BUILD_DIR=build

if ! command -v cmake &> /dev/null
then
    echo "❌ 未找到 cmake，请先运行：brew install cmake"
    exit 1
fi

echo "🧹 清除旧的构建目录..."
rm -rf $BUILD_DIR

if [ ! -d "$BUILD_DIR" ]; then
    echo "📁 创建构建目录：$BUILD_DIR"
    mkdir $BUILD_DIR
fi

echo "🔧 正在配置项目（使用交叉工具链）..."
cmake -B $BUILD_DIR -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/gcc-arm-none-eabi.cmake

echo "🛠 正在编译项目..."
cmake --build $BUILD_DIR

if [ $? -eq 0 ]; then
    echo "✅ 编译完成！可执行文件路径：$BUILD_DIR/CarVisionProgram_STM32.elf"
else
    echo "❌ 编译失败，请检查代码或 CMake 配置"
fi
