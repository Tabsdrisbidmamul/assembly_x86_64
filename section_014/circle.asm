extern pi
section .data
section .bss
section .text
global c_area
c_area:
  section .text
  push  rbp
  mov   rbp, rsp
      movsd xmm1, qword [pi]
      mulsd xmm0, xmm0 ; radius is in xmm0 ("param")
      mulsd xmm0, xmm1
  mov rsp, rbp
  pop rbp
  ret

global c_circum
c_circum:
  section .text
  push  rbp
  mov   rbp, rsp
      movsd xmm1, qword [pi] ; radius in xmm0 ("param")
      addsd xmm0, xmm0
      mulsd xmm0, xmm1
  mov rsp, rbp
  pop rbp
  ret

