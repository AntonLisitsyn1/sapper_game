.data
.macro filler
li t0, 0x10040000 # adress of bitmap display
li t1, 8947855 # map`s color 
# map size = 16 * 16 (512*512, each unit is 1)
li t2, 16384
fill_the_map:
beqz t2, end_fill
addi t2, t2, -1
sw t1, 0(t0)
addi t0, t0, 4
j fill_the_map
end_fill: 
.end_macro 
