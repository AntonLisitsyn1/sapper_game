.data
.macro generator
li t0, 0x10010000 # adress of list of 30 numbers (coordinates of bombs on our map)
mv s0, t0  # adress of list of 30 numbers (coordinates of bombs on our map)
mv s1, s0 # adress of list of 30 numbers (coordinates of bombs on our map)
li t1, 45
mv t5, t1
mv t6, zero # flag
generate_coordinates:
beqz t1, end_gen
addi t1, t1, -1
randomizing_numb:
randomizing(t3)
li t4, 256
remu t3, t3, t4
mv t6, zero
li t5, 45
for_in_gen:
beqz t5, end_for_in_gen
addi t5, t5, -1
lw t2, 0(s0)
bne t3, t2, n_eq_in_gen
li t6, 1
n_eq_in_gen:
addi s0, s0, 4
j for_in_gen
end_for_in_gen:
mv s0, s1
bnez t6, randomizing_numb
li t2, 4
mv t4, t3
addi t4, t4, -1
mul t2, t2, t4
li t4, -1
sub sp, sp, t2
sw t4, 0(sp)
add sp, sp, t2
j generate_coordinates
end_gen:
.end_macro 
