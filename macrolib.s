.data
  .macro input_int(%x)
    li a7, 5
    ecall
    mv %x, a0
  .end_macro
  
  .macro new_line
    li a7, 11
    li a0, '\n'
    ecall
  .end_macro

  .macro randomizing(%x)
li a7, 41
ecall
mv %x, a0
  .end_macro 

 .macro output_int(%x)
  li a7, 1
  mv a0, %x
  ecall
  .end_macro 

  .macro print_sq_with_1

# paint 1
li s10, 4
bne s10, t4, n_eq5
li s10, 0
beq s10, t6, n_eq5
li s10, 1
beq s10, t6, n_eq5
li s10, 6
beq s10, t6, n_eq5
li s10, 7
beq s10, t6, n_eq5
li s10, -1
sw s10, 0(t2)
j add_p
n_eq5:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p:
addi t2, t2, 4
.end_macro 

.macro print_sq_with_2
# paint 2
beqz t6, n_paint2 # if t6 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint2 # if t6 eq 7 -  paint nothing
li s10, 5
bne s10, t4, t4_n_eq_5_v2
bne s10, t6, t6_n_eq_5_t4_eq_5_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_5_t4_eq_5_v2:
li s10, 1
bne s10, t6, t4_n_eq_5_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t4_n_eq_5_v2:
li s10, 4
bne s10, t4, t4_n_eq_4_v2
li s10, 6
bne s10, t6, t6_n_eq_6_t4_eq_4_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_6_t4_eq_4_v2:
li s10, 2
bne s10, t6, t6_n_eq_2_t4_eq_4_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_2_t4_eq_4_v2:
li s10, 1
bne s10, t6, t4_n_eq_4_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t4_n_eq_4_v2:
li s10, 3
bne s10, t4, t4_n_eq_3_v2
li s10, 6
bne s10, t6, t6_n_eq_6_t4_eq_3_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_6_t4_eq_3_v2:
li s10, 3
bne s10, t6, t6_n_eq_3_t4_eq_3_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_3_t4_eq_3_v2:
li s10, 1
bne s10, t6, t4_n_eq_3_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t4_n_eq_3_v2:
li s10, 2
bne s10, t4, n_paint2
li s10, 5
bne s10, t6, t6_n_eq_5_t4_eq_2_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_5_t4_eq_2_v2:
li s10, 4
bne s10, t6, t6_n_eq_4_t4_eq_2_v2
li s10, -1
sw s10, 0(t2)
j add_p2
t6_n_eq_4_t4_eq_2_v2:
li s10, 1
bne s10, t6, n_paint2
li s10, -1
sw s10, 0(t2)
j add_p2
n_paint2:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p2:
addi t2, t2, 4

.end_macro 

.macro print_sq_with_3
# paint 2
beqz t6, n_paint3 # if t6 eq 0 -  paint nothing
li s10, 1
beq s10, t6, n_paint3 # if t6 eq 1 -  paint nothing
li s10, 7
beq s10, t6, n_paint3 # if t6 eq 7 -  paint nothing

li s10, 4
bne s10, t4, t4_n_eq_4_v3
li s10, 2
bne s10, t6, t6_n_eq_2_t4_eq_4_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t6_n_eq_2_t4_eq_4_v3:
li s10, 4
bne s10, t6, t6_n_eq_4_t4_eq_4_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t6_n_eq_4_t4_eq_4_v3:
li s10, 6
bne s10, t6, t4_n_eq_4_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t4_n_eq_4_v3:
li s10, 3
bne s10, t4, t4_n_eq_3_v3
li s10, 2
bne s10, t6, t6_n_eq_2_t4_eq_3_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t6_n_eq_2_t4_eq_3_v3:
li s10, 4
bne s10, t6, t6_n_eq_4_t4_eq_3_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t6_n_eq_4_t4_eq_3_v3:
li s10, 6
bne s10, t6, t4_n_eq_3_v3
li s10, -1
sw s10, 0(t2)
j add_p3
t4_n_eq_3_v3:
li s10, 2
bne s10, t4, n_paint3
li s10, -1
sw s10, 0(t2)
j add_p3
n_paint3:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p3:
addi t2, t2, 4
.end_macro

.macro print_sq_with_4
# paint 4
beqz t6, n_paint4 # if t6 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint4 # if t6 eq 7 -  paint nothing

li s10, 5
bne s10, t4, t4_n_eq_5_v4
li s10, 4
bne s10, t6, t6_n_eq_4_t4_eq_5_v4
li s10, -1
sw s10, 0(t2)
j add_p4
t6_n_eq_4_t4_eq_5_v4:
li s10, 5
bne s10, t6, t6_n_eq_5_t4_eq_5_v4
li s10, -1
sw s10, 0(t2)
j add_p4
t6_n_eq_5_t4_eq_5_v4:
li s10, 6
bne s10, t6, t4_n_eq_5_v4
li s10, -1
sw s10, 0(t2)
j add_p4

t4_n_eq_5_v4:
li s10, 4
bne s10, t4, t4_n_eq_4_v4
li s10, 4
bne s10, t6, t4_n_eq_4_v4
li s10, -1
sw s10, 0(t2)
j add_p4
t4_n_eq_4_v4:
li s10, 3
bne s10, t4, n_paint4
li s10, 1
beq s10, t6, n_paint4
li s10, -1
sw s10, 0(t2)
j add_p4
n_paint4:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p4:
addi t2, t2, 4
.end_macro 

.macro print_sq_with_5
# paint 5
beqz t6, n_paint5 # if t6 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint5 # if t6 eq 7 -  paint nothing
li s10, 6
beq s10, t6, n_paint5  # if t6 eq 6 -  paint nothing
li s10, 5
bne s10, t4, t4_n_eq_5_v5
li s10, 2
beq s10, t6, t4_n_eq_5_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t4_n_eq_5_v5:
li s10, 4
bne s10, t4, t4_n_eq_4_v5
li s10, 1
bne s10, t6, t6_n_eq_1_t4_eq_4_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t6_n_eq_1_t4_eq_4_v5:
li s10, 3
bne s10, t6, t6_n_eq_3_t4_eq_4_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t6_n_eq_3_t4_eq_4_v5:
li s10, 5
bne s10, t6, t4_n_eq_4_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t4_n_eq_4_v5:
li s10, 3
bne s10, t4, t4_n_eq_3_v5
li s10, 1
bne s10, t6, t6_n_eq_1_t4_eq_3_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t6_n_eq_1_t4_eq_3_v5:
li s10, 3
bne s10, t6, t6_n_eq_3_t4_eq_3_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t6_n_eq_3_t4_eq_3_v5:
li s10, 5
bne s10, t6, t4_n_eq_3_v5
li s10, -1
sw s10, 0(t2)
j add_p5
t4_n_eq_3_v5:
li s10, 2
bne s10, t4, n_paint5
li s10, 4
beq s10, t6, n_paint5
li s10, -1
sw s10, 0(t2)
j add_p5
n_paint5:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p5:
addi t2, t2, 4

.end_macro 

.macro print_sq_with_6
# paint 5
beqz t6, n_paint6 # if t6 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint6 # if t6 eq 7 -  paint nothing
li s10, 6
beq s10, t6, n_paint6  # if t6 eq 6 -  paint nothing

li s10, 5
bne s10, t4, t4_n_eq_5_v6
li s10, -1
sw s10, 0(t2)
j add_p6

t4_n_eq_5_v6:
li s10, 4
bne s10, t4, t4_n_eq_4_v6
li s10, 1
bne s10, t6, t6_n_eq_1_t4_eq_4_v6
li s10, -1
sw s10, 0(t2)
j add_p6
t6_n_eq_1_t4_eq_4_v6:
li s10, 3
bne s10, t6, t6_n_eq_3_t4_eq_4_v6
li s10, -1
sw s10, 0(t2)
j add_p6
t6_n_eq_3_t4_eq_4_v6:
li s10, 5
bne s10, t6, t4_n_eq_4_v6
li s10, -1
sw s10, 0(t2)
j add_p6

t4_n_eq_4_v6:
li s10, 3
bne s10, t4, t4_n_eq_3_v6
li s10, 1
bne s10, t6, t6_n_eq_1_t4_eq_3_v6
li s10, -1
sw s10, 0(t2)
j add_p6
t6_n_eq_1_t4_eq_3_v6:
li s10, 3
bne s10, t6, t6_n_eq_3_t4_eq_3_v6
li s10, -1
sw s10, 0(t2)
j add_p6
t6_n_eq_3_t4_eq_3_v6:
li s10, 5
bne s10, t6, t4_n_eq_3_v6
li s10, -1
sw s10, 0(t2)
j add_p6

t4_n_eq_3_v6:
li s10, 2
bne s10, t4, n_paint6
li s10, 4
beq s10, t6, n_paint6
li s10, -1
sw s10, 0(t2)
j add_p6
n_paint6:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p6:
addi t2, t2, 4

.end_macro 

.macro print_sq_with_7
# paint 7
beqz t6, n_paint7 # if t6 eq 0 -  paint nothing
beqz t4, n_paint7 # if t4 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint7 # if t6 eq 7 -  paint nothing
beq s10, t4, n_paint7 # if t4 eq 7 -  paint nothing
li s10, 6
beq s10, t4, n_paint7 # if t4 eq 6 -  paint nothing
li s10, 1
beq s10, t4, n_paint7 # if t4 eq 1 -  paint nothing

li s10, 6
bne s10, t6, t6_n_eq_6_v7
li s10, -1
sw s10, 0(t2)
j add_p7

t6_n_eq_6_v7:
li s10, 2
bne s10, t4, n_paint7
li s10, -1
sw s10, 0(t2)
j add_p7

n_paint7:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p7:
addi t2, t2, 4

.end_macro 

.macro print_sq_with_8
# paint 7
beqz t6, n_paint8 # if t6 eq 0 -  paint nothing
beqz t4, n_paint8 # if t4 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint8 # if t6 eq 7 -  paint nothing
beq s10, t4, n_paint8 # if t4 eq 7 -  paint nothing
li s10, 6
beq s10, t4, n_paint8 # if t4 eq 6 -  paint nothing
li s10, 1
beq s10, t4, n_paint8 # if t4 eq 1 -  paint nothing

li s10, 6
bne s10, t6, t6_n_eq_6_v8
li s10, -1
sw s10, 0(t2)
j add_p8

t6_n_eq_6_v8:
li s10, 4
bne s10, t6, t6_n_eq_4_v8
li s10, -1
sw s10, 0(t2)
j add_p8

t6_n_eq_4_v8:
li s10, 1
bne s10, t6, t6_n_eq_1_v8
li s10, -1
sw s10, 0(t2)
j add_p8

t6_n_eq_1_v8:
li s10, 2
bne s10, t4, t4_n_eq_2_v8
li s10, -1
sw s10, 0(t2)
j add_p8

t4_n_eq_2_v8:
li s10, 5
bne s10, t4, n_paint8
li s10, -1
sw s10, 0(t2)
j add_p8

n_paint8:
addi s10, s4, 1
mul s10, s10, t5
sw s10, 0(t2)
add_p8:
addi t2, t2, 4

.end_macro 

.macro print_flag
beqz t6, n_paint_flag # if t6 eq 0 -  paint nothing
beqz t4, n_paint_flag # if t4 eq 0 -  paint nothing
li s10, 7
beq s10, t6, n_paint_flag # if t6 eq 7 -  paint nothing
beq s10, t4, n_paint_flag # if t4 eq 7 -  paint nothing

li s10, 1
bne s10, t6, t6_n_eq_1_flag
li s10, 0
sw s10, 0(t2)
j add_flag

t6_n_eq_1_flag:
li s10, 2
bne s10, t6, t6_n_eq_2_flag
li s10, 5
bne s10, t4, t4_n_eq_5_t6_eq_2_flag
li s10, 0
sw s10, 0(t2)
j add_flag
t4_n_eq_5_t6_eq_2_flag:
li s10, 4
bne s10, t4, t4_n_eq_4_t6_eq_2_flag
li s10, 0
sw s10, 0(t2)
j add_flag
t4_n_eq_4_t6_eq_2_flag:
li s10, 3
bne s10, t4, t4_n_eq_3_t6_eq_2_flag
li s10, 0
sw s10, 0(t2)
j add_flag
t4_n_eq_3_t6_eq_2_flag:
li s10, 2
bne s10, t4, t6_n_eq_2_flag
li s10, 0
sw s10, 0(t2)
j add_flag

t6_n_eq_2_flag:
li s10, 3
bne s10, t6, t6_n_eq_3_flag
li s10, 4
bne s10, t4, t6_n_eq_3_flag
li s10, -1
sw s10, 0(t2)
j add_flag

t6_n_eq_3_flag:
li s10, 4
bne s10, t6, t6_n_eq_4_flag
li s10, 4
bne s10, t4, t4_n_eq_4_t6_eq_4_flag
li s10, -1
sw s10, 0(t2)
j add_flag
t4_n_eq_4_t6_eq_4_flag:
li s10, 3
bne s10, t4, t6_n_eq_4_flag
li s10, 16711680
sw s10, 0(t2)
j add_flag

t6_n_eq_4_flag:
li s10, 5
bne s10, t6, t6_n_eq_5_flag
li s10, 4
bne s10, t4, t4_n_eq_4_t6_eq_5_flag
li s10, -1
sw s10, 0(t2)
j add_flag
t4_n_eq_4_t6_eq_5_flag:
li s10, 3
bne s10, t4, t4_n_eq_3_t6_eq_5_flag
li s10, 16711680
sw s10, 0(t2)
j add_flag
t4_n_eq_3_t6_eq_5_flag:
li s10, 2
bne s10, t4, t6_n_eq_5_flag
li s10, 16711680
sw s10, 0(t2)
j add_flag

t6_n_eq_5_flag:
li s10, 6
bne s10, t6, n_paint_flag
li s10, 4
bne s10, t4, t4_n_eq_4_t6_eq_6_flag
li s10, -1
sw s10, 0(t2)
j add_flag
t4_n_eq_4_t6_eq_6_flag:
li s10, 3
bne s10, t4, n_paint_flag
li s10, 16711680
sw s10, 0(t2)
j add_flag

n_paint_flag:
li s10, 255
sw s10, 0(t2)
add_flag:
addi t2, t2, 4
.end_macro 
