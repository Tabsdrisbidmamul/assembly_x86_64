extern printf
section .data
  number1   dq  9.0
  number2   dq  73.0
  fmt       db  "The numbers are %f and %f", 10, 0
  fmtfloat  db  "%s %f", 10, 0
  f_sum     db  "The float sum of %f and %f is %f", 10, 0
  f_dif     db  "The float dif of %f and %f is %f", 10, 0
  f_mul     db  "The float mul of %f and %f is %f", 10, 0
  f_div     db  "The float div of %f by %f is %f", 10, 0
  f_sqrt    db  "The float sqrt of %f is %f", 10, 0
section .bss
section .text 
  global main
main:
  push  rbp
  mov   rbp, rsp
; print the numbers
  movsd   xmm0, [number1] ; movsd is mov double precision float movss is mov single precision float
  movsd   xmm1, [number2]
  mov     rdi, fmt
  mov     rax, 2 ; 2 floats to print
  call    printf

; sum
  movsd   xmm2, [number1]
  addsd   xmm2, [number2]
  movsd   xmm0, [number1]
  movsd   xmm1, [number2]
  mov     rdi, f_sum
  mov     rax, 3  ; 3 argumnets in xmm which are floats
  call    printf

; difference
  movsd   xmm2, [number1]
  subsd   xmm2, [number2]
  movsd   xmm0, [number1]
  movsd   xmm1, [number2]
  mov     rdi, f_dif
  mov     rax, 3  ; 3 argumnets in xmm which are floats
  call    printf

; sum
  movsd   xmm2, [number1]
  mulsd   xmm2, [number2]
  movsd   xmm0, [number1]
  movsd   xmm1, [number2]
  mov     rdi, f_mul
  mov     rax, 3  ; 3 argumnets in xmm which are floats
  call    printf

; div
  movsd   xmm2, [number1]
  divsd   xmm2, [number2]
  movsd   xmm0, [number1]
  movsd   xmm1, [number2]
  mov     rdi, f_div
  mov     rax, 1  ; 1 argumnets in xmm which are floats
  call    printf

; sqrt
  sqrtsd  xmm1, [number1]
  mov     rdi, f_sqrt
  movsd   xmm0, [number1]
  mov     rax, 2
  call    printf

mov rsp, rbp
pop rbp
ret