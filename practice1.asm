main:
    xorq %rsi, %rsi
    irmovq 10, %rbx
    irmovq array, %rcx
    xorq %rax, %rax
loop:
    rrmovq %rsi, %rdx
    subq %rbx, %rdx
    jge done
    mrmovq (%rcx), %rdx
    xorq %rdi, %rdi
    subq %rdx, %rdi
    jge false
    addq %rdx, %rax
false:
    irmovq 1, %rdx
    addq %rdx, %rsi
    irmovq 8, %rdx
    addq %rdx, %rcx
    jmp loop
done:
    halt
    
    
.pos 0x200
array:
    .quad -1
    .quad 3
    .quad 4
    .quad -3
    .quad -7
    .quad 4
    .quad 10
    .quad 2
    .quad 0
    .quad -3
