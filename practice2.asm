#　合計10を超えたらループを抜ける
#  array = [1, -10, 10, 3, 2, 5, 8, -3, -1]

main:
    irmovq array, %rcx  # rax = 10   
    xorq %rsi, %rsi     # rsi = i = 0
    irmovq 9, %rbx      # rbx = 9
    xorq %rax, %rax     # rax = 0
loop:
    mrmovq (%rcx), %rdx # rdx = array [i]
    irmovq 20, %rdi     # rdi = 10
    subq %rax, %rdi     # rdi = rax - rdi
    je done            # goto done if rax - 10 <= 0
    addq %rdx, %rax     # rax += array[i]
    irmovq 1, %rdx      # rdx = 1
    addq %rdx, %rsi     # i++
    irmovq 8, %rdx      # rdx = 8
    addq %rdx, %rcx     # array++
    jmp loop
done:
    halt
.pos 0x100
array:
    .quad 5
    .quad -10
    .quad 10
    .quad 3
    .quad 2
    .quad 5
    .quad 8
    .quad -3
    .quad -1
    
    
    