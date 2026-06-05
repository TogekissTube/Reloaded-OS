ENTRY(_start)
SECTIONS {
    . = 0x00200000;
    .text.init : {
        boot.o(.text)
    }
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss COMMON)
    }
    . = ALIGN(16);
    . += 0x1000;
    stack_top = .;
}
