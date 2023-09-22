.globl factorial

.data
n: .word 3

.text
main:
    la t0, n
    lw a0, 0(t0)
    # 调用完执行ra地址的代码，ra存储下一个pc值
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    li t2,1  
    beq a0,t2,finish
    # push caller saved
    addi sp,sp,-8
    sw ra,4(sp)
    sw a0,0(sp)
    # 作为参数
    addi a0,a0,-1
    jal factorial
    # 将return值乘上去
    lw t1,0(sp)
    mul a0,a0,t1
    lw ra,4(sp)
    addi sp,sp,8

finish:
    ret
    