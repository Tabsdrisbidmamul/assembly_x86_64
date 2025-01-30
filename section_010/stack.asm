extern printf
section .data
  strng     db  "ABCDE", 0
  strngLen  equ $ - strng - 1 ; len of strng without 0
  fmt1      db  "The original string %s", 10, 0
  fmt2      db  "The reversed string %s", 10, 0
section .bss
section .text
  global main
main:
  push  rbp
  mov   rbp, rsp

; print original string
  mov   rdi, fmt1
  mov   rsi, strng
  mov   rax, 0
  call  printf

; push the string char per char on the stack
  xor   rax, rax ; clear rax, we will use this to push each char to the stack

  mov   rbx, strng ; so pointer of strng in rbx
  mov   rcx, strngLen ; length of strng (this will decrement when looped)
  mov   r12, 0 ; r12 as loop pointer
  pushLoop:
    mov   al, byte [rbx + r12] ; move char into al (rbx contains the address to the first char in strng so by adding the loop pointer, we will move along the string)
    push  rax
    inc   r12
    loop  pushLoop

; pop the string char per char from stack, this will reverse strng (LIFO)
  mov   rbx, strng
  mov   rcx, strngLen
  mov   r12, 0
  popLoop:
    pop   rax ; this will pop from stack and place into rax
    mov   byte [rbx + r12], al ; place the string and replace the index pos at strng (so last char at first char and so on)
    inc   r12
    loop  popLoop
    mov   byte [rbx + r12], 0 ; null terminate strng

; print reversed string
  mov   rdi, fmt2
  mov   rsi, strng
  mov   rax, 0
  call printf

  mov rsp, rbp
  pop rbp
  ret






