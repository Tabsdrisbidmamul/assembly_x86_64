section .data
  msg1    db  "Hello, World!", 0
  msg2    db  "Alive and Kicking!", 0
  radius  dd  357
  pi      dq  3.14
  fmtstr  db  "%s", 10, 0 ; format for printing string
  fmtflt  db  "%f", 10, 0 ; format for printing float
  fmtint  db  "%d", 10, 0 ; format for printing integer
section .bss
section .text
extern printf
  global main
main: 
  push  rbp
  mov   rbp, rsp

; print msg1
  mov   rax, 0  ; no floating point
  mov   rdi, fmtstr
  mov   rsi, msg1
  call  printf

; print msg2
  mov   rax, 0  ; no floating point
  mov   rdi, fmtstr
  mov   rsi, msg2
  call  printf

; print radius
  mov   rax, 0  ; no floating point
  mov   rdi, fmtint
  mov   rsi, [radius] ; [] brackets mean to get the contents at memory address &radius. printf for floats and integers wants the value not the address
  call  printf

; print pi
  mov   rax, 1  ; xmm register used (chapter 11 covers this)
  movq  xmm0, [pi]
  mov   rdi, fmtflt
  call  printf

  mov   rsp, rbp
  pop   rbp

ret

