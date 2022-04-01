.data

@ data section
msg:
.ascii "Hello, World!\n"
len = . - msg

.text

.global _start
_start:

  mov   %r0, $1           @ stdout status
  ldr   %r1, =msg         @ message location
  ldr   %r2, =len         @ message length
  mov   %r7, $4           @ write is syscall #4
  swi   $0                @ invoke syscall

/* syscall exit */
  mov   %r0, $0           @ exit status
  mov   %r7, $1           @ exist is syscall #1
  swi   $0                @ invoke syscall
