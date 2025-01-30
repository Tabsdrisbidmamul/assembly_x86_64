; functions can call other functions, and each function can have its own .data, .bss, .text section. 
; local variables are prefixed with a dot (.) -> .pi dq 3.14
; function cannot be nested
; global variables are placed in the main .data/ .bss (so the top)
extern printf
section .data
  radius  dq  10.0
section .bss
section .text
area:
  section .data
    .pi dq  3.14159264  ; local to area
  section .text
push  rbp
mov   rbp, rsp
  movsd   xmm0, [radius]
  mulsd   xmm0, [radius]
  mulsd   xmm0, [.pi]
leave
ret

circum:
  section .data
    .pi dq  3.14  ; local to circum
  section .text
push  rbp
mov   rbp, rsp
  movsd   xmm0, [radius]
  addsd   xmm0, [radius]
  mulsd   xmm0, [.pi]
leave
ret

circle:
  section .data
    .fmt_area   db  "The area is %f", 10, 0
    .fmt_circum db  "The circumference is %f", 10 ,0
  section .text
push  rbp
mov   rbp, rsp
  call  area
  mov   rdi, .fmt_area
  mov   rax, 1 ; xmm0 contains area
  call  printf

  call  circum
  mov   rdi, .fmt_circum
  mov   rax, 1 ; xmm0 contains circum
  call  printf
leave
ret

  global main
main:
push  rbp
mov   rbp, rsp
  call circle
leave
ret