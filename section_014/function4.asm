extern printf
extern c_area
extern c_circum
extern r_area
extern r_circum
global pi ; accessible to other external files
section .data
  pi      dq  3.141592654
  radius  dq  10.0
  side1   dq  4
  side2   dq  5
  fmtf    db  "%s %f", 10, 0
  fmti    db  "%s %d", 10, 0
  ca      db  "The circle area is ", 0
  cc      db  "The circle circumference is ", 0
  ra      db  "The retangle area is ", 0
  rc      db  "The retangle circumference is ", 0
section .bss
section .text
  global main
main:
push  rbp
mov   rbp, rsp

; circle area
      movsd xmm0, qword [radius] ; xmm0 is argument to c_area
      call  c_area ; xmm0 holds return value

      mov   rdi, fmtf
      mov   rsi, ca
      mov   rax, 1
      call  printf
; circle circumference
      movsd xmm0, qword [radius] ; xmm0 is argument to c_circum
      call  c_circum ; xmm0 holds return value

      mov   rdi, fmtf
      mov   rsi, cc
      mov   rax, 1
      call  printf
; retangle area
      mov   rdi, [side1] ; rdi and rsi are used as params, rdx, rcx, and r8-9 are used as the next params. For more than 6, the stack is used and pushed onto the stack reverse order -> 10, 9, 8, 7. and when popping, param 7 is fetched, then 8, and so.
      mov   rsi, [side2]
      call  r_area ; area returned in rax

      mov   rdi, fmti
      mov   rsi, ra
      mov   rdx, rax
      mov   rax, 0
      call  printf
; retangle circumference
      mov   rdi, [side1]
      mov   rsi, [side2]
      call  r_circum ; circum returned in rax

      mov   rdi, fmti
      mov   rsi, rc
      mov   rdx, rax
      mov   rax, 0
      call  printf

mov rsp, rbp
pop rbp
ret
