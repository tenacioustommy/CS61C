# The .globl keyword can be placed in a file and defines the labels we want to expose to other files when they import this file; it’s analogous to defining a function in a header file.
# If you open the factorial.s file, you’ll notice that we export your factorial label at the top with the .globl factorial line at the top. This is actually how the autograder tests your function so don’t remove it!
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
    