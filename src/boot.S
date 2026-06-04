.section .text
.globl _start

_start:
	// Stack setup
	ldr x30, =stack_top
	mov sp, x30
    // Jumps to kernel
	bl kmain
    b .loop

.loop:
    wfi // WFI means by Wait For Interrupt, we put this to save cycles of the CPU in the kernel
    b .
