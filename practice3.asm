# arrayの中身を反転させる
# array = [1,2,3,4,5] -> [5,4,3,2,1]

# Execution begins at address 0
main:
    irmovq 0, %rsi      # rsi = left = 0
    irmovq 0, %r8       # r8 = left * 8 = 0
    irmovq 4, %rdi      # rdi = right = length - 1
    irmovq 32, %r9      # r9 = right * 8 = 0
    irmovq array, %rbx  # rbx = array
while:
    rrmovq %rsi, %rdx   # rdx = left
    subq %rdi, %rdx     # rdx = left' - right >= 0
    jge done
    
    # leftとrightの値の交換
    rrmovq %rbx, %rdx   # rdx = array
    addq %r8, %rdx
    mrmovq (%rdx), %r10 # r10 = array[left]
    rrmovq %rbx, %rsp   # rsp = array
    addq %r9, %rsp      
    mrmovq (%rsp), %r11 # r11 = array[right]
    rmmovq %r11, (%rdx) # array[left] = array[right]
    rmmovq %r10, (%rsp) # array[right] = array[left]
    
    irmovq 1, %rbp      # rbp = 1
    addq %rbp, %rsi     # right += 1
    subq %rbp, %rdi     # left -= 1
    irmovq 8, %rbp      # rbp = 8
    addq %rbp, %r8      # left*8 += 8
    subq %rbp, %r9      # right*8 -= 8
    jmp while
done:
    halt
.pos 0x100
array:
    .quad 1
    .quad 2
    .quad 3
    .quad 4
    .quad 5
    