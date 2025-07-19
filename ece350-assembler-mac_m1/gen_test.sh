#!/bin/bash

# Using the first command-line argument as the target
target="$1"

# Run the asm script with the target as input
./asm -i "ci.csv" -r "cr.csv" "scripts/$target.s"

cp "scripts/$target.s" "../processor/Test Files/Assembly Files/$target.s"
cp "scripts/$target.mem" "../processor/Test Files/Memory Files/$target.mem"


# if [ ! -f "../processor/Test Files/Verification Files/${target}_exp.txt" ]; then
#     cp "sample_exp.txt" "../processor/Test Files/Verification Files/${target}_exp.txt"
# fi
