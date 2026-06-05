.section .text
.globl _start

_start:
	// Stack setup
	ldr x30, =stack_top
	mov sp, x30

    // ¿Our CPU is on ID 0?

     mrs     x1, mpidr_el1
    and     x1, x1, #3
    cbz     x1, .boot_core0

   .hang_cpus:
    wfe // CPU 1/2/3!, Its bedtime.
    b .

    .boot_core0:
    // EXCEPTION LEVEL funcion
    bl jump_to_el1     

    bl kmain
    
    b .loop

jump_to_el1:
    // Check if we are in EL1, we can throw all to the trash if we dont do this in future devices
    mrs x1, CurrentEL
    ret

.loop:
    wfe // WFE means by Wait For Event, we put this to save cycles of the CPU in the kernel
    b .
