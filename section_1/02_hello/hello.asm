section .data
  msg db  "hello, world", 0
  NL  db  0xa ; ascii for 11 (\n)
section .bss
section .text
  global main
main:
  mov rax, 1    ; 1 = write
  mov rdi, 1    ; 1 = to stdout
  mov rsi, msg  ; string to display in rsi  
  mov rdx, 14   ; length of the string, without 0
  syscall       ; display string
  mov rax, 60   ; 60 = exit
  mov rdi, 0    ; 0 = success exit code
  syscall       ; quit