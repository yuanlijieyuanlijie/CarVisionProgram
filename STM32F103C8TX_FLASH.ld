/* STM32F103C8T6 has 64KB Flash and 20KB RAM */
ENTRY(Reset_Handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

/* Entry point */
ENTRY(Reset_Handler)

/* Define symbol for stack top */
_estack = ORIGIN(RAM) + LENGTH(RAM);

/* Minimum stack size */
_Min_Stack_Size = 0x400;    /* 1KB stack */

SECTIONS
{
  .isr_vector :
  {
    KEEP(*(.isr_vector))
  } > FLASH

  .text :
  {
    *(.text*)
    *(.rodata*)
    *(.glue_7)
     *(.glue_7t)
    KEEP(*(.init))
    KEEP(*(.fini))
    *(.ARM.exidx*)
  } > FLASH


  .data : AT (ADDR(.text) + SIZEOF(.text))
  {
    _sidata = LOADADDR(.data);
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM

  .bss :
  {
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } > RAM

  .stack :
  {
    . = ALIGN(8);
    PROVIDE(_end = .);
        . = . + _Min_Stack_Size;
        . = . + 0x400; /* 1KB heap */
        PROVIDE(_heap_end = .);
  } > RAM
}
