# 数字のスワップ
irmovq 0x2000, %rsp    # rsp = 0x2000
irmovq 0x1234, %rax    # rax = 0x1234
irmovq 0xCAFE, %rbx    # rbx = 0xCAFE

pushq %rax
rrmovq %rbx, %rax
popq %rbx
halt
    
    
    