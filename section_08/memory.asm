section .data
    bNum    db  123
    wNum    dw  12345
    warray  times   5 dw 0  ; array of 5 words initialised to 0
    dNum    dd  12345
    qNum1   dq  12345
    text1   db  "abc", 0
    qNum2   dq  3.141592654
    text2   db  "cde", 0
    
section .bss
    bvar    resb    1
    wvar    resw    10
    dvar    resd    1
    qvar    resq    3
section .text
    global main
main:
    push    rbp
    mov     rbp, rsp
    lea     rax, [bNum] ; lea (load effective address) lea treats the square brackets (which is deref) differently. It will calculate the address of bNum and store the pointer in the first operand (so rax)
    mov     rax, bNum   ; load address of bNum (in ddd/ gdb stack the values are apparent)
    mov     rax, [bNum] ; load the value of bNum (123) in to rax
    ;mov     [bvar], rax ; copy rax value to address of bvar (so replacing bvar value at memory address)
    mov     [bvar], al ; the above line will load all 8 bytes of rax to bvar. Problem is that 123 are in al (the lower 8 bytes), so moving the other 7 bytes and reading all 8 bytes will not give us 123 (which bNum is). Of course clearing rax (xor rax, rax) before and then moving bNum to rax and loading rax to bvar will also work 
    
    
    lea     rax, [bvar]
    lea     rax, [wNum]
    mov     rax, [wNum]
    lea     rax, [text1]
    
    mov     rax, text1 ; load in first char address of text1
    mov     rax, text1 + 1 ; load in second char address of text1
    lea     rax, [text1 + 1] ; load in second char address of text1
    mov     rax, [text1] ; load starting char of text1
    mov     rax, [text1 + 1] ; load in second char
    
    mov rsp, rbp
    pop rbp
    ret
    
    
    

    
    