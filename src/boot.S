.section .text
.globl _start

_start:
	// Stack setup
	ldr x30, =stack_top
	mov sp, x30
	bl kmain
	b .
