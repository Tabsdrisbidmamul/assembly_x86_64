; with an odd number of arguments so 1, 3, 5 etc on the stack - the stack is not 16-byte aligned. Every push will decrease the stack by 8 bytes. So we have 2 options
; 1. Add a dummy push so we we're going from 8 byte multiple (0x7fffffffdcf8) to a 16 byte multiple (0x7fffffffdcf0). i.e. should end with 0
; 2. Mask the ending byte of RSP so its zero'ed 
;(and   rsp, 0xfffffffffffffff0)
; I found that 2. didn't always work and I got segfaulted.

extern printf
section .data
  first   db  "A", 0
  second  db  "B", 0
  third   db  "C", 0
  fourth  db  "D", 0
  fifth   db  "E", 0
  sixth   db  "F", 0
  seventh db  "G", 0
  eighth  db  "H", 0
  ninth   db  "I", 0
  tenth   db  "J", 0
  fmt1    db  "The string is: %s%s%s%s%s%s%s%s%s%s%s", 10, 0
  fmt2    db  "PI = %f", 10, 0
  pi      dq  3.14
section .bss
section .text
  global main
main:
push  rbp
mov   rbp, rsp

      push  rbp ; dummy push to ensure stack is 16-byte aligned (lsb needs to be 0)
      mov   rdi, fmt1
      mov   rsi, first
      mov   rdx, second
      mov   rcx, third
      mov   r8, fourth
      mov   r9, fifth

      push  tenth ; push other params in reverse order to stack
      push  ninth
      push  eighth
      push  seventh
      push  sixth
      
      mov   rax, 0
      and   rsp, 0xfffffffffffffff0 ; mask dummy rbp that was pushed to the stack so stack is 16-byte aligned
      call  printf

      ;add   rsp, 8 ; remove dummy push
      and   rsp, 0xfffffffffffffff0 ; 16 byte align the stack
      movsd xmm0, [pi]
      mov   rax, 1
      mov   rdi, fmt2
      call  printf
leave
ret
