addi $5, $0, 20000 // delay_total
addi $2, $0, 0 // high score
j reset_game
delay_start:
    addi $4, $0, 0
    delay_loop:
        addi $4, $4, 1
        bne $4, $5, delay_loop
    jr $31
reset_game:
    addi $20, $0, 0
    addi $21, $0, 0
    addi $22, $0, 0
    addi $23, $0, 0
    addi $24, $0, 0
    addi $25, $0, 0
    addi $26, $0, 0
    addi $27, $0, 0
lights:
    addi $20, $0, 1
    addi $27, $0, 1
    addi $21, $0, 1
    addi $26, $0, 1
    addi $22, $0, 1
    addi $25, $0, 1
    addi $23, $0, 1
    addi $24, $0, 1
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
clear_lights:
    addi $20, $0, 0
    addi $21, $0, 0
    addi $22, $0, 0
    addi $23, $0, 0
    addi $24, $0, 0
    addi $25, $0, 0
    addi $26, $0, 0
    addi $27, $0, 0
    addi $1, $0, 0
    addi $3, $0, 0 // total moles
    addi $4, $0, 0
    addi $6, $0, 2
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    jal delay_start
    addi $20, $0, 1000000
    j monitor_score
monitor_score:
    monitor 0
    score 0
    nop
    monitor 1
    score 1
    nop
    monitor 2
    score 2
    nop
    monitor 3
    score 3
    nop
    monitor 4
    score 4
    nop
    monitor 5
    score 5
    nop
    monitor 6
    score 6
    nop
    monitor 7
    score 7
    nop
    jal decrease_lifetime
    jal count_moles
    blt $6, $0, game_over
    bne $3, $0, monitor_score
    j spawn_mole // if we have no moles, spawn one
spawn_mole:
jal delay_start
jal delay_start
jal delay_start
jal delay_start
jal delay_start
srmole 12500
j monitor_score
decrease_lifetime:
    sw $31, 0($0)
    bne $20, $0, decrease_0
    finish_decrease_0:
    bne $21, $0, decrease_1
    finish_decrease_1:
    bne $22, $0, decrease_2
    finish_decrease_2:
    bne $23, $0, decrease_3
    finish_decrease_3:
    bne $24, $0, decrease_4
    finish_decrease_4:
    bne $25, $0, decrease_5
    finish_decrease_5:
    bne $26, $0, decrease_6
    finish_decrease_6:
    bne $27, $0, decrease_7
    finish_decrease_7:
    lw $31, 0($0)
    jr $31
    decrease_0:
        addi $20, $20, -1
        bne $20, $0, finish_decrease_0
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_0
    decrease_1:
        addi $21, $21, -1
        bne $21, $0, finish_decrease_1
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_1
    decrease_2:
        addi $22, $22, -1
        bne $22, $0, finish_decrease_2
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_2
    decrease_3:
        addi $23, $23, -1
        bne $23, $0, finish_decrease_3
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_3
    decrease_4:
        addi $24, $24, -1
        bne $24, $0, finish_decrease_4
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_4
    decrease_5:
        addi $25, $25, -1
        bne $25, $0, finish_decrease_5
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_5
    decrease_6:
        addi $26, $26, -1
        bne $26, $0, finish_decrease_6
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_6
    decrease_7:
        addi $27, $27, -1
        bne $27, $0, finish_decrease_7
        addi $6, $6, -1
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        jal delay_start
        srmole 12500
        j finish_decrease_7
count_moles:
    addi $3, $0, 0 // reset the total moles counted
    bne $20, $0, count_mole_0
    finish_count_mole_0:
    bne $21, $0, count_mole_1
    finish_count_mole_1:
    bne $22, $0, count_mole_2
    finish_count_mole_2:
    bne $23, $0, count_mole_3
    finish_count_mole_3:
    bne $24, $0, count_mole_4
    finish_count_mole_4:
    bne $25, $0, count_mole_5
    finish_count_mole_5:
    bne $26, $0, count_mole_6
    finish_count_mole_6:
    bne $27, $0, count_mole_7
    finish_count_mole_7:
    jr $31
    count_mole_0:
    addi $3, $3, 1
    j finish_count_mole_0
    count_mole_1:
    addi $3, $3, 1
    j finish_count_mole_1
    count_mole_2:
    addi $3, $3, 1
    j finish_count_mole_2
    count_mole_3:
    addi $3, $3, 1
    j finish_count_mole_3
    count_mole_4:
    addi $3, $3, 1
    j finish_count_mole_4
    count_mole_5:
    addi $3, $3, 1
    j finish_count_mole_5
    count_mole_6:
    addi $3, $3, 1
    j finish_count_mole_6
    count_mole_7:
    addi $3, $3, 1
    j finish_count_mole_7

game_over:
    blt $2, $1, update_high_score
    j reset_game
update_high_score:
    add $2, $1, $0
    addi $20, $0, 0
    addi $21, $0, 0
    addi $22, $0, 0
    addi $23, $0, 0
    addi $24, $0, 0
    addi $25, $0, 0
    addi $26, $0, 0
    addi $27, $0, 0

    addi $20, $0, 1
    jal delay_start
    addi $21, $0, 1
    jal delay_start
    addi $22, $0, 1
    jal delay_start
    addi $23, $0, 1
    jal delay_start
    addi $24, $0, 1
    jal delay_start
    addi $25, $0, 1
    jal delay_start
    addi $26, $0, 1
    jal delay_start
    addi $27, $0, 1
    jal delay_start

    addi $20, $0, 0
    jal delay_start
    addi $21, $0, 0
    jal delay_start
    addi $22, $0, 0
    jal delay_start
    addi $23, $0, 0
    jal delay_start
    addi $24, $0, 0
    jal delay_start
    addi $25, $0, 0
    jal delay_start
    addi $26, $0, 0
    jal delay_start
    addi $27, $0, 0
    jal delay_start
    j reset_game