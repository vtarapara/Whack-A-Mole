addi $25, $0, 1
monitor_score:
monitor 0
score 0
bs mole_hit
nop
monitor 1
score 1
bs mole_hit
nop
monitor 2
score 2
bs mole_hit
nop
monitor 3
score 3
bs mole_hit
nop
monitor 4
score 4
bs mole_hit
nop
monitor 5
score 5
bs mole_hit
nop
monitor 6
score 6
bs mole_hit
nop
monitor 7
score 7
bs mole_hit
nop
j monitor_score
mole_hit:
srmole 0
j monitor_score
