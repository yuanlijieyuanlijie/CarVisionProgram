# 声明使用交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m3)

# 明确指定交叉编译器路径
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# 设置交叉编译的基本参数
set(CMAKE_C_FLAGS "-mcpu=cortex-m3 -mthumb -Wall -fdata-sections -ffunction-sections")
set(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_SOURCE_DIR}/STM32F103C8TX_FLASH.ld -Wl,--gc-sections")

# 关键：关闭 macOS 自动传入的无效参数
set(CMAKE_OSX_SYSROOT "")
set(CMAKE_OSX_ARCHITECTURES "")

# 禁用测试 C 编译器的小程序（避免 TryCompile 报错）
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
