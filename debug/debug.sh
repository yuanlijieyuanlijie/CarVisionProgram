#!/bin/bash

# 打开一个终端运行 OpenOCD（后台运行）
openocd -s /opt/homebrew/share/openocd/scripts -f debug/openocd.cfg &
sleep 1  # 等待 OpenOCD 准备就绪

# 启动 GDB 并连接目标
arm-none-eabi-gdb build/CarVisionProgram_STM32.elf -ex "target remote localhost:3333" -ex "monitor reset halt"
