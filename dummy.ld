//  The following explains what the default Green Hills sections are for:
// 
//  picbase - base of the text sections, relocatable in -pic mode
//  text - text section
//  syscall - syscall section, for host I/O under Multi
//  fixaddr/fixtype - for PIC/PID fixups
//  rodata - read only data
//  CROM.data - the compressed ROM image of .data
//  secinfo - section information section, used by the start-up code
//  pidbase - base of the data sections, relocatable in -pid mode
//  data - non-zeroed writeable data section
//  bss - zeroed data section
//  heap - the heap, grows upward
//  stack - the stack, grows downward

DEFAULTS {
    heap_reserve   = 0x800000
    stack_reserve  = 0x100000
}

SECTIONS
{
    .picbase		0x4000000 	: 		
    .text				:			
    .syscall				:			
    .fixaddr				:
    .fixtype				:
    .rodata				:   
    .secinfo				:			
    .pidbase		align(16) 	:		
    .data				:		
    .bss				:		
    .ghcovfz 		CLEAR		:		
    .ghcovcz 		CLEAR		:		
    .ghcovdz 		CLEAR		:		
    .heap 	align(16) pad(heap_reserve) :
    .stack 	align(16) pad(stack_reserve) :
//    .CROM.data CROM(.data) :
}

