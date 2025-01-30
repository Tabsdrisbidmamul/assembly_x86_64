section .data
  bNum  db  123
  wNum  dw  12345
  dNum  dd  1234567890
  qNum1 dq  1234567890123456789
  qNum2 dq  123456
  qNum3 dq  3.14
section .bss
section .text
  global main
main:
  push  rbp
  mov   rbp, rsp
  mov   rax, -1 ; fill rax with 1s
  mov   al, byte [bNum] ; copy the contents of bNum (byte) long into the lower part of ax (16 bit) reg. But upper contents ah, eax, and rax are still set
  xor   rax, rax  ; clear rax reg
  mov   al, byte [bNum] ; now only the lower part of ax is set

  mov   rax, -1 ; fill rax with 1s
  mov   ax, word [wNum] ; copy the contents of wNum (word) long into ax (16 bit) reg. But upper contents eax, and rax are still set
  xor   rax, rax  ; clear rax reg
  mov   ax, word [wNum] ; now only ax is set

  mov   rax, -1 ; fil with 1s
  mov   eax, dword [dNum] ; does clear upper bits of rax when you move a value to eax, the upper bits of rax are cleared

  mov   rax, -1 ; fill with 1s
  mov   rax, qword [qNum1] ; does clear upper bits of rax
  mov   qword [qNum2], rax ; copy contents of rax to qNum2's memory location
  mov   rax, 123456
  movq  xmm0, [qNum3] ; instruction for floating point

  mov   rsp, rbp
  pop   rbp
  ret