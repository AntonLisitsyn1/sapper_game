.include "macrolib.s"
.include "generator.s"
.include "checker.s"
.include "scavenger.s"
.include "filler.s"

.text
generator
scavenger
checker
scavenger
filler
scavenger

 
mv s8, sp # our map
mv s7, s8
li t3, 0x10040000 # bitmap
li t5, 9999 # color
mv s2, zero
li s5, 0x10010000 # user results
 li a0, 2
 sw a0, 0xffff0000, t0
 li a0, 0
 li t1, 136 # counter
 li s9, 0xffff0004 
 mv a3, zero #counter of falls
loop:
 lw a0, 0(s9) 
 beqz a0, loop
 li t0, 0x1b # esc
 beq t0, a0, end_game
 mv a2, t1
jal ra, pointer_down
 li t0, 119 # input - w
 bne t0, a0, a0_n_eq_w
 addi t1, t1, -16
 a0_n_eq_w:
 li t0, 97
 bne t0, a0, a0_n_eq_a
 addi t1, t1, -1
 a0_n_eq_a:
 li t0, 115
 bne t0, a0, a0_n_eq_s
 addi t1, t1, 16
 a0_n_eq_s:
 li t0, 100
 bne t0, a0, a0_n_eq_d
 addi t1, t1, 1
 a0_n_eq_d:
 li t0, 10
 bne t0, a0, a0_n_eq_enter
 ### store  from map into user results
 li s6, 4
 mul s2, t1, s6
 sub sp, sp, s2
 lw s6, 0(sp)
 add sp, sp, s2
 add s5, s5, s2
 sw s6, 0(s5)
 sub s5, s5, s2
 ###
 mv s2, t1
 j for2
 vozvrat:
 mv t1, s2
 j a0_n_eq_space
 a0_n_eq_enter:
 li t0, 32
 bne t0, a0, a0_n_eq_space
 #### storing -1 into user data
 li s6, 4
 mul s2, t1, s6
 add s5, s5, s2
 li s6, -1
 sw s6, 0(s5)
 sub s5, s5, s2
 ####
 li s11, 1
 mv s2, t1
 j for2
 a0_n_eq_space:
 li s11, 0
 mv a0, t1
  jal ra, pointer
  li a0, 0
 sw a0, 0(s9)
 j loop
 

for2:
li t2, 4
mul t2, t1, t2
sub s8, s8, t2
mv t2, t1
addi t2, t2, 1
li t1, 256
li t4, 32
li t6, 16
div s0, t2, t6
remu s1, t2, t6
bnez s1, n_eq
addi s0, s0, -1
n_eq:
li t6, 3584
mul s0, s0, t6 
addi t2, t2, -1
mul t2, t2, t4  # our coordinate in bites: (x - 1) * 32
add t2, t2, s0
add t2, t3, t2 # global coord
li t4, 8
li t6, 7
lw s4, 0(s8)
for3:
beqz t4, end_for3
addi t4, t4, -1
bnez s11, flag
li s0, 1
beq s0, s4, ediniza
li s0, 2
beq s0, s4, dva
li s0, 3
beq s0, s4, tri
li s0, 4
beq s0, s4, chetverka
li s0, 5
beq s0, s4, five
li s0, 6
beq s0, s4, six
li s0, 7
beq s0, s4, seven
li s0, 8
beq s0, s4, vosem
li s0, -1
beq s0, s4, bimba
li s0, 1263
sw s0, 0(t2)
addi t2, t2, 4
j for3
flag:
print_flag
j for3
bimba:
addi a3, a3, 1
li s0, 16711680
sw s0, 0(t2)
addi t2, t2, 4
j for3
vosem:
print_sq_with_8
j for3
seven:
print_sq_with_7
j for3
six:
print_sq_with_6
j for3
five:
print_sq_with_5
j for3
chetverka:
print_sq_with_4
j for3
tri:
print_sq_with_3
j for3
dva:
print_sq_with_2
j for3
ediniza:
print_sq_with_1
j for3
end_for3:
beqz t6, eq_zero
addi t6, t6, -1
addi t2, t2, 480
li t4, 8
j for3
eq_zero:
mv s8, s7
j vozvrat
end_for2:

end_game:
li t0, 64
div a3, a3, t0
output_int(a3)
new_line
li t0, 256
mv t1, zero
mv t2, zero
li t3, 4
for1_endgame:
beq t0, t1, end_for1
addi t1, t1, 1
lw t4, 0(sp)
lw t5, 0(s5)
beq t5, t4, all_good
addi t2, t2, 1
all_good:
addi sp, sp, -4
addi s5, s5, 4
j for1_endgame
end_for1:
output_int(t2)
new_line
li a7, 10
ecall

pointer:
sw t0, -1240(sp)
sw t1, -1244(sp)
sw t2, -1248(sp)
sw t4, -1252(sp)
sw t5, -1256(sp)
sw t6, -1260(sp)
mv t0, zero
mv t1, zero
mv t2, zero
mv t4, zero
mv t5, zero
mv t6, zero

mv t0, a0 # t0 = our coord
addi t0, t0, 1
li t1, 32
li t2, 16
div t4, t0, t2
remu t5, t0, t2
bnez t5, n_eq_in_pointer
addi t4, t4, -1
n_eq_in_pointer:
li t2, 3584
mul t4, t4, t2
addi t0, t0, -1
mul t0, t0, t1  # our coordinate in butes: (x - 1) * 32
add t0, t0, t4
add t0, t3, t0 # global coord

# painting
li t2, 16776960

#left-high corner
sw t2, 0(t0)#storing new color to bitmap
sw t2, 4(t0)#storing new color to bitmap
sw t2, 512(t0)#storing new color to bitmap

#left-low corner
li t4, 3072
add t0, t0, t4
sw t2, 0(t0)#storing new color to bitmap
addi t0, t0, 512
sw t2, 0(t0)#storing new color to bitmap
sw t2, 4(t0)#storing new color to bitmap
li t4, 3584
sub t0, t0, t4

# right-high corner
sw t2, 24(t0)#storing new color to bitmap
sw t2, 28(t0)#storing new color to bitmap
sw t2, 540(t0)#storing new color to bitmap

# right-low corner
li t4, 3100
add t0, t0, t4
sw t2, 0(t0)#storing new color to bitmap
addi t0, t0, 512
sw t2, 0(t0)#storing new color to bitmap

sw t2, -4(t0)#storing new color to bitmap
li t4, 3612
sub t0, t0, t4

lw t0, -1240(sp)
lw t1, -1244(sp)
lw t2, -1248(sp)
lw t4, -1252(sp)
lw t5, -1256(sp)
lw t6, -1260(sp)
jalr zero 0(ra)


pointer_down:
sw t0, -1240(sp)
sw t1, -1244(sp)
sw t2, -1248(sp)
sw t4, -1252(sp)
sw t5, -1256(sp)
sw t6, -1260(sp)
mv t0, zero
mv t1, zero
mv t2, zero
mv t4, zero
mv t5, zero
mv t6, zero

mv t0, a2 # t0 = our coord
addi t0, t0, 1
li t1, 32
li t2, 16
div t4, t0, t2
remu t5, t0, t2
bnez t5, n_eq_in_pointer_down
addi t4, t4, -1
n_eq_in_pointer_down:
li t2, 3584
mul t4, t4, t2
addi t0, t0, -1
mul t0, t0, t1  # our coordinate in butes: (x - 1) * 32
add t0, t0, t4
add t0, t3, t0 # global coord

lw t2, 1024(t0)

#left-high corner
sw t2, 0(t0)#storing old color to bitmap

sw t2, 4(t0)#storing old color to bitmap

sw t2, 512(t0)#storing new color to bitmap

#left-low corner
li t4, 3072
add t0, t0, t4
sw t2, 0(t0)#storing old color to bitmap

addi t0, t0, 512
sw t2, 0(t0)#storing old color to bitmap

sw t2, 4(t0)#storing old color to bitmap
li t4, 3584
sub t0, t0, t4

# right-high corner
sw t2, 24(t0)#storing old color to bitmap
sw t2, 28(t0)#storing old color to bitmap
sw t2, 540(t0)#storing old color to bitmap

# right-low corner
li t4, 3100
add t0, t0, t4
sw t2, 0(t0)#storing old color to bitmap
addi t0, t0, 512

sw t2, 0(t0)#storing old color to bitmap

sw t2, -4(t0)#storing old color to bitmap

li t4, 3612
sub t0, t0, t4

lw t0, -1240(sp)
lw t1, -1244(sp)
lw t2, -1248(sp)
lw t4, -1252(sp)
lw t5, -1256(sp)
lw t6, -1260(sp)
jalr zero 0(ra)
