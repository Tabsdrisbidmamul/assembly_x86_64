section .data
  msg1  db  "Hello, World!", 10, 0
  msg1Len equ $-msg1-1 ; measure length not including \n
  msg2 db  "Alive and Kicking!", 10, 0
  msg2Len equ $-msg2-1 ; measure the length not including \n
  radius dq 357
  pi  dq  3.14
section .bss
section .text
  global main
main: 
  push  rbp ;function prologue
  mov   rbp, rsp  ; function prologue
  mov   rax, 1  ; write mode
  mov   rdi, 1  ; write to stdout
  mov   rsi, msg1; string to display
  mov   rdx, msg1Len  ; length of msg1
  syscall   ; display string

  mov   rax, 1  ; write mode
  mov   rdi, 1  ; write to stdout
  mov   rsi, msg2  ; msg2 string to display
  mov   rdx, msg2Len  ; msg2 length
  syscall

  mov   rsp, rbp  ; function epilogue
  pop   rbp ; function epilouge
  mov   rax, 60 ; 60 = exit
  mov   rdi, 0 ; 0 = succes exit code
  syscall

