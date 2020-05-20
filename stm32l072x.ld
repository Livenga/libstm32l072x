MEMORY {
  FLASH(rwxa): ORIGIN = 0x00000000, LENGTH = 192K
  SRAM(rwi):   ORIGIN = 0x40000000, LENGTH = 20K
}

ENTRY(reset_handler);

estack = ORIGIN(SRAM) + LENGTH(SRAM);

_min_heap_size  = 0x200;
_min_stack_size = 0x400;


SECTIONS {
  .isr_vector : {
    . = ALIGN(4);
    KEEP(*(.isr_vector))
    . = ALIGN(4);
  } > FLASH

  .text : {
    . = ALIGN(4);
    __text_start__ = .;

    *(.text)
    *(.text*)
    *(.rodata)
    *(.rodata*)
    *(.glue_7)
    *(.glue_7.*)
    *(.eh_frame)

    KEEP(*(.init))
    KEEP(*(.fini))

    . = ALIGN(4);
    __text_end__ = .;
  } > FLASH

  .rodata : {
    . = ALIGN(4);

    *(.rodata)
    *(.rodata*)

    . = ALIGN(4);
  } > FLASH


  .ARM.extab : {
     *(.ARM.extab* .gnu.linkonce.armextab.*)
  } > FLASH


  __exidx_start = .;
  .ARM.exidx : {
    *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  } > FLASH

  __exidx_end = .;
  _etext      = .;
  _sidata     = _etext;

  .data : AT(_sidata) {
    . = ALIGN(4);
    __data_start__ = .;

    *(.data)
    *(.data*)

    . = ALIGN(4);
    __data_end__ = .;
  } > SRAM

  . = ALIGN(4);

  .bss : {
    __bss_start__ = .;

    *(.bss)
    *(.bss*)
    *(COMMON)

    . = ALIGN(4);
    __bss_end__ = .;
  } > SRAM


  .usrstack : {
    . = ALIGN(4);

    PROVIDE( end = . );
    PROVIDE( _end = . );

    . = . + _min_heap_size;
    . = . + _min_stack_size;

    . = ALIGN(4);
  } > SRAM


  /DISCARD/ : {
    libc.a (*)
    libm.a (*)
    libgcc.a (*)
  }

  .ARM.attributes 0 : {
    *(.ARM.attributes)
  }
}
