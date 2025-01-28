.data
.macro checker
li t0, 256
li t5, 0
li s3, 16
li s4, 1
mv s0, sp  #s0 - low
addi s1, s0, -1024 # s1 - high
checking:
beq t0, t5 stop_cheking
addi t5, t5, 1
lw t1, 0(sp) # sell for checking
li t2, -1
li t6, 0 # counter
beq t2, t1, bomb
mv t3, sp # our adress of cell
addi t3, t3, 4
bgt t3, s0, check2
lw t4, 0(t3)
bne t2, t4, check2
rem s2, t5, s3 
beq s4, s2 check2
addi t6, t6, 1
check2:
mv t3, sp # our adress of cell
addi t3, t3, -4
bgt s1, t3, check3
lw t4, 0(t3)
bne t2, t4, check3
rem s2, t5, s3 
beqz s2, check3
addi t6, t6, 1
check3:
mv t3, sp # our adress of cell
addi t3, t3, 64
bgt t3, s0, check4
lw t4, 0(t3)
bne t2, t4, check4
addi t6, t6, 1
check4:
mv t3, sp # our adress of cell
addi t3, t3, -64
bgt s1, t3, check5
lw t4, 0(t3)
bne t2, t4, check5

addi t6, t6, 1
check5:
mv t3, sp # our adress of cell
addi t3, t3, -68
bgt s1, t3, check6
lw t4, 0(t3)
bne t2, t4, check6
rem s2, t5, s3 
beqz s2, check6
addi t6, t6, 1
check6:
mv t3, sp # our adress of cell
addi t3, t3, -60
bgt s1, t3, check7
lw t4, 0(t3)
bne t2, t4, check7
rem s2, t5, s3 
beq s4, s2 check7
addi t6, t6, 1
check7:
mv t3, sp # our adress of cell
addi t3, t3, 60
bgt t3, s0, check8
lw t4, 0(t3)
bne t2, t4, check8
rem s2, t5, s3 
beqz s2, check8
addi t6, t6, 1
check8:
mv t3, sp # our adress of cell
addi t3, t3, 68
bgt t3, s0, end_check
lw t4, 0(t3)
bne t2, t4, end_check
rem s2, t5, s3 
beq s4, s2 end_check
addi t6, t6, 1
end_check:
sw t6, 0(sp)
bomb:
addi sp, sp,  -4
j checking
stop_cheking:
addi sp, sp 1024
.end_macro 