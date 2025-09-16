CONSTANTS {
    RAM_START = 0x20000000;
    RAM_SIZE  = 0x00008000;
    ROM_START = 0x08000000;
    ROM_SIZE  = 0x00010000;
}
MEMORY {
    rom (RX) : ORIGIN = ROM_START, LENGTH = ROM_SIZE;
    ram (RW) : ORIGIN = RAM_START, LENGTH = RAM_SIZE;
}
SECTIONS {
    .text : {
        *(.text)
    } > rom
    .data : {
        *(.data)
    } > ram
    .bss : {
        *(.bss)
        *(COMMON)
    } > ram
    .stack : {
        . = ALIGN(8);
        KEEP(*(.stack))
    } > ram
} 

 