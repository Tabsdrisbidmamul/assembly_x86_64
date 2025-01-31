; callee saved registers (non volatile) are registers that the caller function (so main e.g) must save so that they are preserved across function calls.
; we push rbp at the very beginning, and rbp is used in lfunc
; e.g. rax and xmm0 are commonly used as return values, hence they need to be saved before calling a function, or all calculations completed before calling said function.

; caller saved registers (volatile) are registers that the callee function must save, once saved it can use said register without having to worry about modifying the caller function's register
; We pushed rbx to use in our local function (in lfunc), and pop when we exit it to return rbx to its original state
; e.g. rbp, rbx 

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
  fmt1    db  "The string is: %s", 10, 0
section .bss
  flist   resb  11 ; len of string + terminating 0
section .text
  global main
main:
push  rbp
mov   rbp, rsp
  mov   rdi, flist
  mov   rsi, first
  mov   rdx, second
  mov   rcx, third
  mov   r8, fourth
  mov   r9, fifth

;  push  0
  push  tenth ; push other params in reverse order to stack
  push  ninth
  push  eighth
  push  seventh
  push  sixth

  call  lfunc

  mov   rdi, fmt1
  mov   rsi, flist ; we move the pointer of flist into rdi, and deref the pointer and place each letter into each byte address
  mov   rax, 0
  
  and   rsp, 0xfffffffffffffff0
  call  printf
leave
ret

; get all arguments and move each byte into rdi
lfunc:
push  rbp
mov   rbp, rsp
  xor   rax, rax
  ; 1-5 args into rdi
  mov   al, byte [rsi]
  mov   [rdi], al

  mov   al, byte [rdx]
  mov   [rdi + 1], al

  mov   al, byte [rcx]
  mov   [rdi + 2], al

  mov   al, byte [r8]
  mov   [rdi + 3], al
  
  mov   al, byte [r9]
  mov   [rdi + 4], al

  ; 6-10 args from stack into rbx
  push  rbx ; save calle - as we're clearing it
  xor   rbx, rbx
  mov   rax, qword [rbp + 16] ; 16-byte align, first value is further up in stack (coming from rip + rbp)
  mov   bl, byte [rax]
  mov   [rdi + 5], bl

  mov   rax, qword [rbp + 24] ; each push to stack is +8
  mov   bl, byte [rax]
  mov   [rdi + 6], bl

  mov   rax, qword [rbp + 32]
  mov   bl, byte [rax]
  mov   [rdi + 7], bl

  mov   rax, qword [rbp + 40]
  mov   bl, byte [rax]
  mov   [rdi + 8], bl

  mov   rax, qword [rbp + 48]
  mov   bl, byte [rax]
  mov   [rdi + 9], bl

  mov   bl, 0
  mov   [rdi + 10], bl

pop   rbx
mov   rsp, rbp
pop   rbp
ret

